import 'package:fiber/config/const_wodget/custom_fill_button.dart';
import 'package:fiber/config/const_wodget/custom_text_form_field.dart';
import 'package:fiber/config/constant.dart';
import 'package:fiber/config/validator/validators.dart';
import 'package:fiber/view/home/components/custom_renew_card_item.dart';
import 'package:fiber/controller/home/home_controller.dart';
import 'package:flutter/material.dart';

class CustomRenewSubscriptionCard extends StatefulWidget {
  CustomRenewSubscriptionCard({
    super.key,
  });

  @override
  State<CustomRenewSubscriptionCard> createState() =>
      _CustomRenewSubscriptionCardState();
}

class _CustomRenewSubscriptionCardState
    extends State<CustomRenewSubscriptionCard> {
  HomeController cc = Get.find();
  TextEditingController pin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Insets.small),
      child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ' الباقة'.tr,
                style: context.theme.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(Insets.medium),
              CustomRenewCardItem(
                title: cc.serviceInfo.value.profileName ?? "",
                prices: double.parse(cc.serviceInfo.value.price.toString()),
                isActive: true,
              ),
              Gap(Insets.medium),
              CustomTextFormField(
                validators: [
                  IsRequiredRule(),
                ],
                isLabelVisible: true,
                label: 'رمز التفعيل'.tr,
                hint: '***',
                hasBorder: true,
                controller: pin,
              ),
              Gap(Insets.medium),
              CustomFillButton(
                loading: cc.activePinLoading.value
                    ? SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : null,
                title: 'تعبئة'.tr,
                onTap: () {
                  cc.activePin(pin: pin.text);
                },
                backgroundColor: context.theme.colorScheme.primary,
              ),
              Gap(Insets.medium),
              CustomOutLineButton(
                loading: cc.activeWithoutReedemLoading.value
                    ? SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : null,
                title: 'تفعيل من المحفظة'.tr,
                onTap: () {
                  cc.activeWithoutReedem();
                },
              )
            ],
          )),
    );
  }
}
