import 'package:fiber/config/constant.dart';
import 'package:flutter/material.dart';

class CustomFillButton extends StatelessWidget {
  final String title;
  final Widget? loading;
  final Color? color;
  final Color? backgroundColor;
  final void Function()? onTap;
  final Widget? icon;
  final double? width;
  final double? padding;
  final TextStyle? textStyle;
  const CustomFillButton({
    super.key,
    required this.title,
    this.color,
    this.loading,
    this.onTap,
    this.backgroundColor,
    this.icon,
    this.width,
    this.textStyle,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return InkMe(
        onTap: onTap,
        child: Container(
          width: width ?? context.width,
          padding: EdgeInsets.symmetric(
              horizontal: Insets.medium, vertical: padding ?? Insets.small + 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Insets.large),
            color: backgroundColor ??
                color?.withOpacity(0.2) ??
                context.theme.colorScheme.primaryContainer.withOpacity(0.9),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            loading ??
                Row(
                  children: [
                    icon == null
                        ? Container()
                        : Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: Insets.small),
                            child: icon ?? Container(),
                          ),
                    Text(
                      title,
                      style: textStyle ??
                          context.theme.textTheme.titleMedium!.copyWith(
                            color: color ?? context.theme.colorScheme.surface,
                          ),
                    ),
                  ],
                ),
          ]),
        ));
  }
}

class CustomOutLineButton extends StatelessWidget {
  final String title;
  final Widget? loading;
  final Widget? icon;
  final double? padding;
  final Color? color;
  final void Function()? onTap;
  const CustomOutLineButton({
    super.key,
    required this.title,
    this.loading,
    this.icon,
    this.padding,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkMe(
      onTap: onTap,
      child: Container(
        width: context.width,
        padding: EdgeInsets.symmetric(
            horizontal: Insets.medium, vertical: padding ?? Insets.margin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Insets.large),
          color: Colors.transparent,
          border: Border.all(
            color: color ?? context.theme.colorScheme.onPrimaryContainer,
          ),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          loading ??
              Row(
                children: [
                  icon == null
                      ? Container()
                      : Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Insets.small),
                          child: icon ?? Container(),
                        ),
                  Text(
                    title,
                    style: context.theme.textTheme.titleSmall!.copyWith(
                      color:
                          color ?? context.theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
        ]),
      ),
    );
  }
}
