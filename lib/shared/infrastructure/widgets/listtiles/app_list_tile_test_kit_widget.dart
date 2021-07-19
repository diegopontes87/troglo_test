import 'package:flutter/material.dart';
import 'package:troglo_test/shared/infrastructure/widgets/texts/app_text_widget.dart';
import 'package:troglo_test/shared/res/app_res.dart';

class AppListTileTestKitWidget extends StatelessWidget {
  final String? testKitType;
  final String? hoursToOrderAnotherKit;

  AppListTileTestKitWidget({
    this.testKitType,
    this.hoursToOrderAnotherKit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: AppRes.appColorTheme.primary,
              size: 25,
            ),
            title: AppTextWidget(
              text: testKitType,
              style: AppRes.headline4.copyWith(
                color: AppRes.appColorTheme.primary,
              ),
            ),
            subtitle: AppTextWidget(
              text: 'A new order can be made in ${hoursToOrderAnotherKit} hours',
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
