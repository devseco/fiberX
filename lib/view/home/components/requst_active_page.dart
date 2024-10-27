import 'package:fiber/config/const_wodget/custom_fill_button.dart';
import 'package:fiber/config/const_wodget/custom_text_form_field.dart';
import 'package:fiber/config/const_wodget/ink_me.dart';
import 'package:fiber/config/constant.dart';
import 'package:fiber/config/validator/validators.dart';
import 'package:fiber/controller/auth/auth_controller.dart';
import 'package:fiber/controller/set_data_controller.dart';
import 'package:fiber/view/auth/components/custom_app_bar.dart';
import 'package:fiber/view/home/components/map_page.dart';
import 'package:fiber/view/navigation/navigation_page.dart';
import 'package:fiber/view/plans/components/custom_back_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class ReqyestActivePage extends StatefulWidget {
  const ReqyestActivePage({super.key});

  @override
  State<ReqyestActivePage> createState() => _SignupPageState();
}

class _SignupPageState extends State<ReqyestActivePage> {
  Position? _currentPosition;
  AuthController authController = Get.find();
  bool disabled = false;
  // form key
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _requestPermissionAndGetLocation();
  }

  Future<void> _requestPermissionAndGetLocation() async {
    // Request location permission
    var status = await Permission.locationWhenInUse.request();

    if (status == PermissionStatus.granted) {
      // Permission granted, get location
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentPosition = position;
      });

      authController.lattitude.value = _currentPosition!.latitude;
      authController.longitude.value = _currentPosition!.longitude;
    } else if (status == PermissionStatus.denied) {
      var r = await Permission.locationWhenInUse.request();

      // disabled = true;

      setState(() {
        disabled = true;
      });
    } else if (status == PermissionStatus.permanentlyDenied) {
      await openAppSettings();
    }
  }

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
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.all(Insets.medium),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "طلب تفعيل الخدمة",
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
                              controller: data.fullName,
                              prefixIcon: const Icon(CupertinoIcons.person),
                              isLabelVisible: true,
                              label: "الاسم الثلاثي",
                              bottomSpace: Insets.margin,
                            ),
                            CustomTextFormField(
                              validators: [],
                              hint: ''.tr,
                              controller: data.emailController,
                              prefixIcon: const Icon(CupertinoIcons.mail),
                              isLabelVisible: true,
                              label: "البريد الالكتروني",
                              bottomSpace: Insets.margin,
                              keyboardType: TextInputType.emailAddress,
                            ),
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
                              controller: data.addressController,
                              prefixIcon: const Icon(CupertinoIcons.map),
                              isLabelVisible: true,
                              label: "اقرب نقطة دالة",
                              bottomSpace: Insets.margin,
                              keyboardType: TextInputType.emailAddress,
                            ),
                            Gap(Insets.medium),
                            Obx(
                              () => InkMe(
                                onTap: () {
                                  Get.to(MapPage());
                                },
                                child: Text(
                                    authController.locationSelected.value
                                        ? "تم تحديد الموقع"
                                        : "اضغط لتحديد الموقع",
                                    style: context.theme.textTheme.titleMedium!
                                        .copyWith(
                                            color: context
                                                .theme.colorScheme.primary)),
                              ),
                            ),
                            Gap(Insets.medium),
                            disabled
                                ? Container()
                                : CustomFillButton(
                                    title: 'طلب التفعيل'.tr,
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
                                      if (_formKey.currentState!.validate()) {
                                        data.register(
                                          mobile: data.mobileController.text,
                                          addressController:
                                              data.addressController.text,
                                          fullName: data.fullName.text,
                                          email: data.emailController.text,
                                        );
                                      }
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
                      CustomOutLineButton(
                        title: 'تسجيل الدخول'.tr,
                        onTap: () {
                          Get.back();
                        },
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

  SetDataController controller = Get.find();
}
