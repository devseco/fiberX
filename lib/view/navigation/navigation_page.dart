import 'dart:io';

import 'package:fiber/config/constant.dart';
import 'package:fiber/controller/set_data_controller.dart';
import 'package:fiber/view/home/home_page.dart';
import 'package:fiber/view/navigation/components/custom_icons_button.dart';
import 'package:fiber/view/news/news_page.dart';
import 'package:fiber/view/service/service_page.dart';
import 'package:fiber/view/setting/setting_page.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return GetX<SetDataController>(
      builder: (data) => Scaffold(
        body: Container(
          width: context.width,
          height: context.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.assetsImagesBg),
              fit: BoxFit.cover,
            ),
          ),
          child: pages[data.page.value],
        ),
        floatingActionButton: Container(
          width: context.width,
          height: 70,
          margin: EdgeInsets.symmetric(
            horizontal: Insets.small,
            vertical: Platform.isIOS ? 0 : Insets.medium,
          ),
          padding: EdgeInsets.symmetric(
              horizontal: Insets.medium, vertical: Insets.exSmall),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface,
            border:
                Border.all(color: context.theme.colorScheme.secondaryContainer),
            borderRadius: BorderRadius.circular(Insets.large),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkMe(
                onTap: () => data.page.value = 0,
                overlayColor: MaterialStatePropertyAll(
                    context.theme.colorScheme.primary.withOpacity(0)),
                child: CustomIconsButton(
                  title: 'الرئيسية'.tr,
                  isSelected: data.page.value == 0,
                  iconWidget: Icon(
                    CupertinoIcons.home,
                    size: Insets.medium - 2,
                    color: data.page.value == 0
                        ? context.theme.colorScheme.primary
                        : context.theme.colorScheme.outline,
                  ),
                ),
              ),
              InkMe(
                onTap: () => data.page.value = 1,
                overlayColor: MaterialStatePropertyAll(
                    context.theme.colorScheme.primary.withOpacity(0)),
                child: CustomIconsButton(
                  title: 'الخدمات'.tr,
                  isSelected: data.page.value == 1,
                  icon: Assets.assetsIconsService,
                ),
              ),
              InkMe(
                onTap: () => data.page.value = 2,
                overlayColor: MaterialStatePropertyAll(
                    context.theme.colorScheme.primary.withOpacity(0)),
                child: CustomIconsButton(
                  title: 'الأخبار'.tr,
                  isSelected: data.page.value == 2,
                  icon: Assets.assetsIconsNews,
                ),
              ),
              InkMe(
                onTap: () => data.page.value = 3,
                overlayColor: MaterialStatePropertyAll(
                    context.theme.colorScheme.primary.withOpacity(0)),
                child: CustomIconsButton(
                  title: 'الاعدادات'.tr,
                  isSelected: data.page.value == 3,
                  iconWidget: Icon(
                    CupertinoIcons.settings,
                    size: Insets.medium - 2,
                    color: data.page.value == 3
                        ? context.theme.colorScheme.primary
                        : context.theme.colorScheme.outline,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  List<Widget> pages = [
    const HomePage(),
    const ServicePage(),
    const NewsPage(),
    const SettingPage(),
  ];
}
