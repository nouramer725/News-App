import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/utils/responsive.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  final News news;
  const NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    DateTime publishedAtTime = DateTime.parse(news.publishedAt ?? '');

    return Container(
      margin: EdgeInsets.symmetric(horizontal: w(16), vertical: h(16)),
      padding: EdgeInsets.symmetric(horizontal: w(10), vertical: h(10)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).primaryColor,
        border: Border.all(width: 2, color: Theme.of(context).splashColor),
      ),
      child: Column(
        spacing: h(10),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(news.urlToImage ?? ''),
          ),
          Text(news.title ?? '', style: Theme.of(context).textTheme.labelLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: w(25),
            children: [
              Expanded(
                child: Text(
                  "By : ${news.author ?? ''}",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              Text(
                maxLines: 2,
                timeago.format(publishedAtTime),
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
