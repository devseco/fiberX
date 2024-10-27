import 'dart:convert';

import 'package:fiber/client/base_client.dart';
import 'package:fiber/models/plans_model.dart';
import 'package:fiber/models/questions_model.dart';
import 'package:get/get.dart';

class PlansController extends GetxController {
  RxBool isLoading = false.obs;

  RxList<PlansModel> plans = RxList();

  getData() async {
    isLoading.value = true;
    var query = {"pageSize": 10, "pageNumber": 1};
    var data = await BaseClient.get(api: "/Plans", queryParameters: query);

    if (data != null) {
      plans.value = plansModelFromJson(jsonEncode(data['data']));
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
