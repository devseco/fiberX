import 'package:fiber/config/const_wodget/custom_fill_button.dart';
import 'package:fiber/config/const_wodget/custom_text_form_field.dart';
import 'package:fiber/config/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../config/utils/const_class.dart';

class CustomActiveBottomSheet extends StatelessWidget {
  const CustomActiveBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
              )),
        )),
        Positioned(
          bottom: 0,
          child: Container(
            height: 350,
            padding: EdgeInsets.symmetric(horizontal: Insets.large),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Insets.large),
                topRight: Radius.circular(Insets.large),
              ),
            ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(Insets.medium),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                  ],
                ),
                Gap(Insets.medium),
                Text("اشترك في باقة فايبر اكس / 40Mps",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold)),
                Gap(Insets.small),
                Divider(
                  thickness: 0.6,
                ),
                Gap(Insets.medium),
                Text("معلومات الرمز",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.bold)),
                Gap(Insets.small),
                CustomTextFormField(
                  validators: [],
                  hint: "**",
                  isLabelVisible: true,
                  label: "رمز التفعيل",
                  hasBorder: true,
                ),
                Spacer(),
                CustomFillButton(
                    title: "تفعيل",
                    backgroundColor: context.theme.colorScheme.primary),
                Gap(Insets.medium),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
