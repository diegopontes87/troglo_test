import 'package:flutter/material.dart';
import 'package:troglo_test/shared/infrastructure/widgets/texts/app_text_widget.dart';
import 'package:troglo_test/shared/res/app_res.dart';

class AppListTileTestResultWidget extends StatelessWidget {
  final String? testKitType;
  final String? sickHours;
  final String? testResult;

  AppListTileTestResultWidget({
    this.testKitType,
    this.sickHours,
    this.testResult,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.mail,
              color: AppRes.appColorTheme.primary,
              size: 25,
            ),
            title: AppTextWidget(
              text: testKitType,
              style: AppRes.headline4.copyWith(
                color: AppRes.appColorTheme.onSurface,
              ),
            ),
            subtitle: AppTextWidget(
              text: 'Result: $testResult',
              style: AppRes.subtitlePrimary1.copyWith(
                color: AppRes.appColorTheme.onSurface,
              ),
            ),
            trailing: AppTextWidget(
              text: 'Sick for\n$sickHours hours',
              style: AppRes.subtitlePrimary1.copyWith(
                color: AppRes.appColorTheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
