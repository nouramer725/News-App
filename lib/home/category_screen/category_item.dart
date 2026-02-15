import 'package:flutter/material.dart';
import 'package:news_app/home/category_screen/category.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/provider/app_theme_provider.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/responsive.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final int index;
  const CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    return Stack(
      alignment: (index % 2 == 0)
          ? Alignment.bottomRight
          : Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            alignment: (index % 2 == 0)
                ? Alignment.centerLeft
                : Alignment.centerRight,
            children: [
              Container(
                height: h(200),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: themeProvider.isDarkTheme()
                      ? AppColors.whiteColor
                      : AppColors.blackColor,
                ),
              ),
              Image.asset(category.image, height: h(200), fit: BoxFit.cover),

              Positioned(
                top: h(50),
                left: (index % 2 == 0) ? null : w(30),
                right: (index % 2 == 0) ? w(30) : null,
                child: Text(
                  category.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: w(8), vertical: h(8)),
          margin: EdgeInsets.symmetric(horizontal: w(10), vertical: h(10)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: themeProvider.isDarkTheme()
                ? AppColors.greyButtonColorBackgroundDark
                : AppColors.greyButtonColorBackgroundLight,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: w(8),
            textDirection: (index % 2 == 0)
                ? TextDirection.ltr
                : TextDirection.rtl,
            children: [
              Text(
                AppLocalizations.of(context)!.view_all,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              CircleAvatar(
                radius: h(20),
                backgroundColor: themeProvider.isDarkTheme()
                    ? AppColors.whiteColor
                    : AppColors.blackColor,
                child: Icon(
                  (index % 2 == 0)
                      ? Icons.arrow_forward_ios
                      : Icons.arrow_back_ios,
                  size: h(16),
                  color: themeProvider.isDarkTheme()
                      ? AppColors.blackColor
                      : AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
