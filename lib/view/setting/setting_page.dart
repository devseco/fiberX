import 'package:fiber/config/constant.dart';
import 'package:fiber/controller/home/home_controller.dart';
import 'package:fiber/main.dart';
import 'package:fiber/view/auth/login_page.dart';
import 'package:fiber/view/setting/components/custom_profile_card.dart';
import 'package:fiber/view/setting/components/custom_support_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../controller/set_data_controller.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.small),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Insets.exLarge + 24,
          ),
          homeController.userInfo.value.id == null
              ? Container()
              : CustomProfileCard(
                  userModel: homeController.userInfo.value,
                ),
          SizedBox(
            height: Insets.medium,
          ),
          Text(
            'الدعم'.tr,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: Insets.small,
          ),
          const CustomSupportCard(),
          // homeController.userInfo.value.id == null
          //     ? Container()
          //     : SizedBox(
          //         height: Insets.medium,
          //       ),
          // homeController.userInfo.value.id == null
          //     ? Container()
          //     : Text(
          //         'الملف الشخصي'.tr,
          //         style: Theme.of(context).textTheme.titleMedium,
          //       ),
          // homeController.userInfo.value.id == null
          //     ? Container()
          //     : SizedBox(
          //         height: Insets.small,
          //       ),
          // homeController.userInfo.value.id == null
          //     ? Container()
          //     : ListTile(
          //         contentPadding: EdgeInsets.zero,
          //         dense: true,
          //         visualDensity: VisualDensity.comfortable,
          //         enableFeedback: false,
          //         minVerticalPadding: 0,
          //         titleAlignment: ListTileTitleAlignment.center,
          //         style: ListTileStyle.list,
          //         horizontalTitleGap: Insets.small,
          //         title: Text(
          //           'تغيير كلمة السر'.tr,
          //           style: Theme.of(context).textTheme.titleMedium!.copyWith(
          //                 color: Theme.of(context).colorScheme.outline,
          //               ),
          //         ),
          //         leading: SvgPicture.asset(
          //           Assets.assetsIconsPassword,
          //           width: 24,
          //           height: 24,
          //         ),
          //         trailing: SvgPicture.asset(
          //           Assets.assetsIconsCaretRight,
          //           width: 24,
          //           height: 24,
          //         ),
          //       ),
          // SizedBox(
          //   height: Insets.medium,
          // ),
          Text(
            'الحساب'.tr,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: Insets.small,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            visualDensity: VisualDensity.comfortable,
            enableFeedback: false,
            minVerticalPadding: 0,
            onTap: () {
              if (homeController.userInfo.value.id == null) {
                Get.to(() => const LoginPage());
                Get.find<SetDataController>().page.value = 0;
              } else {
                Get.find<SetDataController>().page.value = 0;
                var gov = prefs.getInt("gov");
                var selectedGov = prefs.getBool("selected_gov");
                prefs.clear();
                Get.offAll(() => const LoginPage());
                prefs.setBool("selected_gov", true);
                prefs.setInt("gov", gov ?? 1);
              }
            },
            titleAlignment: ListTileTitleAlignment.center,
            style: ListTileStyle.list,
            horizontalTitleGap: Insets.small,
            title: Text(
              homeController.userInfo.value.id == null
                  ? "تسجيل الدخول"
                  : 'تسجيل الخروج'.tr,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: homeController.userInfo.value.id == null
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.error,
                  ),
            ),
            leading: SvgPicture.asset(
              Assets.assetsIconsSignIn,
              width: 24,
              height: 24,
            ),
            trailing: SvgPicture.asset(
              Assets.assetsIconsCaretRight,
              width: 24,
              height: 24,
              color: homeController.userInfo.value.id == null
                  ? Theme.of(context).colorScheme.primary
                  : context.theme.colorScheme.error,
            ),
          ),
        ].animate(interval: 50.ms).fade(),
      ),
    );
  }
}
