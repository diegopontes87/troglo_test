import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:troglo_test/shared/infrastructure/screen_state/screen_state.dart';
import 'package:troglo_test/shared/infrastructure/widgets/buttons/small_buttons/app_small_button_widget.dart';
import 'package:troglo_test/shared/infrastructure/widgets/listtiles/app_list_tile_test_kit_widget.dart';
import 'package:troglo_test/shared/infrastructure/widgets/texts/app_text_widget.dart';
import 'package:troglo_test/shared/res/app_res.dart';
import 'package:troglo_test/shared/theme/app_button_styles.dart';
import 'package:troglo_test/shared/infrastructure/extensions/app_sizes_extensions.dart';

class AppTestKitCardWidget extends StatelessWidget {
  final Function? orderFunction;
  final String? buttonText;
  final String? cardTitle;
  final EdgeInsetsGeometry? margin;

  AppTestKitCardWidget({
    this.orderFunction,
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
        color: AppRes.appColorTheme.secondary,
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
                  function: () => orderFunction,
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
          AppListTileTestKitWidget(
            testKitType: 'HPV test kit',
            hoursToOrderAnotherKit: '2',
          ),
        ],
      ),
    );
  }
}
