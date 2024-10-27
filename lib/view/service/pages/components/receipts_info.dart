import 'package:fiber/config/constant.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ReceiptsInfo extends StatelessWidget {
  const ReceiptsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.small),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'تفاصيل الفاتورة'.tr,
              style: context.theme.textTheme.titleSmall!.copyWith(
                color: context.theme.colorScheme.scrim,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: Insets.large),
            Container(
              width: context.width,
              padding: EdgeInsets.all(Insets.small),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Insets.small),
                border: Border.all(
                  color: context.theme.colorScheme.secondaryContainer,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ملخص الدفع'.tr,
                    style: context.theme.textTheme.labelLarge!.copyWith(
                      color: context.theme.colorScheme.primary,
                    ),
                  ),
                  SizedBox(height: Insets.small),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'المنتج'.tr,
                        style: context.theme.textTheme.labelLarge!.copyWith(
                          color: context.theme.colorScheme.outline,
                        ),
                      ),
                      Text(
                        'اكسبرس فايبر'.tr,
                        style: context.theme.textTheme.labelLarge!.copyWith(),
                      ),
                    ],
                  ),
                  SizedBox(height: Insets.exSmall),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'المدة'.tr,
                        style: context.theme.textTheme.labelLarge!.copyWith(
                          color: context.theme.colorScheme.outline,
                        ),
                      ),
                      Text(
                        'شهر واحد'.tr,
                        style: context.theme.textTheme.labelLarge!.copyWith(),
                      ),
                    ],
                  ),
                  SizedBox(height: Insets.exSmall),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'السعر'.tr,
                        style: context.theme.textTheme.labelLarge!.copyWith(
                          color: context.theme.colorScheme.outline,
                        ),
                      ),
                      Text(
                        '30,000 د.ع'.tr,
                        style: context.theme.textTheme.labelLarge!.copyWith(),
                      ),
                    ],
                  ),
                  SizedBox(height: Insets.small),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'المجموع'.tr,
                        style: context.theme.textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '30,000 د.ع'.tr,
                        style: context.theme.textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ].animate(interval: 50.ms).fadeIn(),
        ),
      ),
    );
  }
}
