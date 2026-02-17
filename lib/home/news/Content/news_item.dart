import 'package:flutter/material.dart';
import 'package:news_app/model/news_response.dart';
import 'package:news_app/utils/responsive.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'bottom_sheet_widget.dart';

class NewsItem extends StatelessWidget {
  final News news;
  const NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    DateTime publishedAtTime = DateTime.parse(news.publishedAt ?? '');

    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Theme.of(context).splashColor,
          context: context,
          builder: (BuildContext context) {
            return BottomSheetWidget(
              url: news.url ?? '',
              urlToImage: news.urlToImage ?? '',
              description: news.description ?? '',
            );
          },
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: w(16), vertical: h(10)),
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
              child: Image.network(
                news.urlToImage ?? '',
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) {
                  return const Icon(Icons.image_not_supported);
                },
              ),
            ),
            Text(
              news.description ?? '',
              style: Theme.of(context).textTheme.labelLarge,
              maxLines: 2,
            ),
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
      ),
    );
  }
}
