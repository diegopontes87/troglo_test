import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:troglo_test/shared/infrastructure/screen_state/screen_state.dart';
import 'package:troglo_test/shared/infrastructure/widgets/buttons/small_buttons/app_small_button_widget.dart';
import 'package:troglo_test/shared/infrastructure/widgets/listtiles/app_list_tile_test_result_widget.dart';
import 'package:troglo_test/shared/infrastructure/widgets/texts/app_text_widget.dart';
import 'package:troglo_test/shared/res/app_res.dart';
import 'package:troglo_test/shared/theme/app_button_styles.dart';
import 'package:troglo_test/shared/infrastructure/extensions/app_sizes_extensions.dart';

class AppTestResultCardWidget extends StatelessWidget {
  final Function? resultFunction;
  final String? buttonText;
  final String? cardTitle;
  final EdgeInsetsGeometry? margin;

  AppTestResultCardWidget({
    this.resultFunction,
    this.cardTitle,
    this.buttonText,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: margin,
      decoration: BoxDecoration(
        color: AppRes.appColorTheme.secondaryVariant,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.propWidth()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTextWidget(
                  text: cardTitle,
                  style: AppRes.headline3.copyWith(
                    color: AppRes.appColorTheme.onSurface,
                  ),
                ),
                AppSmallButtonWidget(
                  height: 35.propHeight(),
                  width: 100.propWidth(),
                  margin: EdgeInsets.only(
                    top: 15.propHeight(),
                    bottom: 10.propHeight(),
                  ),
                  function: () => resultFunction,
                  buttonStyle: AppButtonStyles.primaryButtonStyle(context),
                  buttonText: buttonText ?? 'Click',
                  screenState: ScreenState.normalState,
                  style: AppRes.bodyText1.copyWith(
                    color: AppRes.appColorTheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
          AppListTileTestResultWidget(
            testKitType: 'HPV test',
            sickHours: '2',
            testResult: 'Negative',
          ),
        ],
      ),
    );
  }
}
