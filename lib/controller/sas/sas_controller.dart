import 'dart:convert';

import 'package:fiber/client/sas_client.dart';
import 'package:fiber/config/constant.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../client/encrypt.dart';

class SasController extends GetxController {
  RxBool isLoaing = false.obs;
  Rx<dynamic> totalUpload = "".obs;
  Rx<dynamic> totalDownload = "".obs;
  Rx totalTraffic = "".obs;
  Rx freeTraffic = "".obs;
  Rx remainingData = "".obs;

  getUserTraffic() async {
    isLoaing(true);
    final passphrase = 'abcdefghijuklmno0123456789012345';

    var date = DateTime.now();
    var body = {
      "report_type": "daily",
      "month": date.month.toString(),
      "year": date.year.toString()
    };
    final encryptedData = encryptAESCryptoJS(jsonEncode(body), passphrase);

    var response = await SasClient.post(
        api: "/api/traffic", data: {"payload": encryptedData});

    Map<String, dynamic> data = jsonDecode(jsonEncode(response.item2["data"]));
    List<int> uploadValues = data['rx'].cast<int>();
    List<int> downloadValues = data['tx'].cast<int>();

    int totalUpload = uploadValues.fold(0, (prev, element) => prev + element);
    int totalDownload =
        downloadValues.fold(0, (prev, element) => prev + element);

    List<int> totalTrafficValues = data['total'].cast<int>();

    int totalTraffic =
        totalTrafficValues.fold(0, (prev, element) => prev + element);

    List<int> freeTrafficValues = data['free_traffic'].cast<int>();

    int freeTraffic =
        freeTrafficValues.fold(0, (prev, element) => prev + element);

    int remainingData = totalTraffic - (totalUpload + totalDownload);

    this.totalUpload(
        NumberFormat.decimalPattern().format(totalUpload / 1000000000));
    this.totalDownload(
        NumberFormat.decimalPattern().format(totalDownload / 1000000000));
    this.totalTraffic(
        NumberFormat.decimalPattern().format(totalTraffic / 1000000000));
    this.freeTraffic(
        NumberFormat.decimalPattern().format(freeTraffic / 1000000000));
    this.remainingData(
        NumberFormat.decimalPattern().format(remainingData / 1000000000));

    isLoaing(false);
  }
}
