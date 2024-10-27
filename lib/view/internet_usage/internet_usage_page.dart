import 'package:fiber/config/constant.dart';
import 'package:fiber/config/utils/const_class.dart';
import 'package:fiber/controller/sas/sas_controller.dart';
import 'package:fiber/view/plans/components/custom_back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../config/const_wodget/custom_chart_widget.dart';
import 'components/internet_chart_widget.dart';

class InternetUsagePage extends StatefulWidget {
  const InternetUsagePage({super.key});

  @override
  State<InternetUsagePage> createState() => _InternetUsagePageState();
}

class _InternetUsagePageState extends State<InternetUsagePage> {
  SasController _sasController = Get.put(SasController());

  @override
  void initState() {
    // TODO: implement initState

    _sasController.getUserTraffic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 70,
          leadingWidth: 65,
          leading: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(Insets.margin),
              const CustomBackButton(),
            ],
          ),
          title: Text(
            "استخدام البيانات",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(
          () => _sasController.isLoaing.value
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: Insets.margin),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gap(Insets.small),
                        // Text(
                        //   "احصائيات شهرية",
                        //   style: Theme.of(context)
                        //       .textTheme
                        //       .titleMedium!
                        //       .copyWith(fontWeight: FontWeight.bold),
                        // ),
                        // Gap(Insets.small),
                        // InternetChartWidget(),
                        Gap(Insets.medium),
                        Text(
                          "الاستخدام اليومي",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Gap(Insets.small),
                        Column(
                          children: [
                            CustomChartWidget(
                              title: "الرفع",
                              value:
                                  _sasController.totalUpload.value.toString(),
                              isRow: true,
                              color: Color(0xFF4F9AE0),
                              icon: CupertinoIcons.up_arrow,
                            ),
                            Gap(Insets.medium),
                            CustomChartWidget(
                              title: "التحميل",
                              value:
                                  _sasController.totalDownload.value.toString(),
                              isRow: true,
                              color: Color(0xFF4FE080),
                              icon: CupertinoIcons.down_arrow,
                            )
                          ],
                        ),
                        Gap(Insets.medium),
                        Column(
                          children: [
                            CustomChartWidget(
                              title: "الكلي",
                              value:
                                  _sasController.totalTraffic.value.toString(),
                              isRow: true,
                              color: Color.fromARGB(255, 183, 79, 224),
                              icon: CupertinoIcons.up_arrow,
                            ),
                            Gap(Insets.medium),
                            CustomChartWidget(
                              title: "المتبقي",
                              value:
                                  _sasController.remainingData.value.toString(),
                              isRow: true,
                              color: Color.fromARGB(255, 224, 144, 79),
                              icon: CupertinoIcons.down_arrow,
                            )
                          ],
                        ),
                        Gap(Insets.medium),
                      ],
                    ),
                  ),
                ),
        ));
  }
}
