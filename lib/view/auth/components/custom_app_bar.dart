import 'package:fiber/config/constant.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.assetsImagesBackgroundLogin),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          // Positioned(
          //   child: Image.asset(Assets.assetsImagesBackgroundLogin),
          // ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(Insets.exLarge * 1.2),
              Image.asset(
                Assets.assetsImagesLogo2,
                width: Insets.exLarge * 4.2,
              ),
              Gap(Insets.medium),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Insets.medium),
                child: Text(
                  'الشريك الرسمي لوزارة الاتصالات العراقية والمزود الأكبر للإنترنت الضوئي في واسط والبصرة',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: context.theme.colorScheme.surface, fontSize: 15),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
