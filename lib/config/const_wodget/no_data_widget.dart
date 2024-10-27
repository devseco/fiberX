import 'package:fiber/config/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  final String? details;
  // refresh function
  final Function? refresh;
  const NoDataWidget({super.key, this.details, this.refresh});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/nodata.png",
            width: 200,
          ),
          Text(
            "لا يوجد بيانات",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold),
          ),
          Gap(Insets.exSmall),
          if (details != null)
            Text(
              details!,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Color(0xFF7C758A), fontWeight: FontWeight.normal),
            ),
          if (refresh != null)
            TextButton(
              onPressed: () {
                refresh!();
              },
              child: Text(
                "اعادة المحاولة",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
            ),
        ],
      ),
    );
  }
}
