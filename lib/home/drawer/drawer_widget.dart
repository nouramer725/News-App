import 'package:flutter/material.dart';
import 'package:news_app/home/drawer/widgets/divider_item.dart';
import 'package:news_app/home/drawer/widgets/drawer_item.dart';
import 'package:news_app/home/drawer/widgets/dropdown_item.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/responsive.dart';
import '../../utils/app_text.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: h(20),
        children: [
          Container(
            alignment: Alignment.center,
            height: h(200),
            color: AppColors.whiteColor,
            child: Text(
              AppLocalizations.of(context)!.news_app,
              style: AppText.boldText(
                color: AppColors.blackColor,
                fontSize: 24,
              ),
            ),
          ),
          DrawerItem(
            text: AppLocalizations.of(context)!.go_to_home,
            image: AppAssets.home,
          ),
          DividerItem(),
          DrawerItem(
            text: AppLocalizations.of(context)!.theme,
            image: AppAssets.theme,
          ),
          DropdownItem(
            text: AppLocalizations.of(context)!.theme,
            textItem1: AppLocalizations.of(context)!.light,
            textItem2: AppLocalizations.of(context)!.dark,
            onChanged: (value) {},
          ),
          DividerItem(),
          DrawerItem(
            text: AppLocalizations.of(context)!.language,
            image: AppAssets.language,
          ),
          DropdownItem(
            text: AppLocalizations.of(context)!.language,
            textItem1: AppLocalizations.of(context)!.english,
            textItem2: AppLocalizations.of(context)!.arabic,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
