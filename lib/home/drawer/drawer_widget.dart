import 'package:flutter/material.dart';
import 'package:news_app/home/drawer/widgets/divider_item.dart';
import 'package:news_app/home/drawer/widgets/drawer_item.dart';
import 'package:news_app/home/drawer/widgets/dropdown_item.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/provider/app_theme_provider.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/responsive.dart';
import 'package:provider/provider.dart';
import '../../provider/app_language_provider.dart';
import '../../utils/app_text.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.blackColor,
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
            icon1: Icons.light_mode,
            icon2: Icons.dark_mode,
            text: AppLocalizations.of(context)!.theme,
            textItem1: AppLocalizations.of(context)!.light,
            textItem2: AppLocalizations.of(context)!.dark,
            onChanged: (value) {},
            onTapItem1: () {
              themeProvider.changeTheme(ThemeMode.light);
            },
            onTapItem2: () {
              themeProvider.changeTheme(ThemeMode.dark);
            },
          ),
          DividerItem(),
          DrawerItem(
            text: AppLocalizations.of(context)!.language,
            image: AppAssets.language,
          ),
          DropdownItem(
            icon1: Icons.language_sharp,
            icon2: Icons.language_sharp,
            text: AppLocalizations.of(context)!.language,
            textItem1: AppLocalizations.of(context)!.english,
            textItem2: AppLocalizations.of(context)!.arabic,
            onChanged: (value) {},
            onTapItem1: () {
              languageProvider.changeLanguage('en');
            },
            onTapItem2: () {
              languageProvider.changeLanguage('ar');
            },
          ),
        ],
      ),
    );
  }
}
