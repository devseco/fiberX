import 'package:fiber/config/constant.dart';
import 'package:fiber/models/news_model.dart';
import 'package:fiber/view/news/news_info.dart';

class CustomNewsCard extends StatelessWidget {
  final bool? isNews;
  const CustomNewsCard({
    super.key,
    required this.news,
    this.isNews,
  });

  final List<NewsModel> news;

  @override
  Widget build(BuildContext context) {
    if (isNews == null) {
      return AspectRatio(
        aspectRatio: 12 / 9,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: Insets.small),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: news.length,
          separatorBuilder: (context, index) => SizedBox(width: Insets.small),
          itemBuilder: (context, index) {
            return InkMe(
              onTap: () {
                Get.to(
                    () => NewsInfo(
                          news: news[index],
                        ),
                    transition: Transition.fade);
              },
              child: Container(
                width: context.width * 0.6,
                padding: EdgeInsets.all(Insets.small),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(Insets.medium),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: news[index].id ?? "",
                      child: AspectRatio(
                        aspectRatio: 13 / 9,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Insets.small),
                          ),
                          child: Images(
                            img: news[index].image ?? "",
                            width: context.width * 0.6,
                            height: context.height * 0.3,
                            radius: 0,
                            defaultImg: true,
                            color: context.theme.colorScheme.surface,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Insets.small),
                    Text(
                      news[index].title ?? "",
                      style: context.theme.textTheme.titleSmall!.copyWith(
                        color: context.theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: Insets.exSmall),
                    Text(
                      news[index].description ?? "",
                      style: context.theme.textTheme.labelSmall!.copyWith(
                        color: context.theme.colorScheme.outline,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    } else {
      return Expanded(
        child: ListView.separated(
          padding: EdgeInsets.only(
              left: Insets.small,
              right: Insets.small,
              bottom: Insets.exLarge * 3),
          itemCount: news.length,
          separatorBuilder: (context, index) => SizedBox(height: Insets.small),
          itemBuilder: (context, index) {
            return InkMe(
              onTap: () {
                Get.to(
                    () => NewsInfo(
                          news: news[index],
                        ),
                    transition: Transition.fade);
              },
              child: Container(
                padding: EdgeInsets.all(Insets.small),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(Insets.medium),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: news[index].id ?? index.toString(),
                      child: AspectRatio(
                        aspectRatio: 15 / 9,
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Insets.medium),
                          ),
                          child: Images(
                            img: news[index].image ?? "",
                            width: context.width * 0.6,
                            height: context.height * 0.3,
                            defaultImg: true,
                            radius: 0,
                            color: context.theme.colorScheme.surface,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Insets.small),
                    Text(
                      news[index].title ?? '',
                      style: context.theme.textTheme.titleSmall!.copyWith(
                        color: context.theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: Insets.exSmall),
                    Text(
                      news[index].description ?? '',
                      style: context.theme.textTheme.labelSmall!.copyWith(
                        color: context.theme.colorScheme.outline,
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
