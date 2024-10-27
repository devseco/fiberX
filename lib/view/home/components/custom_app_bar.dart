import 'package:fiber/config/constant.dart';
import 'package:fiber/models/user_model.dart';
import 'package:flutter/material.dart';

import '../../notification/notification_page.dart';

class CustomAppBar extends StatelessWidget {
  UserModel userModel = UserModel();
  CustomAppBar({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: Insets.small),
      title: Text(
        'مرحبا،'.tr,
        style: context.theme.textTheme.labelMedium!
            .copyWith(color: context.theme.colorScheme.outline),
      ),
      subtitle: Text(
        userModel.name ?? "",
        style: context.theme.textTheme.titleMedium!
            .copyWith(color: context.theme.colorScheme.scrim),
      ),
      leading: CircleAvatar(
        radius: Insets.medium,
        backgroundImage: const AssetImage(Assets.assetsImagesUserImg),
      ),
      trailing: InkWell(
        onTap: () {
          Get.to(() => NotificationPage());
        },
        child: Container(
          padding: EdgeInsets.all(Insets.small),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(Assets.assetsIconsNotification),
        ),
      ),
    );
  }
}
