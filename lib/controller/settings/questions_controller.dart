import 'dart:convert';

import 'package:fiber/client/base_client.dart';
import 'package:fiber/models/questions_model.dart';
import 'package:get/get.dart';

class QuestionsController extends GetxController {
  RxBool isLoading = false.obs;

  RxList<QuestionsModel> questions = RxList();

  getData() async {
    isLoading.value = true;
    var query = {"pageSize": 10, "pageNumber": 1};
    var data = await BaseClient.get(api: "/Questions", queryParameters: query);

    if (data != null) {
      questions.value = questionsModelFromJson(jsonEncode(data['data']));
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
