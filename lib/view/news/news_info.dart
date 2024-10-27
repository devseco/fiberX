import 'package:fiber/config/constant.dart';
import 'package:fiber/models/news_model.dart';
import 'package:fiber/view/plans/components/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:since_date/since_date.dart';

class NewsInfo extends StatefulWidget {
  final NewsModel news;
  const NewsInfo({super.key, required this.news});

  @override
  State<NewsInfo> createState() => _NewsInfoState();
}

class _NewsInfoState extends State<NewsInfo> {
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
          "تفاصيل الخبر".tr,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(Insets.small),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: widget.news.id!,
                child: AspectRatio(
                  aspectRatio: 12 / 9,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Insets.medium),
                    ),
                    child: Images(
                      img: widget.news.image ?? "",
                      width: context.width * 0.6,
                      height: context.height * 0.3,
                      defaultImg: true,
                      color: Theme.of(context).colorScheme.surface,
                      radius: 0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Insets.medium),
              Text(
                widget.news.title ?? "",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: Insets.exSmall),
              SinceDate(
                widget.news.creationDate!,
                textStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                local: "ar",
              ),
              SizedBox(height: Insets.small),
              Text(
                widget.news.description ?? '',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
              ),
              SizedBox(height: Insets.exLarge),
            ].animate(interval: 50.ms).fade(),
          ),
        ),
      ),
    );
  }
}
