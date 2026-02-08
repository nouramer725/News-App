import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/news/Content/news_item.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/provider/app_language_provider.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../../error_item/error_item.dart';
import '../../loading_item/loading_item.dart';

class NewsWidget extends StatelessWidget {
  final Source news;
  const NewsWidget({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return FutureBuilder(
      future: ApiManager.getNewsById(news.id ?? '', languageProvider.appLocal),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: LoadingItem());
        } else if (snapshot.hasError) {
          return ErrorItem(
            onPressed: () {
              ApiManager.getNewsById(news.id ?? '', languageProvider.appLocal);
            },
            text: AppLocalizations.of(context)!.something_went_wrong,
          );
        }
        if (snapshot.data?.status != 'ok') {
          return ErrorItem(
            onPressed: () {
              ApiManager.getNewsById(news.id ?? '', languageProvider.appLocal);
            },
            text: snapshot.data!.message!,
          );
        }

        var newsList = snapshot.data?.articles ?? [];
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsItem(news: newsList[index]);
          },
          itemCount: newsList.length,
        );
      },
    );
  }
}
