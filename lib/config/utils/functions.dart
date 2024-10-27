import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart' as en;

import 'package:fiber/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant.dart';

String makeDate(DateTime? date) {
  return DateFormat('yyyy-MM-dd').format(date ?? DateTime.now());
}

String makeTime(DateTime? date) {
  return DateFormat('h:m a').format(date ?? DateTime.now());
}

String getStringOrDefault(String? inputString, [String defaultString = '-']) {
  if (inputString == null || inputString.isEmpty) {
    return defaultString;
  } else {
    return inputString;
  }
}

String formatCurrency(double amount) {
  final NumberFormat formatter = NumberFormat.decimalPattern('ar_IQ');
  return formatter.format(amount) + " IQ".tr;
}

Tuple2<String, Color> getStatus(int? status) {
  switch (status) {
    case 0:
      return Tuple2('مفتوح'.tr, Colors.blue);
    case 1:
      return Tuple2('معلق'.tr, Colors.orange);
    case 2:
      return Tuple2('تم الحل'.tr, Colors.green);
    case 3:
      return Tuple2('مغلق'.tr, Colors.red);
    default:
      return Tuple2('مفتوح'.tr, Colors.blue);
  }
}

Future<void> launchUrls(Uri url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

void changeTheme(bool isDark) {
  if (isDark == false) {
    prefs.setBool('darkTheme', false);
    Get.changeThemeMode(ThemeMode.light);
  } else {
    prefs.setBool('darkTheme', true);
    Get.changeThemeMode(ThemeMode.dark);
  }
}

int delayValue(int index, int perPage, int? timeOfIndex,
    {int? maxDelay = 1000}) {
  int delayMultiplier = timeOfIndex ?? 70;
  int maxDelays = maxDelay ?? 1000;

  int itemNumberInPage =
      index % perPage + 1; // Calculate item number within the page

  int delay = itemNumberInPage * delayMultiplier;

  // Cap the delay at the maximum value
  int cappedDelay = min(delay, maxDelays);
  // Logger().d("cappedDelay => $cappedDelay");
  return cappedDelay;
}

bool checkLocal() {
  return Get.locale!.languageCode == 'ar' ? true : false;
}

SnackbarController noti(title, body, {Function(GetSnackBar)? onTap}) {
  SnackbarController x = Get.snackbar(
    title,
    body,
    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
    colorText: Theme.of(Get.context!).colorScheme.onBackground,
    icon: Icon(
      Icons.notifications,
      color: Theme.of(Get.context!).colorScheme.primary,
    ),
    backgroundColor: Theme.of(Get.context!).colorScheme.background,
    borderRadius: 10,
    boxShadows: [defaultShadow],
    onTap: onTap,
  );
  return x;
}

String encrypt(String data) {
  var myKey = "VishnuTestKeyIsHereLongValid32Ch";

  final encrypter =
      en.Encrypter(en.AES(en.Key.fromUtf8(myKey), mode: en.AESMode.cbc));
  final iv = en.IV.fromUtf8("1234567890123456");
  var encrypted = encrypter.encrypt(data, iv: iv);
  var encryptedString = encrypted.base64;
  print(encryptedString);
  return encrypted.base64;
}
