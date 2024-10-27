import 'package:fiber/config/constant.dart';
import 'package:fiber/models/ads_model.dart';
import 'package:flutter/material.dart';

class CustomOffersCard extends StatefulWidget {
  const CustomOffersCard({
    super.key,
    required this.ads,
  });

  final List<AdsModel> ads;

  @override
  State<CustomOffersCard> createState() => _CustomOffersCardState();
}

class _CustomOffersCardState extends State<CustomOffersCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.ads.length,
            onPageChanged: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.symmetric(horizontal: Insets.small),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Insets.medium),
                ),
                child: Images(
                  img: widget.ads[index].image ?? "",
                  radius: 0,
                  height: context.height * 0.3,
                  width: context.width * 0.6,
                  color: context.theme.colorScheme.surface,
                ),
              );
            },
          ),
        ),
        SizedBox(height: Insets.small + 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.ads.length,
            (index) => AnimatedContainer(
              duration: Durations.long1,
              margin: EdgeInsets.symmetric(horizontal: Insets.small / 2),
              width: index == currentIndex ? Insets.exLarge : 8,
              height: 7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Insets.small),
                boxShadow: index == currentIndex
                    ? [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 5,
                        )
                      ]
                    : [],
                color: index == currentIndex
                    ? context.theme.colorScheme.primary
                    : context.theme.colorScheme.outline.withOpacity(0.5),
              ),
            ),
          ),
        ),
      ],
    );
  }

  int currentIndex = 0;
}
