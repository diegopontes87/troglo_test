import 'package:flutter/material.dart';
import 'package:troglo_test/shared/res/app_colors.dart';

import 'app_text_themes.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: ColorScheme(
        primary: AppColors.primary,
        primaryVariant: AppColors.primaryVariant,
        secondary: AppColors.secondary,
        secondaryVariant: AppColors.secondaryVariant,
        surface: AppColors.surface,
        background: AppColors.white,
        error: AppColors.error,
        onPrimary: AppColors.white,
        onSecondary: AppColors.black,
        onSurface: AppColors.onBackGroundSurface,
        onBackground: AppColors.onBackGroundSurface,
        onError: AppColors.white,
        brightness: Brightness.light,
      ),
      textTheme: AppTextTheme.getTextTheme,
    );
  }
}
