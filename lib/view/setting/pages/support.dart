import 'package:fiber/config/const_wodget/custom_fill_button.dart';
import 'package:fiber/config/const_wodget/custom_text_form_field.dart';
import 'package:fiber/config/constant.dart';
import 'package:fiber/config/validator/validators.dart';
import 'package:fiber/controller/support/support_controller.dart';
import 'package:fiber/models/ticket_model.dart';
import 'package:fiber/view/plans/components/custom_back_button.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatefulWidget {
  final bool isRepare;
  const SupportPage({super.key, this.isRepare = false});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  SupportController supportController = Get.put(SupportController());

  TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        leadingWidth: 65,
        leading: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(Insets.margin),
            const CustomBackButton(),
          ],
        ),
        title: Text(
          widget.isRepare ? 'طلب صيانة' : "مراسلة الدعم".tr,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.small),
          child: Column(
            children: [
              Gap(Insets.medium),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: phoneController,
                      validators: [IsRequiredRule()],
                      isLabelVisible: true,
                      label: 'رقم الهاتف'.tr,
                      hint: 'رقم هاتفك ليتم الاتصال بك',
                      keyboardType: TextInputType.phone,
                      bottomSpace: Insets.medium,
                    ),
                    CustomTextFormField(
                      controller: subjectController,
                      validators: [IsRequiredRule()],
                      isLabelVisible: true,
                      label: widget.isRepare ? 'العنوان' : 'عنوان المشكلة'.tr,
                      hint: '',
                      bottomSpace: Insets.medium,
                    ),
                    CustomTextFormField(
                      controller: descriptionController,
                      validators: [IsRequiredRule()],
                      isLabelVisible: true,
                      label: widget.isRepare
                          ? 'تفاصيل الصيانة'
                          : 'تفاصيل المشكلة'.tr,
                      hint: '',
                      maxLines: 10,
                      bottomSpace: Insets.medium,
                    ),
                    Obx(() => CustomFillButton(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              var model = TicketModel(
                                  subject: subjectController.text,
                                  description: descriptionController.text,
                                  phone: phoneController.text);
                              var request =
                                  await supportController.sendTicket(model);
                              // if request reset the form
                              if (request) {
                                subjectController.clear();
                                descriptionController.clear();
                                phoneController.clear();
                                _formKey.currentState!.reset();
                              }
                            }
                          },
                          title: "ارسال",
                          loading: supportController.isLoading.value
                              ? SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : null,
                          backgroundColor: context.theme.colorScheme.primary,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
