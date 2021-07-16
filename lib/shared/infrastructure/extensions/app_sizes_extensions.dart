import 'package:get/get.dart';

///This extension should be used in any case where you need to set the
///component height and width!
///
///This extension will set the proportional height and width according the
///propotype screen sizes.
///

extension AppProportionalSizesExtension on int {
  static const prototypeHeight = 812;
  static const protypeWidth = 375;
  double propHeight() {
    return Get.height * (this / prototypeHeight);
  }

  double propWidth() {
    return Get.width * (this / protypeWidth);
  }
}
