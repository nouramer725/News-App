import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/category_screen/category.dart';
import 'package:news_app/home/category_screen/category_fragment.dart';
import 'package:news_app/home/error_item/error_item.dart';
import 'package:news_app/home/loading_item/loading_item.dart';
import 'package:news_app/home/news/Tabs/news_tab_widget.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/utils/app_routes.dart';
import 'drawer/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  final Category category;

  HomeScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: DrawerWidget()),
      appBar: AppBar(
        title: Text(
          category.title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {
          Navigator.pushNamed(context, AppRoutes.searchScreen);
        }, icon: Icon(Icons.search))],
      ),
      body: FutureBuilder<NewsModel>(
        future: ApiManager.getNews(category.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingItem();
          } else if (snapshot.hasError) {
            return ErrorItem(
              onPressed: () {
                ApiManager.getNews(category.id);
              },
              text: AppLocalizations.of(context)!.something_went_wrong,
            );
          }
          if (snapshot.data?.status != 'ok') {
            return ErrorItem(
              onPressed: () {
                ApiManager.getNews(category.id);
              },
              text: snapshot.data!.message!,
            );
          }
          var sourceList = snapshot.data?.sources ?? [];
          return NewsTabWidget(newsList: sourceList);
        },
      ),
    );
  }
}
