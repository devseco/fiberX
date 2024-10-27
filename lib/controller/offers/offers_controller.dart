import 'dart:convert';

import 'package:fiber/client/base_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/offers_model.dart';

class OfferController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<OffersModel> offers = RxList();

  getData() async {
    isLoading.value = true;
    var query = {"pageSize": 10, "pageNumber": 1};
    var data = await BaseClient.get(api: "/Offers", queryParameters: query);

    if (data != null) {
      offers.value = offersModelFromJson(jsonEncode(data['data']));
    }

    isLoading.value = false;
  }

  @override
  void onInit() {
    getData();
  }
}
