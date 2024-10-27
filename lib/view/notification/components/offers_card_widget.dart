import 'package:fiber/config/constant.dart';
import 'package:fiber/models/offers_model.dart';
import 'package:fiber/view/plans/components/custom_active_bottom_sheet.dart';
import 'package:flutter/material.dart';

class OffersCardWidget extends StatelessWidget {
  final OffersModel model;
  const OffersCardWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Insets.large),
                topRight: Radius.circular(Insets.large),
              ),
            ),
            builder: (BuildContext context) {
              return CustomActiveBottomSheet();
            });
      },
      child: Container(
        padding: EdgeInsets.all(Insets.margin),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: Insets.small),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Insets.large),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Insets.large),
                  image: DecorationImage(
                      image: AssetImage(Assets.assetsImagesImage1),
                      fit: BoxFit.cover)),
            ),
            Gap(Insets.medium),
            Text(
              model.title ?? "",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold),
            ),
            Gap(Insets.exSmall),
            Text(
              model.description ?? "",
              style: TextStyle(color: Color(0xFF7C758A)),
            ),
            Gap(Insets.small),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "اشترك الان",
            //       style: Theme.of(context).textTheme.titleMedium!.copyWith(
            //           color: Theme.of(context).colorScheme.primary,
            //           fontWeight: FontWeight.bold,
            //           fontSize: 16),
            //     ),
            //     Icon(
            //       CupertinoIcons.forward,
            //       color: Theme.of(context).colorScheme.primary,
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
