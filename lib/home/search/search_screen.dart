import 'package:flutter/material.dart';
import 'package:news_app/home/error_item/error_item.dart';
import 'package:news_app/home/loading_item/loading_item.dart';
import 'package:news_app/home/search/search_widget.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/utils/responsive.dart';
import '../../api/api_manager.dart';
import '../../model/news_response.dart';
import '../news/Content/news_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';
  Future<NewsResponse>? searchFuture;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w(12)),
              child: SearchWidget(
                searchController: searchController,
                closeIconOnPressed: () {
                  setState(() {
                    query = '';
                    searchController.clear();
                    searchFuture = null;
                  });
                },
                onChanged: (value) {
                  onSearchChanged(value);
                },
              ),
            ),
            Expanded(
              child: searchFuture == null
                  ? Center(
                      child: Text(
                        AppLocalizations.of(context)!.type_something,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    )
                  : FutureBuilder<NewsResponse>(
                      future: searchFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return LoadingItem();
                        } else if (snapshot.hasError) {
                          return ErrorItem(
                            text: AppLocalizations.of(
                              context,
                            )!.something_went_wrong,
                            onPressed: () {
                              onSearchChanged(query);
                            },
                          );
                        } else if (snapshot.data == null ||
                            snapshot.data!.articles!.isEmpty) {
                          return Center(
                            child: Text(
                              AppLocalizations.of(context)!.no_news_found,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
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
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void onSearchChanged(String value) {
    setState(() {
      query = value;
      if (query.isNotEmpty) {
        searchFuture = ApiManager.searchForNews(query);
      } else {
        searchFuture = null;
      }
    });
  }
}
