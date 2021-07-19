import 'package:flutter/material.dart';
import 'package:troglo_test/shared/infrastructure/widgets/texts/app_text_widget.dart';
import 'package:troglo_test/shared/res/app_res.dart';

class AppListTileTestRecentWidget extends StatelessWidget {
  final String? testName;
  final String? testDate;

  AppListTileTestRecentWidget({
    this.testName,
    this.testDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.access_time,
              color: AppRes.appColorTheme.primary,
              size: 25,
            ),
            title: AppTextWidget(
              text: testName,
              style: AppRes.headline4.copyWith(
                color: AppRes.appColorTheme.onSurface,
              ),
            ),
            subtitle: AppTextWidget(
              text: testDate,
              style: AppRes.subtitlePrimary1.copyWith(
                color: AppRes.appColorTheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
