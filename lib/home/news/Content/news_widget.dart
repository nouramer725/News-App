import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/home/news/Content/news_item.dart';
import 'package:news_app/model/news_model.dart';
import 'package:news_app/model/news_response.dart';
import '../../../l10n/app_localizations.dart';
import '../../../utils/responsive.dart';
import '../../loading_item/loading_item.dart';

class NewsWidget extends StatefulWidget {
  final Source news;
  const NewsWidget({super.key, required this.news});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  List<News> articles = [];
  int currentPage = 1;
  bool isLoading = false;
  bool isMoreLoading = false;
  bool hasMore = true;

  ScrollController scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant NewsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.news.id != widget.news.id) {
      currentPage = 1;
      articles.clear();
      hasMore = true;
      loadNews();
    }
  }

  @override
  void initState() {
    super.initState();
    loadNews();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !isMoreLoading &&
          hasMore) {
        loadMore();
      }
    });
  }

  Future<void> loadNews() async {
    setState(() {
      isLoading = true;
    });

    var response = await ApiManager.getNewsByIdWithPages(
      widget.news.id ?? '',
      page: currentPage,
    );

    if (response.status == 'ok') {
      articles = response.articles ?? [];
      if (articles.length < 10) {
        hasMore = false;
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> loadMore() async {
    setState(() {
      isMoreLoading = true;
      currentPage++;
    });

    var response = await ApiManager.getNewsByIdWithPages(
      widget.news.id ?? '',
      page: currentPage,
    );

    if (response.status == 'ok') {
      var newArticles = response.articles ?? [];
      articles.addAll(newArticles);

      if (newArticles.length < 10) {
        hasMore = false;
      }
    }

    setState(() {
      isMoreLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: LoadingItem());
    }
    if (articles.isEmpty) {
      return Center(
        child: Text(
          AppLocalizations.of(context)!.no_news_found,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }
    return ListView.builder(
      controller: scrollController,
      itemCount: articles.length + (isMoreLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index < articles.length) {
          return NewsItem(news: articles[index]);
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: w(16), vertical: h(10)),
            child: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).splashColor,
              ),
            ),
          );
        }
      },
    );
  }
}
