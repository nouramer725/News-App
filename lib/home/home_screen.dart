import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/error_item/error_item.dart';
import 'package:news_app/home/loading_item/loading_item.dart';
import 'package:news_app/home/news/Tabs/news_tab_widget.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/news_model.dart';
import 'drawer/drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: DrawerWidget()),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.news_app,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: FutureBuilder<NewsModel>(
        future: ApiManager.getNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingItem();
          } else if (snapshot.hasError) {
            return ErrorItem(
              onPressed: () {
                ApiManager.getNews();
              },
              text: AppLocalizations.of(context)!.something_went_wrong,
            );
          }
          if (snapshot.data?.status != 'ok') {
            return ErrorItem(
              onPressed: () {
                ApiManager.getNews();
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
