import 'package:flutter/cupertino.dart';
import 'package:news_app/utils/app_assets.dart';
import '../../l10n/app_localizations.dart';

class Category {
  String id;
  String image;
  String title;
  Category({required this.id, required this.image, required this.title});

  static List<Category> getCategories(BuildContext context) {
    return [
      Category(
        id: "general",
        title: AppLocalizations.of(context)!.general,
        image: AppAssets.general,
      ),
      Category(
        id: "business",
        title: AppLocalizations.of(context)!.business,
        image: AppAssets.business,
      ),
      Category(
        id: "entertainment",
        title: AppLocalizations.of(context)!.entertainment,
        image: AppAssets.entertainment,
      ),
      Category(
        id: "health",
        title: AppLocalizations.of(context)!.health,
        image: AppAssets.health,
      ),
      Category(
        id: "science",
        title: AppLocalizations.of(context)!.science,
        image: AppAssets.science,
      ),
      Category(
        id: "sport",
        title: AppLocalizations.of(context)!.sport,
        image: AppAssets.sport,
      ),
      Category(
        id: "technology",
        title: AppLocalizations.of(context)!.technology,
        image: AppAssets.technology,
      ),
    ];
  }
}
