import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:troglo_test/shared/infrastructure/widgets/texts/app_text_widget.dart';
import 'package:troglo_test/shared/res/app_assets.dart';
import 'package:troglo_test/shared/res/app_res.dart';
import 'package:troglo_test/shared/infrastructure/extensions/app_sizes_extensions.dart';

class AppHomeImageTitleWidget extends StatelessWidget {
  const AppHomeImageTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330.propHeight(),
      child: Stack(
        children: [
          Container(
            height: 330.propHeight(),
            width: Get.width,
            child: Image.asset(
              AppAssets.home,
              fit: BoxFit.cover,
              alignment: Alignment(0, 0.4),
            ),
          ),
          Container(
            width: Get.width,
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 50.propWidth()),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextWidget(
                  text: 'Sexual Health,\nYour Way',
                  style: AppRes.headline2.copyWith(
                    color: AppRes.appColorTheme.onPrimary,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 25.propHeight(),
                ),
                AppTextWidget(
                  text: 'A mobile-first app\ndesign for the\nLGBTQIA+ Community.\nGet ready for the sexual\nhealth care experience\nwith YOU at the center.',
                  style: AppRes.headline5.copyWith(
                    color: AppRes.appColorTheme.onPrimary,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
