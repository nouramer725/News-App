import 'package:flutter/material.dart';
import 'package:news_app/home/news/Content/web_view_screen.dart';
import 'package:news_app/l10n/app_localizations.dart';

import '../../../utils/responsive.dart';

class BottomSheetWidget extends StatelessWidget {
  final String url;
  final String urlToImage;
  final String description;
  const BottomSheetWidget({
    super.key,
    required this.url,
    required this.urlToImage,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: h(30)),
      padding: EdgeInsets.symmetric(horizontal: w(10), vertical: h(10)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).splashColor,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: h(30),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(urlToImage),
            ),
            Text(
              description,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(
                  Theme.of(context).primaryColor,
                ),
                padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(vertical: h(16)),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              onPressed: () {
                launchUrl(context, url);
              },
              child: Text(
                AppLocalizations.of(context)!.view_full_article,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> launchUrl(BuildContext context, String url) async {
    if (url.isEmpty) return;

    final uri = Uri.tryParse(url);

    if (uri == null) return;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => WebViewScreen(url: url)),
    );
  }
}
