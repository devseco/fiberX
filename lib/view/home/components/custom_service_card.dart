import 'package:fiber/config/constant.dart';
import 'package:flutter/material.dart';

class CustomServiceCard extends StatelessWidget {
  final String icon;
  final String title;
  final void Function()? onTap;
  final bool? servicePage;
  final bool? isDisabled;
  const CustomServiceCard(
      {super.key,
      required this.icon,
      required this.title,
      this.onTap,
      this.servicePage,
      this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    if (servicePage == null) {
      return Expanded(
        flex: 1,
        child: InkMe(
          onTap: onTap,
          radius: BorderRadius.circular(
              servicePage == null ? Insets.medium - 4 : Insets.exLarge),
          child: Container(
              height: servicePage == null
                  ? Insets.exLarge * 2.7
                  : Insets.exLarge * 1.5,
              padding: EdgeInsets.symmetric(
                  horizontal: Insets.small, vertical: Insets.exSmall),
              decoration: BoxDecoration(
                color: isDisabled == true
                    ? Color.fromARGB(255, 224, 220, 220)
                    : context.theme.colorScheme.surface.withOpacity(0.5),
                border: Border.all(
                  color: context.theme.colorScheme.surface,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(
                    servicePage == null ? Insets.medium - 4 : Insets.large),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: Insets.large * 1.3,
                      width: Insets.large * 1.3,
                      padding: EdgeInsets.all(Insets.small - 3),
                      decoration: BoxDecoration(
                        color: context.theme.colorScheme.surface,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        icon,
                        color: context.theme.colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: Insets.small),
                    Text(title,
                        textAlign: TextAlign.center,
                        style: context.theme.textTheme.titleSmall!.copyWith(
                          color: context.theme.colorScheme.scrim,
                        )),
                  ],
                ),
              )),
        ),
      );
    } else {
      return InkMe(
        onTap: onTap,
        radius: BorderRadius.circular(Insets.large),
        child: Container(
          height:
              servicePage == null ? Insets.exLarge * 2.7 : Insets.exLarge * 1.5,
          padding: EdgeInsets.symmetric(
              horizontal: Insets.small, vertical: Insets.exSmall),
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface.withOpacity(0.5),
            border: Border.all(
              color: context.theme.colorScheme.surface,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(
                servicePage == null ? Insets.medium - 4 : Insets.large),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: Insets.large * 1.3,
                width: Insets.large * 1.3,
                padding: EdgeInsets.all(Insets.small - 3),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  icon,
                  color: context.theme.colorScheme.primary,
                ),
              ),
              SizedBox(width: Insets.small),
              Text(title,
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.titleSmall!.copyWith(
                    color: context.theme.colorScheme.scrim,
                  )),
            ],
          ),
        ),
      );
    }
  }
}
