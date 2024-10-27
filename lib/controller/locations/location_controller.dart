import 'dart:convert';

import 'package:fiber/client/base_client.dart';
import 'package:fiber/models/location_model.dart';
import 'package:fiber/models/plans_model.dart';
import 'package:fiber/models/questions_model.dart';
import 'package:get/get.dart';

class LocationsController extends GetxController {
  RxBool isLoading = false.obs;

  RxList<LocationModel> locations = RxList();

  Future<List<LocationModel>> getData() async {
    var query = {"pageSize": 10, "pageNumber": 0};
    var data = await BaseClient.get(api: "/Locations", queryParameters: query);
    return locationModelFromJson(jsonEncode(data['data']));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}
