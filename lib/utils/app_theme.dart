import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_text.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor,
    splashColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      iconTheme: IconThemeData(color: AppColors.blackColor),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      labelLarge: AppText.boldText(color: AppColors.blackColor, fontSize: 16),
      labelMedium: AppText.mediumText(
        color: AppColors.greyButtonColorBackgroundDark,
        fontSize: 12,
      ),
      labelSmall: AppText.mediumText(color: AppColors.blackColor, fontSize: 14),
      bodyLarge: AppText.mediumText(color: AppColors.blackColor, fontSize: 24),
      bodyMedium: AppText.mediumText(color: AppColors.blackColor, fontSize: 20),
      titleMedium: AppText.mediumText(color: AppColors.whiteColor, fontSize: 16),

    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.blackColor,
    splashColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      labelLarge: AppText.boldText(color: AppColors.whiteColor, fontSize: 16),
      labelMedium: AppText.mediumText(
        color: AppColors.greyButtonColorBackgroundLight,
        fontSize: 12,
      ),
      labelSmall: AppText.mediumText(color: AppColors.whiteColor, fontSize: 14),
      bodyLarge: AppText.mediumText(color: AppColors.whiteColor, fontSize: 24),
      bodyMedium: AppText.mediumText(color: AppColors.whiteColor, fontSize: 20),
      titleMedium: AppText.mediumText(color: AppColors.blackColor, fontSize: 16),
    ),
  );
}
