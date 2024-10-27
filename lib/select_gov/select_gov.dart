import "package:fiber/config/const_wodget/custom_fill_button.dart";
import "package:fiber/config/constant.dart";
import "package:fiber/config/utils/const_class.dart";
import "package:fiber/main.dart";
import "package:flutter/material.dart";
import "../config/interceptor/sas_interceptor.dart";
import '../view/auth/login_page.dart';

class SelectGovPage extends StatefulWidget {
  const SelectGovPage({super.key});

  @override
  State<SelectGovPage> createState() => _SelectGovPageState();
}

class _SelectGovPageState extends State<SelectGovPage> {
  List govs = [
    {"title": "الكوت", "id": 1, "selected": false},
    {"title": "البصرة", "id": 2, "selected": false}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: 200,
              color: Colors.white,
            ),
            Gap(Insets.margin),
            Text(
              "اهلا بك في Fiberx",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold),
            ),
            Gap(Insets.small),
            Text(
              "الرجاء قم باختيار المحافظة الخاصة بك للدخول الى التطبيق",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                  ),
              textAlign: TextAlign.center,
            ),
            Gap(Insets.margin),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: govs.map((e) {
                return InkMe(
                  onTap: () {
                    setState(() {
                      prefs.setBool("selected_gov", true);
                      prefs.setInt("gov", e["id"]);
                      Get.find<SasHttp>().configureDio();
                      Get.offAll(() => LoginPage());
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: Insets.margin, vertical: Insets.small),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(Insets.margin),
                    decoration: BoxDecoration(
                        color: e["selected"]
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.primary,
                        border: Border.all(
                            color: e["selected"]
                                ? Colors.transparent
                                : Colors.white),
                        borderRadius: BorderRadius.circular(Insets.exLarge)),
                    child: Text(
                      e["title"],
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                );
              }).toList(),
            ),
            Gap(Insets.margin),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: Insets.margin),
            //   child: CustomOutLineButton(
            //     onTap: () {
            //       var getSelected = govs.firstWhere(
            //           (element) => element["selected"] == true,
            //           orElse: () => null);
            //       if (getSelected != null) {
            //         prefs.setBool("selected_gov", true);
            //         prefs.setInt("gov", getSelected["id"]);
            //         Get.find<SasHttp>().configureDio();
            //         Get.offAll(() => LoginPage());
            //       }
            //     },
            //     title: "دخول",
            //     color: Colors.white,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
