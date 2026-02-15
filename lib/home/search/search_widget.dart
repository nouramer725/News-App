import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/provider/app_theme_provider.dart';
import 'package:provider/provider.dart';
import '../../../utils/app_colors.dart';

class SearchWidget extends StatelessWidget {
  void Function(String)? onChanged;
  void Function()? closeIconOnPressed;
  TextEditingController searchController;

  SearchWidget({
    required this.onChanged,
    super.key,
    required this.closeIconOnPressed,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return TextField(
      cursorColor: themeProvider.isDarkTheme()
          ? AppColors.whiteColor
          : AppColors.blackColor,
      style: Theme.of(context).textTheme.labelSmall,
      controller: searchController,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.search,
        hintStyle: Theme.of(context).textTheme.labelSmall,
        prefixIcon: Icon(
          Icons.search,
          color: themeProvider.isDarkTheme()
              ? AppColors.whiteColor
              : AppColors.blackColor,
        ),
        suffixIcon: IconButton(
          onPressed: closeIconOnPressed,
          icon: Icon(
            Icons.close,
            color: themeProvider.isDarkTheme()
                ? AppColors.whiteColor
                : AppColors.blackColor,
          ),
        ),
        enabledBorder: buildOutlineInputBorder(themeProvider.isDarkTheme()),
        focusedBorder: buildOutlineInputBorder(themeProvider.isDarkTheme()),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder(bool isDark) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(
        color: isDark ? AppColors.whiteColor : AppColors.blackColor,
        width: 2.0,
        style: BorderStyle.solid,
      ),
    );
  }
}
