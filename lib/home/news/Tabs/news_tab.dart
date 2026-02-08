import 'package:flutter/material.dart';

import '../../../model/news_model.dart';

class NewsTab extends StatelessWidget {
  final Source news;
  final bool isSelected;
  NewsTab({super.key, required this.news, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(
      news.name ?? '',
      style: isSelected
          ? Theme.of(context).textTheme.labelLarge!
          : Theme.of(context).textTheme.labelSmall,
    );
  }
}
