import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:fiber/config/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomChartWidget extends StatelessWidget {
  final String title;
  final Color color;
  final String value;
  final IconData icon;
  final bool isRow;
  CustomChartWidget(
      {super.key,
      required this.title,
      required this.color,
      required this.value,
      required this.icon,
      this.isRow = false});
  var data = [2.0, 2.0, 2.5, 2.0, 2.0, 3.0, 1.4, 1.8, 2.0, 1.0];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Insets.large)),
      width: MediaQuery.of(context).size.width,
      height: 160,
      child: Column(
        children: [
          Gap(Insets.medium),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.margin),
            child: Row(
              children: [
                Container(
                  width: isRow ? 20 : 35,
                  height: isRow ? 20 : 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: color,
                  ),
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: isRow ? 12 : 16,
                  ),
                ),
                Gap(Insets.small),
                Text(
                  title,
                  style: isRow
                      ? Theme.of(context).textTheme.titleSmall
                      : Theme.of(context).textTheme.titleSmall,
                ),
                Spacer(),
                Text(
                  "Mbps",
                  style: isRow
                      ? Theme.of(context).textTheme.titleSmall
                      : Theme.of(context).textTheme.titleSmall,
                ),
                Gap(Insets.exSmall),
                Text(
                  value,
                  style: isRow
                      ? Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontWeight: FontWeight.bold)
                      : Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(Insets.large),
            child: Sparkline(
                lineColor: color,
                fillGradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [color, color.withOpacity(0.1)],
                ),
                fillMode: FillMode.below,
                data: data,
                useCubicSmoothing: true),
          ),
        ],
      ),
    );
  }
}
