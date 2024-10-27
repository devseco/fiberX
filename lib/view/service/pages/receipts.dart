import 'package:fiber/config/const_wodget/no_data_widget.dart';
import 'package:fiber/config/constant.dart';
import 'package:fiber/controller/home/home_controller.dart';
import 'package:fiber/models/invoice_model.dart';
import 'package:fiber/view/plans/components/custom_back_button.dart';
import 'package:fiber/view/service/pages/components/receipts_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:since_date/since_date.dart';

class ReceiptsPage extends StatefulWidget {
  const ReceiptsPage({super.key});

  @override
  State<ReceiptsPage> createState() => _ReceiptsPageState();
}

class _ReceiptsPageState extends State<ReceiptsPage> {
  HomeController homeController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    homeController.getInvoiceList();
    super.initState();
  }

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
            "الفواتير".tr,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(
          () => homeController.loadInvoice.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : !homeController.loadInvoice.value &&
                      homeController.invoiceList.isEmpty
                  ? Center(
                      child: NoDataWidget(),
                    )
                  : Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            itemCount: homeController.invoiceList.length,
                            padding: EdgeInsets.only(
                                left: Insets.margin,
                                right: Insets.margin,
                                bottom: Insets.margin),
                            separatorBuilder: (context, index) =>
                                Gap(Insets.small),
                            itemBuilder: (context, index) {
                              InvoiceModel invoiceModel =
                                  homeController.invoiceList[index];
                              return InkMe(
                                onTap: () {
                                  // customBottomSheet(
                                  //   context,
                                  //   height: context.height * 0.35,
                                  //   child: const ReceiptsInfo(),
                                  // );
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      padding: EdgeInsets.all(Insets.small),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(color: Colors.white),
                                        color: Colors.white.withOpacity(0.4),
                                      ),
                                      child: SvgPicture.asset(
                                        Assets.assetsIconsReceipts,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        width: Insets.small,
                                      ),
                                    ),
                                    Gap(Insets.medium),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                invoiceModel.invoiceNumber ??
                                                    "",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(),
                                              ),
                                            ),
                                            Text(invoiceModel.amount ?? "",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith()),
                                            Spacer(),
                                            SinceDate(
                                              DateTime.now().subtract(
                                                const Duration(days: 1),
                                              ),
                                              textStyle: const TextStyle(
                                                  color: Color(0xFF7C758A)),
                                            ),
                                          ],
                                        ),
                                        Gap(Insets.exSmall),
                                        Text(
                                          invoiceModel.description ?? "",
                                          style: TextStyle(
                                              color: Color(0xFF7C758A)),
                                        )
                                      ],
                                    ))
                                  ],
                                ),
                              );
                            },
                          ),
                        )
                      ].animate(interval: 50.ms).fadeIn(),
                    ),
        ));
  }
}
