import 'package:fiber/config/constant.dart';
import 'package:fiber/models/plans_model.dart';
import 'package:fiber/view/plans/components/custom_active_bottom_sheet.dart';
import 'package:flutter/material.dart';

class PlanCardWidget extends StatelessWidget {
  final PlansModel plansModel;
  const PlanCardWidget({super.key, required this.plansModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // showBottomSheet(
        //     backgroundColor: Colors.transparent,
        //     context: context,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(Insets.large),
        //         topRight: Radius.circular(Insets.large),
        //       ),
        //     ),
        //     builder: (BuildContext context) {
        //       return CustomActiveBottomSheet();
        //     });
      },
      child: Container(
        padding: EdgeInsets.all(Insets.margin),
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: Insets.medium),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Insets.large),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Insets.medium),
              ),
              child: Images(
                color: Theme.of(context).colorScheme.primary,
                width: MediaQuery.of(context).size.width,
                height: 150,
                radius: Insets.exLarge,
                img: plansModel.imageUrl,
              ),
            ),
            Gap(Insets.medium),
            Text(
              plansModel.name ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
            Gap(Insets.exSmall),
            Text(
              plansModel.description ?? "",
              style: TextStyle(color: Color(0xFF7C758A)),
            ),
            Gap(Insets.small),
            Text(
              formatCurrency(plansModel.price),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
