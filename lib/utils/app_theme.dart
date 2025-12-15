import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    hintColor: AppColors.whiteColor,
    indicatorColor: AppColors.blackColor,
    primaryColor: AppColors.whiteColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      iconTheme: IconThemeData(color: AppColors.blackColor),
      centerTitle: true,
    ),

    textTheme: TextTheme(
      labelLarge: AppStyles.bold16Black,
      labelMedium: AppStyles.medium14Black,
      headlineMedium: AppStyles.medium24Black,
      headlineLarge: AppStyles.medium20Black,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    hintColor: AppColors.blackColor,
    indicatorColor: AppColors.whiteColor,
    primaryColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.blackColor,
      iconTheme: IconThemeData(color: AppColors.whiteColor),
      centerTitle: true,
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.bold16White,
      labelMedium: AppStyles.medium14White,
      headlineMedium: AppStyles.medium24White,
      headlineLarge: AppStyles.medium20White,
    ),
  );
}
