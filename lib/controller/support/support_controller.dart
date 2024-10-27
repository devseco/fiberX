import 'package:fiber/client/base_client.dart';
import 'package:fiber/config/constant.dart';
import 'package:fiber/models/ticket_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportController extends GetxController {
  RxBool isLoading = false.obs;

  Future<bool> sendTicket(TicketModel ticketModel) async {
    isLoading(true);
    var request =
        await BaseClient.post(api: "/Supports", data: ticketModel.toJson());
    isLoading(false);
    if (request != null) {
      Get.snackbar("تمت العملية", "تم ارسال رسالتك الى الدعم بنجاح",
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(Insets.margin),
          backgroundColor: Get.theme.colorScheme.primary,
          colorText: Colors.white);
      return true;
    } else {
      Get.snackbar("Error", "Failed to send ticket",
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
  }
}
