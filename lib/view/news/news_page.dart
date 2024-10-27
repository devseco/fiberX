import 'package:fiber/config/constant.dart';
import 'package:fiber/controller/news/news_controller.dart';
import 'package:fiber/view/home/components/custom_news_card.dart';
import 'package:fiber/view/plans/components/custom_back_button.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsController newsController = Get.find();

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    newsController.getData();
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      onRefresh: _onRefresh,
      controller: _refreshController,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            toolbarHeight: 70,
            leadingWidth: 65,
              leading: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            ],
          ),
            title: Text(
              "اخر الاخبار",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          body: Obx(() => newsController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    CustomNewsCard(
                      news: newsController.news,
                      isNews: true,
                    ),
                  ],
                ))),
    );
  }
}
