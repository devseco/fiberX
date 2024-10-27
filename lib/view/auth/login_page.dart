import 'package:fiber/config/const_wodget/custom_fill_button.dart';
import 'package:fiber/config/const_wodget/custom_text_form_field.dart';
import 'package:fiber/config/const_wodget/ink_me.dart';
import 'package:fiber/config/constant.dart';
import 'package:fiber/config/validator/validators.dart';
import 'package:fiber/controller/auth/auth_controller.dart';
import 'package:fiber/controller/set_data_controller.dart';
import 'package:fiber/main.dart';
import 'package:fiber/select_gov/select_gov.dart';
import 'package:fiber/view/auth/components/custom_app_bar.dart';
import 'package:fiber/view/auth/signup_page.dart';
import 'package:fiber/view/navigation/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
              const CustomAppBar(),
              Gap(Insets.exLarge * 0.5),
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
                            'Sign In'.tr,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    color: context.theme.colorScheme.primary,
                                    fontWeight: FontWeight.bold),
                          ),
                          Gap(Insets.medium),
                          CustomTextFormField(
                            validators: [
                              IsRequiredRule(),
                            ],
                            hint: ''.tr,
                            controller: data.emailController,
                            prefixIcon: const Icon(CupertinoIcons.person),
                            isLabelVisible: true,
                            label: "اسم المستخدم",
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
                                margin:
                                    const EdgeInsets.only(top: 10, right: 5),
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
                            title: 'Login'.tr,
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
                              data.login(
                                  email: data.emailController.text,
                                  password: data.passwordController.text);
                            },
                            backgroundColor: context.theme.colorScheme.primary,
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
                          style: context.theme.textTheme.labelMedium!.copyWith(
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
                        title: 'الدخول التلقائي'.tr,
                        loading: data.isLoading.value
                            ? CircularProgressIndicator(
                                color: context.theme.colorScheme.primary,
                              )
                            : null,
                        onTap: () {
                          data.autoLogin();
                        },
                      ),
                    ),
                    Gap(Insets.large),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ليس لديك حساب '.tr,
                          style: context.theme.textTheme.titleSmall!.copyWith(
                              color: context.theme.colorScheme.outline),
                        ),
                        // InkMe(
                        //   onTap: () {
                        //     Get.to(SignupPage());
                        //   },
                        //   child: Text(
                        //     'انشاء حساب'.tr,
                        //     style: context.theme.textTheme.titleSmall!.copyWith(
                        //       color:
                        //           context.theme.colorScheme.onPrimaryContainer,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //   ),
                        // ),
                        // Text(
                        //   ' او '.tr,
                        //   style: context.theme.textTheme.titleSmall!.copyWith(
                        //       color: context.theme.colorScheme.outline),
                        // ),
                        InkMe(
                          onTap: () {
                            Get.offAll(const NavigationPage());
                          },
                          child: Text(
                            'الدخول كزائر'.tr,
                            style: context.theme.textTheme.titleSmall!.copyWith(
                              color:
                                  context.theme.colorScheme.onPrimaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(Insets.large),
                    InkMe(
                      onTap: () {
                        Get.offAll(SelectGovPage());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          prefs.getInt("gov") == 1
                              ? Text("الكوت")
                              : Text("البصرة"),
                          Gap(Insets.small),
                          Icon(
                            CupertinoIcons.arrow_left_circle_fill,
                            size: 20,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ].animate(interval: 50.ms).fade(duration: 400.ms),
          ),
        ),
      ),
    );
  }

  AuthController authController = Get.find();
  SetDataController controller = Get.find();
}
