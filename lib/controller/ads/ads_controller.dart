import 'dart:convert';

import 'package:fiber/models/ads_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../client/base_client.dart';

class AdsController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<AdsModel> ads = RxList();

  getData() async {
    isLoading.value = true;
    var query = {"pageSize": 10, "pageNumber": 1};
    var data = await BaseClient.get(api: "/Ads", queryParameters: query);

    if (data != null) {
      ads.value = adsModelFromJson(jsonEncode(data['data']));
    }

    isLoading.value = false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();

    super.onInit();
  }
}
