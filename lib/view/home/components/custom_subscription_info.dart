import 'package:fiber/config/constant.dart';
import 'package:flutter/material.dart';

class CustomSubscriptionInfo extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final Widget? trailing;
  const CustomSubscriptionInfo({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        dense: true,
        trailing: trailing,
        horizontalTitleGap: Insets.small,
        visualDensity: VisualDensity.compact,
        contentPadding: EdgeInsets.zero,
        leading: Container(
          width: Insets.exLarge,
          height: Insets.exLarge,
          padding: EdgeInsets.all(Insets.exSmall + 3),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface.withOpacity(0.4),
            border: Border.all(
              color: context.theme.colorScheme.surface,
            ),
            borderRadius: BorderRadius.circular(Insets.medium),
          ),
          child: SvgPicture.asset(
            icon,
            color: context.theme.colorScheme.surface,
            width: Insets.small,
            fit: BoxFit.fill,
          ),
        ),
        title: Text(
          title,
          style: context.theme.textTheme.titleSmall!.copyWith(
            color: context.theme.colorScheme.surface,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: context.theme.textTheme.titleSmall!.copyWith(
            color: context.theme.colorScheme.surface,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
