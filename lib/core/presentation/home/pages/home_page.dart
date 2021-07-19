import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:troglo_test/core/presentation/home/controller/home_controller.dart';
import 'package:troglo_test/shared/infrastructure/widgets/cards/app_test_kit_card_widget.dart';
import 'package:troglo_test/shared/infrastructure/widgets/cards/app_test_recent_orders_card_widget.dart';
import 'package:troglo_test/shared/infrastructure/widgets/cards/app_test_result_card_widget.dart';
import 'package:troglo_test/shared/infrastructure/widgets/components/app_home_image_title_widget.dart';
import 'package:troglo_test/shared/res/app_assets.dart';
import 'package:troglo_test/shared/res/app_res.dart';
import 'package:troglo_test/shared/infrastructure/extensions/app_sizes_extensions.dart';

class HomePage extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppRes.appColorTheme.primary,
        centerTitle: true,
        title: Container(
          height: 45,
          width: 45,
          child: Image.asset(
            AppAssets.shortLogoLight,
          ),
        ),
      ),
      drawer: Drawer(),
      body: Container(
        child: Container(
          height: Get.height,
          child: Stack(
            children: [
              AppHomeImageTitleWidget(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: AppRes.appColorTheme.background,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Container(
                    height: 430.propHeight(),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        AppTestKitCardWidget(
                          cardTitle: 'Order an STI test kit',
                          buttonText: 'Order',
                          margin: EdgeInsets.only(
                            top: 30.propHeight(),
                            left: 30.propWidth(),
                            right: 30.propWidth(),
                          ),
                        ),
                        AppTestResultCardWidget(
                          cardTitle: 'Tests results',
                          buttonText: 'View all',
                          margin: EdgeInsets.only(
                            top: 30.propHeight(),
                            left: 30.propWidth(),
                            right: 30.propWidth(),
                          ),
                        ),
                        AppTestRecentOrdersCardWidget(
                          cardTitle: 'Past recent orders',
                          cardSubtitle: 'Last three',
                          margin: EdgeInsets.only(
                            top: 30.propHeight(),
                            left: 30.propWidth(),
                            right: 30.propWidth(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
