import 'package:fiber/config/constant.dart';
import 'package:fiber/models/user_model.dart';
import 'package:flutter/material.dart';

class CustomProfileCard extends StatelessWidget {
  final UserModel userModel;
  const CustomProfileCard({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.symmetric(horizontal: Insets.small),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(Insets.large),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        horizontalTitleGap: Insets.small,
        title: Text(
          userModel.name ?? "",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          userModel.phone ?? "",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: context.theme.colorScheme.outline),
        ),
        leading: const CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(Assets.assetsImagesImage1),
        ),
      ),
    );
  }
}
