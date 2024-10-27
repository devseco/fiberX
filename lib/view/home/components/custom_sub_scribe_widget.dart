import 'package:fiber/config/constant.dart';
import 'package:fiber/controller/home/home_controller.dart';
import 'package:fiber/controller/sas/sas_controller.dart';
import 'package:fiber/models/service_model.dart';
import 'package:fiber/view/home/components/custom_add_to_wallet.dart';
import 'package:fiber/view/home/components/custom_subscription_info.dart';
import 'package:flutter/material.dart';

class CustomSubScribeWidget extends StatelessWidget {
  final ServiceModel serviceModel;
  const CustomSubScribeWidget({super.key, required this.serviceModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.all(Insets.medium),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            context.theme.colorScheme.onPrimaryContainer.withOpacity(0.8),
            context.theme.colorScheme.primary,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        image: const DecorationImage(
          image: AssetImage(Assets.assetsImagesSubscripe),
          fit: BoxFit.contain,
        ),
        borderRadius: BorderRadius.circular(Insets.large),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'نوع الاشتراك'.tr,
                style: context.theme.textTheme.labelMedium!.copyWith(
                  color: context.theme.colorScheme.surface,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Insets.large,
                  vertical: Insets.exSmall,
                ),
                decoration: BoxDecoration(
                  color: serviceModel.subscriptionStatus!.status
                      ? Colors.green.shade500
                      : Colors.red.shade500,
                  borderRadius: BorderRadius.circular(Insets.medium),
                ),
                child: Text(
                  serviceModel.subscriptionStatus!.status ? "فعال" : "غير فعال",
                  style: context.theme.textTheme.labelMedium!.copyWith(
                    color: context.theme.colorScheme.surface,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Text(
            serviceModel.profileName ?? "",
            style: context.theme.textTheme.headlineMedium!.copyWith(
              color: context.theme.colorScheme.surface,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(Insets.exSmall),
          SizedBox(
            width: context.width * 0.8,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomSubscriptionInfo(
                      icon: Assets.assetsIconsMoney,
                      title: 'السعر'.tr,
                      subtitle: formatCurrency(
                          double.parse(serviceModel.price!.toString())),
                    ),
                    Obx(() => CustomSubscriptionInfo(
                        icon: Assets.assetsIconsCalendarCheck,
                        title: 'المدة المتبقية'.tr,
                        subtitle: Get.find<HomeController>()
                                    .dashboardModel
                                    .value
                                    .remainingDays <=
                                0
                            ? "0"
                            : Get.find<HomeController>()
                                .dashboardModel
                                .value
                                .remainingDays
                                .toString()
                                .replaceAll("null", ""))),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomSubscriptionInfo(
                      icon: Assets.assetsIconsCalendarX,
                      title: 'تاريخ الانتهاء'.tr,
                      subtitle: makeDate(serviceModel.expiration),
                    ),
                    Obx(
                      () => CustomSubscriptionInfo(
                        icon: Assets.assetsIconsWallet,
                        title: 'المحفظة'.tr,
                        trailing: InkMe(
                          onTap: () {
                            customBottomSheet(
                              context,
                              height: context.height * 0.3,
                              child: SingleChildScrollView(
                                child: CustomAddToWallet(),
                              ),
                            );
                          },
                          child: Icon(
                            CupertinoIcons.add,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: formatCurrency(double.parse(
                            Get.find<HomeController>()
                                .userInfo
                                .value
                                .balance
                                .toString())),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
