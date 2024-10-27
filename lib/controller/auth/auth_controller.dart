import 'dart:convert';
import 'package:fiber/client/base_client.dart';
import 'package:fiber/client/sas_client.dart';
import 'package:fiber/config/constant.dart';
import 'package:fiber/controller/set_data_controller.dart';
import 'package:fiber/main.dart';
import 'package:fiber/view/auth/login_page.dart';
import 'package:fiber/view/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../client/encrypt.dart';
import '../../view/navigation/navigation_page.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isShow = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  // lat and long
  Rx lattitude = 0.0.obs;
  Rx longitude = 0.0.obs;
  RxBool isRequest = false.obs;
  RxBool locationSelected = false.obs;

  Future<Tuple2<bool, dynamic>> register({
    required String mobile,
    String? email,
    required String fullName,
    required String addressController,
  }) async {
    isLoading.value = true;
    var data = {
      "email": email,
      "mobile": mobile,
      "name": fullName,
      "address": addressController,
      "lat": lattitude.value,
      "long": longitude.value,
    };

    Tuple2<bool, dynamic> response = await BaseClient.post(
      api: '/requests',
      data: data,
    );

    if (response.item1) {
      Get.back();
      Get.snackbar("تمت العملية", "تمت عملية طلب الخدمة بنجاح",
          margin: EdgeInsets.all(Insets.margin),
          backgroundColor: Get.theme.colorScheme.primary,
          colorText: Colors.white);

      prefs.setString('requested', "yes");
      isRequest.value = true;
    }

    isLoading.value = false;
    return response;
  }

  Future<Tuple2<bool, dynamic>> login(
      {required String email, required String password}) async {
    isLoading.value = true;
    var data = {"username": email, "password": password, "language": "en"};

    final passphrase = 'abcdefghijuklmno0123456789012345';

    final encryptedData = encryptAESCryptoJS(jsonEncode(data), passphrase);

    Tuple2<bool, dynamic> response = await SasClient.post(
      api: '/api/auth/login',
      data: {
        "payload": encryptedData,
      },
    );

    if (response.item1) {
      prefs.setString('token', response.item2['token']);
      Get.offAll(() => SplashPage(), transition: Transition.fadeIn);
    }
    isLoading.value = false;
    return response;
  }

  autoLogin() async {
    var request = await SasClient.get(api: '/api/auth/autoLogin');
    prefs.setString("token", request["token"]);
    Get.offAll(() => SplashPage(), transition: Transition.fadeIn);
  }

  Future logout() async {
    prefs.remove('token');
    prefs.remove('role');
    SetDataController dataController = Get.find();
    dataController.page.value = 0;
    Get.offAll(() => const SplashPage(), transition: Transition.fadeIn);
  }
}
