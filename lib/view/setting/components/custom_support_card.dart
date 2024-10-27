import 'package:fiber/config/constant.dart';
import 'package:fiber/view/setting/pages/questions_page.dart';
import 'package:fiber/view/setting/pages/support.dart';
import 'package:flutter/material.dart';

class CustomSupportCard extends StatelessWidget {
  const CustomSupportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          dense: true,
          visualDensity: VisualDensity.comfortable,
          enableFeedback: false,
          minVerticalPadding: 0,
          onTap: () {
            Get.to(QuestionsPage());
          },
          titleAlignment: ListTileTitleAlignment.center,
          style: ListTileStyle.list,
          horizontalTitleGap: Insets.small,
          title: Text(
            'الأسئلة الشائعة'.tr,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
          ),
          leading: SvgPicture.asset(
            Assets.assetsIconsQuestion,
            width: 24,
            height: 24,
          ),
          trailing: SvgPicture.asset(
            Assets.assetsIconsCaretRight,
            width: 24,
            height: 24,
          ),
        ),
        ListTile(
          onTap: () {
            Get.to(() => const SupportPage(), transition: Transition.fade);
          },
          contentPadding: EdgeInsets.zero,
          dense: true,
          visualDensity: VisualDensity.comfortable,
          enableFeedback: false,
          minVerticalPadding: 0,
          titleAlignment: ListTileTitleAlignment.center,
          style: ListTileStyle.list,
          horizontalTitleGap: Insets.small,
          title: Text(
            'مراسلة الدعم'.tr,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
          ),
          leading: SvgPicture.asset(
            Assets.assetsIconsHeadset,
            width: 24,
            height: 24,
          ),
          trailing: SvgPicture.asset(
            Assets.assetsIconsCaretRight,
            width: 24,
            height: 24,
          ),
        ),
        // ListTile(
        //   contentPadding: EdgeInsets.zero,
        //   dense: true,
        //   visualDensity: VisualDensity.comfortable,
        //   enableFeedback: false,
        //   minVerticalPadding: 0,
        //   titleAlignment: ListTileTitleAlignment.center,
        //   style: ListTileStyle.list,
        //   horizontalTitleGap: Insets.small,
        //   title: Text(
        //     'الاحكام و الشروط'.tr,
        //     style: Theme.of(context).textTheme.titleMedium!.copyWith(
        //           color: Theme.of(context).colorScheme.outline,
        //         ),
        //   ),
        //   leading: SvgPicture.asset(
        //     Assets.assetsIconsCertificate,
        //     width: 24,
        //     height: 24,
        //   ),
        //   trailing: SvgPicture.asset(
        //     Assets.assetsIconsCaretRight,
        //     width: 24,
        //     height: 24,
        //   ),
        // ),
      ],
    );
  }
}
