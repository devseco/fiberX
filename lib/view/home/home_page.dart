import 'package:fiber/config/const_wodget/custom_fill_button.dart';
import 'package:fiber/config/constant.dart';
import 'package:fiber/controller/ads/ads_controller.dart';
import 'package:fiber/controller/home/home_controller.dart';
import 'package:fiber/controller/news/news_controller.dart';
import 'package:fiber/main.dart';
import 'package:fiber/view/auth/login_page.dart';
import 'package:fiber/view/home/components/custom_app_bar.dart';
import 'package:fiber/view/home/components/custom_news_card.dart';
import 'package:fiber/view/home/components/custom_offers_card.dart';
import 'package:fiber/view/home/components/custom_renew_subscription_card.dart';
import 'package:fiber/view/home/components/custom_service_card.dart';
import 'package:fiber/view/home/components/custom_sub_scribe_widget.dart';
import 'package:fiber/view/home/components/requst_active_page.dart';
import 'package:fiber/view/news/news_page.dart';
import 'package:fiber/view/notification/components/offers_card_widget.dart';
import 'package:fiber/view/plans/plans_page.dart';
import 'package:fiber/view/service/pages/map_page.dart';
import 'package:fiber/view/service/pages/receipts.dart';
import 'package:fiber/view/setting/pages/support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../internet_usage/internet_usage_page.dart';
import '../speed_test/speed_test_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NewsController newsController = Get.find();
  AdsController adsContoller = Get.find();
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var isrequested = prefs.getString('requested');
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: Insets.exLarge),
          Obx(() => !homeController.isLoading.value &&
                  null == homeController.serviceInfo.value.profileId
              ? isrequested == null
                  ? Container(
                      padding: EdgeInsets.all(Insets.margin),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Gap(Insets.large),
                          CustomOutLineButton(
                            onTap: () {
                              Get.to(ReqyestActivePage());
                            },
                            title: "طلب تفعيل الخدمة",
                          ),
                        ],
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(top: Insets.margin),
                      padding: EdgeInsets.all(Insets.margin),
                      child: Text(
                          "- تم ارسال طلب تفعيل الخدمة سيتم الاتصال بك قريبا",
                          style: context.theme.textTheme.titleMedium!.copyWith(
                            color: context.theme.colorScheme.primary,
                          )),
                    )
              : Container()),
          Obx(() => null == homeController.userInfo.value.id
              ? Container()
              : Column(
                  children: [
                    CustomAppBar(
                      userModel: homeController.userInfo.value,
                    ),
                  ],
                )),
          SizedBox(height: Insets.small),
          Obx(() => homeController.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : !homeController.isLoading.value &&
                      null == homeController.serviceInfo.value.profileId
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: Insets.small),
                      child: CustomSubScribeWidget(
                          serviceModel: homeController.serviceInfo.value),
                    )),
          !homeController.isLoading.value &&
                  null == homeController.serviceInfo.value.profileId
              ? Container()
              : SizedBox(height: Insets.medium),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.small),
            child: Text(
              'الخدمات'.tr,
              style: context.theme.textTheme.titleSmall!.copyWith(
                color: context.theme.colorScheme.scrim,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: Insets.small),
          Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.small),
              child: Row(
                children: [
                  !homeController.isLoading.value &&
                          null == homeController.serviceInfo.value.profileId
                      ? Container()
                      : CustomServiceCard(
                          icon: Assets.assetsIconsArrowsClockwise,
                          title: 'تجديد إشتراك'.tr,
                          isDisabled: false,
                          onTap: () {
                            // Get.snackbar("الخدمة غير مفعلة",
                            //     "سيتم تفعيل خدمة التجديد قريبا",
                            //     margin: EdgeInsets.all(20),
                            //     snackPosition: SnackPosition.BOTTOM);
                            customBottomSheet(
                              context,
                              height: context.height * 0.50,
                              child: SingleChildScrollView(
                                child: CustomRenewSubscriptionCard(),
                              ),
                            );
                          },
                        ),
                  SizedBox(width: Insets.small),
                  CustomServiceCard(
                    onTap: () => {Get.to(const SpeedTestPage())},
                    icon: Assets.assetsIconsSpeedometer,
                    title: 'فحص السرعة'.tr,
                  ),
                  SizedBox(width: Insets.small),
                  CustomServiceCard(
                    onTap: () {
                      Get.to(() => const MapPage(),
                          transition: Transition.fadeIn);
                    },
                    icon: Assets.assetsIconsMapPin,
                    title: 'مواقعنا والتغطية'.tr,
                  ),
                  SizedBox(width: Insets.small),
                  !homeController.isLoading.value &&
                          null == homeController.serviceInfo.value.profileId
                      ? Container()
                      : CustomServiceCard(
                          onTap: () {
                            Get.to(const InternetUsagePage());
                          },
                          icon: Assets.assetsIconsChartLine,
                          title: 'استخدام البيانات'.tr,
                        ),
                  !homeController.isLoading.value &&
                          null == homeController.serviceInfo.value.profileId
                      ? CustomServiceCard(
                          onTap: () {
                            Get.to(const NewsPage());
                          },
                          icon: Assets.assetsIconsNews,
                          title: 'الاخبار'.tr,
                        )
                      : Container()
                ],
              ),
            ),
          ),
          SizedBox(height: Insets.small),
          Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.small),
              child: Row(
                children: [
                  !homeController.isLoading.value &&
                          null == homeController.serviceInfo.value.profileId
                      ? Container()
                      : CustomServiceCard(
                          onTap: () {
                            Get.to(
                              () => const ReceiptsPage(),
                              transition: Transition.fadeIn,
                            );
                          },
                          icon: Assets.assetsIconsReceipts,
                          title: 'الفواتير'.tr,
                        ),
                  SizedBox(width: Insets.small),
                  CustomServiceCard(
                    icon: Assets.assetsIconsHandCoins,
                    title: 'الباقات'.tr,
                    onTap: () {
                      Get.to(() => const PlansPage(),
                          transition: Transition.fadeIn);
                    },
                  ),
                  SizedBox(width: Insets.small),
                  CustomServiceCard(
                    onTap: () {
                      Get.to(
                          () => const SupportPage(
                                isRepare: true,
                              ),
                          transition: Transition.fadeIn);
                    },
                    icon: Assets.assetsIconsWifiX,
                    title: 'الصيانة'.tr,
                  ),
                  SizedBox(width: Insets.small),
                  CustomServiceCard(
                    onTap: () {
                      Get.to(() => const SupportPage(),
                          transition: Transition.fadeIn);
                    },
                    icon: Assets.assetsIconsHeadset,
                    title: 'الدعم'.tr,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: Insets.medium),
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: Insets.small),
          //   child: Text(
          //     'العروض'.tr,
          //     style: context.theme.textTheme.titleSmall!.copyWith(
          //       color: context.theme.colorScheme.scrim,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          // SizedBox(height: Insets.small),
          Obx(() => adsContoller.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : !adsContoller.isLoading.value && adsContoller.ads.isEmpty
                  ? Container()
                  : CustomOffersCard(ads: adsContoller.ads)),
          SizedBox(height: Insets.medium),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.small),
            child: Text(
              'آخر الأخبار'.tr,
              style: context.theme.textTheme.titleSmall!.copyWith(
                color: context.theme.colorScheme.scrim,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: Insets.small),
          Obx(() => newsController.isLoading == true
              ? Center(child: CircularProgressIndicator())
              : CustomNewsCard(news: newsController.news)),
          SizedBox(height: Insets.exLarge * 2.5),
        ].animate(interval: 30.ms).fadeIn(),
      ),
    );
  }

  List<String> images = [
    Assets.assetsImagesImage1,
    Assets.assetsImagesImage2,
  ];
}
