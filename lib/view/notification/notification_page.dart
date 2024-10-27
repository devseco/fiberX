import 'package:fiber/config/const_wodget/no_data_widget.dart';
import 'package:fiber/config/constant.dart';
import 'package:fiber/controller/notification/notification_controller.dart';
import 'package:fiber/controller/offers/offers_controller.dart';
import 'package:fiber/view/notification/components/notify_widget.dart';
import 'package:fiber/view/notification/components/offers_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../plans/components/custom_back_button.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  OfferController controller = Get.put(OfferController());
  NotificationController notificationController = Get.find();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
            "الاشعارات",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: Insets.margin),
              padding: EdgeInsets.all(Insets.exSmall),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                dividerColor: Colors.transparent,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                ),
                labelColor: Theme.of(context).colorScheme.primary,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      child: const Text("العروض"),
                    ),
                  ),
                  Tab(
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      child: const Text("التنبيهات"),
                    ),
                  ),
                ],
              ),
            ),
            Gap(Insets.medium),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                Obx(() => controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : !controller.isLoading.value && controller.offers.isEmpty
                        ? Center(
                            child: NoDataWidget(),
                          )
                        : Column(
                            children: [
                              Expanded(
                                child: ListView.separated(
                                  itemCount: controller.offers.length,
                                  padding: EdgeInsets.only(
                                      left: Insets.margin,
                                      right: Insets.margin,
                                      bottom: Insets.margin),
                                  separatorBuilder: (context, index) =>
                                      Gap(Insets.small),
                                  itemBuilder: (context, index) {
                                    return OffersCardWidget(
                                        model: controller.offers[index]);
                                  },
                                ),
                              )
                            ].animate(interval: 50.ms).fadeIn(),
                          )),
                Obx(() => notificationController.isLoading.value == true
                    ? Center(child: CircularProgressIndicator())
                    : !notificationController.isLoading.value &&
                            notificationController.notifications.isEmpty
                        ? Center(
                            child: NoDataWidget(),
                          )
                        : Column(
                            children: [
                              Expanded(
                                child: ListView.separated(
                                  itemCount: notificationController
                                      .notifications.length,
                                  padding: EdgeInsets.only(
                                      left: Insets.margin,
                                      right: Insets.margin,
                                      bottom: Insets.margin),
                                  separatorBuilder: (context, index) =>
                                      Gap(Insets.small),
                                  itemBuilder: (context, index) {
                                    return NotifyWidget(
                                        notificationModel:
                                            notificationController
                                                .notifications[index]);
                                  },
                                ),
                              )
                            ].animate(interval: 50.ms).fadeIn(),
                          )),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
