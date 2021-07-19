import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:troglo_test/shared/infrastructure/widgets/listtiles/app_list_tile_test_recent_widget.dart';
import 'package:troglo_test/shared/infrastructure/widgets/texts/app_text_widget.dart';
import 'package:troglo_test/shared/res/app_res.dart';
import 'package:troglo_test/shared/infrastructure/extensions/app_sizes_extensions.dart';

class AppTestRecentOrdersCardWidget extends StatelessWidget {
  final String? cardTitle;
  final String? cardSubtitle;
  final EdgeInsetsGeometry? margin;

  AppTestRecentOrdersCardWidget({
    this.cardTitle,
    this.cardSubtitle,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: margin,
      padding: EdgeInsets.symmetric(vertical: 10.propHeight()),
      decoration: BoxDecoration(
        color: AppRes.appColorTheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
              ],
            ),
          ),
          AppTextWidget(
            margin: EdgeInsets.only(left: 15.propWidth()),
            text: cardSubtitle,
            width: Get.width,
            textAlign: TextAlign.left,
            style: AppRes.bodyText2.copyWith(
              color: AppRes.appColorTheme.onSurface,
            ),
          ),
          AppListTileTestRecentWidget(
            testName: 'HPV test',
            testDate: '25/04/2021',
          ),
        ],
      ),
    );
  }
}
