import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:troglo_test/shared/infrastructure/widgets/texts/app_text_widget.dart';
import 'package:troglo_test/shared/res/app_colors.dart';
import 'package:troglo_test/shared/theme/app_text_themes.dart';

class AppSnackBar {
  static void getErrorSnackBar({String? title, String? message}) {
    Get.snackbar('', '',
        titleText: AppTextWidget(
          text: title == null ? '' : title,
          style: AppTextTheme.getTextTheme.headline4?.copyWith(color: AppColors.error),
        ),
        messageText: AppTextWidget(
          text: message == null ? '' : message,
          style: AppTextTheme.getTextTheme.bodyText1?.copyWith(color: AppColors.error),
        ),
        colorText: Theme.of(Get.context!).colorScheme.error,
        borderWidth: 1,
        borderRadius: 20,
        borderColor: Theme.of(Get.context!).colorScheme.error,
        backgroundColor: AppColors.secondaryVariant);
  }
}
