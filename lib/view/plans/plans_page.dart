import 'package:fiber/config/const_wodget/no_data_widget.dart';
import 'package:fiber/config/constant.dart';
import 'package:fiber/view/plans/components/custom_back_button.dart';
import 'package:fiber/view/plans/components/plan_card_widget.dart';
import 'package:flutter/material.dart';

import '../../controller/plans/plans_controller.dart';

class PlansPage extends StatefulWidget {
  const PlansPage({super.key});

  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  PlansController plansController = Get.put(PlansController());

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
            "باقات الانترنت",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: Obx(() => plansController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : !plansController.isLoading.value &&
                      plansController.plans.isEmpty
                  ? NoDataWidget(
                      refresh: () => plansController.getData(),
                      details: "سيتم نشر الباقات في اقرب وقت",
                    )
                  : ListView(
                      padding: EdgeInsets.all(Insets.margin),
                      children: plansController.plans.map((element) {
                        return PlanCardWidget(plansModel: element);
                      }).toList(),
                    )),
        ));
  }
}
