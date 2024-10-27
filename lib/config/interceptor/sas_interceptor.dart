// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:fiber/main.dart';
import 'package:fiber/view/splash/splash_page.dart';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:fiber/config/constant.dart';
import 'package:get/get.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';
import '../../client/get_endpoint_url.dart';

class SasHttp extends GetxController {
  Dio dio = Dio();
  RxString url = ''.obs;

  SassEndpoint endpoint = SassEndpoint();

  @override
  void onInit() {
    super.onInit();
    configureDio();
  }

  getSassUrl() async {
    url.value = await endpoint.getEndpoint() ?? "";
  }

  configureDio() async {
    await getSassUrl();
    dio
      ..options.baseUrl = '${url.value}/user/api/index.php'
      ..options.connectTimeout = const Duration(seconds: 120)
      ..options.receiveTimeout = const Duration(seconds: 120)
      ..options.contentType = 'application/json; charset=utf-8'
      ..options.headers = {
        "accept": "*/*",
        "Content-Type": "application/x-www-form-urlencoded"
      };
    dio.interceptors.add(AwesomeDioInterceptor());

    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      String? token = prefs.getString('token');

      options.headers.addAll({
        HttpHeaders.authorizationHeader: "Bearer $token",
      });

      // Logger()
      //     .d('${options.queryParameters}\n ${options.path} \n ${options.data}');

      return handler.next(options); //continue
    }, onResponse: (response, handler) async {
      handleResponse(response);

      return handler.next(response);
    }, onError: (DioError e, handler) async {
      handleError(e);

      return handler.next(e); //continue
    }));
  }

  void handleResponse(response) {
    if (response.statusCode == 401) {
      handleUnauthorized();
    }
  }

  void handleError(DioError e) {
    if (e.message?.contains('The request connection took longer') == true) {
      noti('Check Your Network Connections'.tr, "حدث مشكلة في الاتصال بالمزود");
    }
    if (e.response?.statusCode == 401) {
      handleUnauthorized();
    } else if (e.response?.statusCode == 400) {
      handleBadRequest(e);
    } else if (e.response?.statusCode == 403) {
      noti('Error'.tr, "حدث مشكلة في الاتصال بالمزود");
    } else if (e.response?.statusCode == 500) {
      noti('Error'.tr, "حدث مشكلة في الاتصال بالمزود");
    } else {
      try {
        noti('Error'.tr, "حدث مشكلة في الاتصال بالمزود");
      } catch (s) {
        noti('Error'.tr, s.toString());
      }

      Logger().d(e.response?.statusCode);
      Logger().d(e.response?.data);
    }
  }

  void handleUnauthorized() async {
    noti('خطأ'.tr, "لم يتم العثور على المستخدم");
    prefs.remove('token');
    prefs.remove('role');
    // OneSignal.shared.removeExternalUserId();
  }

  void handleBadRequest(DioError e) {
    try {
      final errorMessage = e.response!.data['message'];
      noti('خطأ'.tr, "حدث مشكلة في الاتصال بالمزود");
    } catch (s) {
      noti('خطأ'.tr, "حدث مشكلة في الاتصال بالمزود");
    }
    Logger().e(e.response?.data);
  }
}
