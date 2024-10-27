import 'package:fiber/config/const_wodget/custom_fill_button.dart';
import 'package:fiber/config/const_wodget/custom_text_form_field.dart';
import 'package:fiber/config/constant.dart';
import 'package:fiber/config/validator/validators.dart';
import 'package:fiber/controller/auth/auth_controller.dart';
import 'package:fiber/controller/set_data_controller.dart';
import 'package:fiber/view/auth/components/custom_app_bar.dart';
import 'package:fiber/view/navigation/navigation_page.dart';
import 'package:fiber/view/plans/components/custom_back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.assetsImagesLoginBack),
                fit: BoxFit.cover),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(Insets.margin),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Insets.margin),
                  child: Row(
                    children: [CustomBackButton()],
                  ),
                ),
                Gap(Insets.medium),
                GetX(
                  init: authController,
                  builder: (data) => Container(
                    margin: EdgeInsets.symmetric(horizontal: Insets.margin),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(Insets.large)),
                    child: Form(
                      child: Padding(
                        padding: EdgeInsets.all(Insets.medium),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'انشاء حساب جديد'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                      color: context.theme.colorScheme.primary,
                                      fontWeight: FontWeight.bold),
                            ),
                            Gap(Insets.medium),
                            // CustomTextFormField(
                            //   validators: [
                            //     IsRequiredRule(),
                            //   ],
                            //   hint: ''.tr,
                            //   controller: data.usernameController,
                            //   prefixIcon: const Icon(CupertinoIcons.person),
                            //   isLabelVisible: true,
                            //   label: "اسم المستخدم",
                            //   bottomSpace: Insets.margin,
                            // ),
                            CustomTextFormField(
                              validators: [
                                IsRequiredRule(),
                              ],
                              hint: ''.tr,
                              controller: data.emailController,
                              prefixIcon: const Icon(CupertinoIcons.mail),
                              isLabelVisible: true,
                              label: "البريد الالكتروني",
                              bottomSpace: Insets.margin,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            // CustomTextFormField(
                            //   validators: [
                            //     IsRequiredRule(),
                            //   ],
                            //   hint: ''.tr,
                            //   controller: data.firstnameController,
                            //   prefixIcon: const Icon(CupertinoIcons.pen),
                            //   isLabelVisible: true,
                            //   label: "الاسم الاول",
                            //   bottomSpace: Insets.margin,
                            // ),
                            // CustomTextFormField(
                            //   validators: [
                            //     IsRequiredRule(),
                            //   ],
                            //   hint: ''.tr,
                            //   controller: data.lastNameController,
                            //   prefixIcon: const Icon(CupertinoIcons.pen),
                            //   isLabelVisible: true,
                            //   label: "الاسم الاخير",
                            //   bottomSpace: Insets.margin,
                            // ),
                            CustomTextFormField(
                              validators: [
                                IsRequiredRule(),
                              ],
                              hint: ''.tr,
                              controller: data.mobileController,
                              prefixIcon: const Icon(CupertinoIcons.phone),
                              isLabelVisible: true,
                              keyboardType: TextInputType.phone,
                              label: "رقم الهاتف",
                              bottomSpace: Insets.margin,
                            ),
                            CustomTextFormField(
                              validators: [
                                IsRequiredRule(),
                              ],
                              hint: ''.tr,
                              controller: data.passwordController,
                              isLabelVisible: true,
                              label: "كلمة السر",
                              obscureText: !data.isShow.value,
                              suffixIcon: InkMe(
                                onTap: () {
                                  data.isShow.value = !data.isShow.value;
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Icon(
                                    !data.isShow.value
                                        ? CupertinoIcons.eye
                                        : CupertinoIcons.eye_slash,
                                    color: context.theme.colorScheme.outline,
                                  ),
                                ),
                              ),
                              bottomSpace: Insets.small,
                            ),
                            Gap(Insets.medium),
                            CustomFillButton(
                              title: 'انشاء الحساب'.tr,
                              loading: data.isLoading.value
                                  ? SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : null,
                              onTap: () {
                                // data.register(
                                //     mobile: data.mobileController.text,
                                //     firstname: data.firstnameController.text,
                                //     lastname: data.lastNameController.text,
                                //     username: data.usernameController.text,
                                //     email: data.emailController.text,
                                //     password: data.passwordController.text);
                              },
                              backgroundColor:
                                  context.theme.colorScheme.primary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Insets.margin),
                  child: Column(
                    children: [
                      Gap(Insets.medium),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: context.theme.colorScheme.outline
                                  .withOpacity(0.2),
                            ),
                          ),
                          Gap(Insets.small),
                          Text(
                            'or'.tr,
                            style: context.theme.textTheme.labelMedium!
                                .copyWith(
                                    color: context.theme.colorScheme.outline),
                          ),
                          Gap(Insets.small),
                          Expanded(
                            child: Divider(
                              color: context.theme.colorScheme.outline
                                  .withOpacity(0.2),
                            ),
                          ),
                        ],
                      ),
                      Gap(Insets.large),
                      GetX(
                        init: authController,
                        builder: (data) => CustomOutLineButton(
                          title: 'تسجيل الدخول'.tr,
                          loading: data.isLoading.value
                              ? CircularProgressIndicator(
                                  color: context.theme.colorScheme.primary,
                                )
                              : null,
                          onTap: () {
                            Get.back();
                          },
                        ),
                      ),
                      Gap(Insets.large),
                    ],
                  ),
                )
              ].animate(interval: 50.ms).fade(duration: 400.ms),
            ),
          ),
        ),
      ),
    );
  }

  AuthController authController = Get.find();
  SetDataController controller = Get.find();
}
