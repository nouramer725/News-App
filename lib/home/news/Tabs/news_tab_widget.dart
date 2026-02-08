import 'package:flutter/material.dart';
import 'package:news_app/home/news/Content/news_widget.dart';
import 'package:news_app/home/news/Tabs/news_tab.dart';
import 'package:news_app/model/news_model.dart';

class NewsTabWidget extends StatefulWidget {
  List<Source> newsList = [];
  NewsTabWidget({super.key, required this.newsList});

  @override
  State<NewsTabWidget> createState() => _NewsTabWidgetState();
}

class _NewsTabWidgetState extends State<NewsTabWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.newsList.length,
      child: Column(
        children: [
          TabBar(
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            isScrollable: true,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Theme.of(context).splashColor,
            indicatorColor: Theme.of(context).splashColor,
            tabAlignment: TabAlignment.start,
            dividerColor: Colors.transparent,
            tabs: widget.newsList
                .map(
                  (source) => NewsTab(
                    isSelected: currentIndex == widget.newsList.indexOf(source),
                    news: source,
                  ),
                )
                .toList(),
          ),
          Expanded(child: NewsWidget(news: widget.newsList[currentIndex])),
        ],
      ),
    );
  }
}
