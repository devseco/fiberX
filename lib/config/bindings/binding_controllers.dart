// ignore_for_file: unused_local_variable

import 'package:fiber/config/interceptor/dio_interceptor.dart';
import 'package:fiber/config/interceptor/sas_interceptor.dart';
import 'package:fiber/controller/ads/ads_controller.dart';
import 'package:fiber/controller/auth/auth_controller.dart';
import 'package:fiber/controller/file_controller.dart';
import 'package:fiber/controller/notification/notification_controller.dart';
import 'package:fiber/controller/set_data_controller.dart';
import 'package:fiber/controller/news/news_controller.dart';

import 'package:get/get.dart';

class BindingsController extends Bindings {
  @override
  void dependencies() {
    DioHttp dioHttp = Get.put(DioHttp());
    SasHttp sasHttp = Get.put(SasHttp());
    SetDataController dataController = Get.put(SetDataController());
    AuthController authController = Get.put(AuthController());
    FileController fileController = Get.put(FileController());
    Get.lazyPut(() => NotificationController(), fenix: true);
    Get.lazyPut(() => NewsController(), fenix: true);
    Get.lazyPut(() => AdsController(), fenix: true);
  }
}
