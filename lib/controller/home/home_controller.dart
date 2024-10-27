import 'dart:convert';

import 'package:fiber/client/sas_client.dart';
import 'package:fiber/config/constant.dart';
import 'package:fiber/models/invoice_model.dart';
import 'package:fiber/models/service_model.dart';
import 'package:fiber/models/dashboard_model.dart';

import 'package:fiber/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:uuid/uuid.dart';

import '../../client/encrypt.dart';
import '../../main.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool loadUser = false.obs;
  RxBool loadInvoice = false.obs;
  Rx<ServiceModel> serviceInfo = ServiceModel().obs;
  Rx<UserModel> userInfo = UserModel().obs;
  RxList<InvoiceModel> invoiceList = <InvoiceModel>[].obs;
  RxBool activePinLoading = false.obs;
  RxBool redeemLoading = false.obs;
  RxBool activeWithoutReedemLoading = false.obs;
  Rx<DashboardModel> dashboardModel = DashboardModel().obs;

  getServiceInfo() async {
    var token = prefs.getString('token');
    if (token != null) {
      isLoading.value = true;
      final response = await SasClient.get(api: '/api/service');
      serviceInfo.value = serviceModelFromJson(jsonEncode(response["data"]));
      isLoading.value = false;
    }
  }

  getUserInfo() async {
    var token = prefs.getString('token');
    if (token != null) {
      loadUser.value = true;
      final response = await SasClient.get(api: '/api/user');
      userInfo.value = userModelFromJson(jsonEncode(response["data"]));
      loadUser.value = false;
    }
  }

  getDashboardInfo() async {
    var token = prefs.getString('token');
    if (token != null) {
      final response = await SasClient.get(api: "/api/dashboard");
      dashboardModel.value =
          dashboardModelFromJson(jsonEncode(response["data"]));
    }
  }

  activeWithoutReedem() async {
    activeWithoutReedemLoading.value = true;
    var token = prefs.getString('token');

    if (token != null) {
      // check if user have enough balance for active service

      if (userInfo.value.balance! < serviceInfo.value.price!) {
        Get.snackbar("عذرا", "رصيدك غير كافي",
            margin: EdgeInsets.all(Insets.margin),
            backgroundColor: Get.theme.colorScheme.error,
            colorText: Colors.white);
        activeWithoutReedemLoading.value = false;
        return;
      }

      final passphrase = 'abcdefghijuklmno0123456789012345';
      var uuid = Uuid();

      var secondData = {"uuid": uuid.v1(), "current_password": true};

      final encryptedData2 =
          encryptAESCryptoJS(jsonEncode(secondData), passphrase);

      SasClient.post(
        api: '/api/user/activate',
        data: {
          "payload": encryptedData2,
        },
      ).then((value) {
        if (value.item1) {
          if (value.item2["status"] == 200) {
            Get.back();
            Get.snackbar("تمت العملية", "تمت  عملية التفعيل بنجاح",
                margin: EdgeInsets.all(Insets.margin),
                backgroundColor: Get.theme.colorScheme.primary,
                colorText: Colors.white);
            getServiceInfo();
            getUserInfo();
          } else {
            Get.snackbar("خطأ", "حدث خطأ ما",
                margin: EdgeInsets.all(Insets.margin),
                backgroundColor: Get.theme.colorScheme.error,
                colorText: Colors.white);
          }
        }
      });
    }

    activeWithoutReedemLoading.value = false;
  }

  addReedem({required String pin}) async {
   
    var token = prefs.getString('token');
    if (token != null) {
      redeemLoading.value = true;
      var data = {"pin": pin};
      final passphrase = 'abcdefghijuklmno0123456789012345';
      // close bottom sheet
      final encryptedData = encryptAESCryptoJS(jsonEncode(data), passphrase);

      final response = await SasClient.post(
        api: '/api/redeem',
        data: {
          "payload": encryptedData,
        },
      );
      if (response.item1) {
        if (response.item2["status"] == 200) {
          Get.back();

          Get.snackbar("تمت العملية", "تمت  عملية التعبئة بنجاح",
              margin: EdgeInsets.all(Insets.margin),
              backgroundColor: Get.theme.colorScheme.primary,
              colorText: Colors.white);
          getUserInfo();
        }
        redeemLoading.value = false;
      }
    }
  }

  activePin({required String pin}) async {
    var token = prefs.getString('token');
    if (token != null) {
      activePinLoading.value = true;
      var data = {"pin": pin};
      final passphrase = 'abcdefghijuklmno0123456789012345';
      // close bottom sheet
      final encryptedData = encryptAESCryptoJS(jsonEncode(data), passphrase);

      final response = await SasClient.post(
        api: '/api/redeem',
        data: {
          "payload": encryptedData,
        },
      );
      if (response.item1) {
        if (response.item2["status"] == 200) {
          Get.back();
            Get.snackbar("تمت العملية", "تمت  عملية التعبئة بنجاح",
                margin: EdgeInsets.all(Insets.margin),
                backgroundColor: Get.theme.colorScheme.primary,
                colorText: Colors.white);
            getServiceInfo();
            getUserInfo();
       
            // var uuid = Uuid();

            // var secondData = {"uuid": uuid.v1(), "current_password": true};

            // final encryptedData2 =
            //     encryptAESCryptoJS(jsonEncode(secondData), passphrase);

            // SasClient.post(
            //   api: '/api/user/activate',
            //   data: {
            //     "payload": encryptedData2,
            //   },
            // ).then((value) {
            //   if (value.item1) {
            //     if (value.item2["status"] == 200) {
            //       Get.back();
            //       Get.snackbar("تمت العملية", "تمت  عملية التفعيل بنجاح",
            //           margin: EdgeInsets.all(Insets.margin),
            //           backgroundColor: Get.theme.colorScheme.primary,
            //           colorText: Colors.white);
            //       getServiceInfo();
            //       getUserInfo();
            //     } else {
            //       Get.snackbar("خطأ", "حدث خطأ ما",
            //           margin: EdgeInsets.all(Insets.margin),
            //           backgroundColor: Get.theme.colorScheme.error,
            //           colorText: Colors.white);
            //     }
            //   }
            // });
          
        }

        activePinLoading.value = false;
      }
    }
  }

  getInvoiceList() async {
    var token = prefs.getString('token');
    if (token != null) {
      loadInvoice.value = true;
      var data = {"page": 1, "count": 10, "sortBy": "id", "direction": "desc"};

      final passphrase = 'abcdefghijuklmno0123456789012345';

      final encryptedData = encryptAESCryptoJS(jsonEncode(data), passphrase);

      final response = await SasClient.post(
        api: '/api/index/invoice',
        data: {
          "payload": encryptedData,
        },
      );
      if (response.item1) {
        print(response.item2["data"]);
        invoiceList.value =
            invoiceModelFromJson(jsonEncode(response.item2["data"]));
      }
      loadInvoice.value = false;
    }
  }

  @override
  void onInit() {
    getServiceInfo();
    getUserInfo();
    getDashboardInfo();
    super.onInit();
  }
}
