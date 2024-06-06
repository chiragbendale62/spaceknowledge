import 'package:flutter/material.dart';
import 'package:spaceknowledge/utilities/app_colors.dart';
import 'package:spaceknowledge/utilities/app_string.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    primaryColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.black,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.grey,
    ),
    fontFamily: AppString.spaceFontFamily,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.black,
    ),
    highlightColor: AppColors.greySplash,
    focusColor: AppColors.greySplash,
    splashColor: AppColors.greySplash,
  );
}
