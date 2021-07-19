import 'package:troglo_test/shared/infrastructure/base/base_firebase_exception.dart';
import 'package:troglo_test/shared/infrastructure/screen_state/screen_state.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:troglo_test/shared/infrastructure/widgets/app_snack_bar.dart';
import 'package:troglo_test/shared/utils/general_functions.dart';

import 'base_http_exceptions.dart';

class BaseController extends GetxController {
  ScreenState screenState = ScreenState.initialState;
  void goToPage(String pageRoute) {
    Get.toNamed(pageRoute);
  }

  void goOffPage(String pageRoute) {
    Get.offNamed(pageRoute);
  }

  void goToPageWithParameters(String pageRoute, {required Map<dynamic, dynamic> arguments}) {
    Get.toNamed(pageRoute, arguments: arguments);
  }

  void goOffPageWithParameters(String pageRoute, {required Map<dynamic, dynamic> arguments}) {
    Get.offNamed(pageRoute, arguments: arguments);
  }

  void goBack() {
    Get.back();
  }

  void goCustomBack(int numberOfTimes) {
    Get.close(numberOfTimes);
  }

  void changeScreenState(ScreenState newScreenState) {
    screenState = newScreenState;
    update();
  }

  void exceptionHandler(BaseHttpExceptions exception, {String? backRouteName}) {
    if (exception is NetWorkException) {
      // Get.offAllNamed(
      //   AppRoutes.errorPage,
      //   arguments: {
      //     AppStrings.error: exception.error,
      //     AppStrings.errorMessage: exception.errorMessage,
      //     AppStrings.backRoute: backRouteName,
      //   },
      // );
    } else {
      GeneralFunctions.getErrorSnackBar(
        exception.error,
        exception.errorMessage,
      );
    }
  }

  getErrorSnackBar(String errorTitle, String errorMessage) {
    AppSnackBar.getErrorSnackBar(
      title: errorTitle,
      message: errorMessage,
    );
  }

  void firebaseExceptionHandler(BaseFirebaseException exception, {String? backRouteName}) {
    {
      GeneralFunctions.getErrorSnackBar(
        exception.error,
        exception.errorMessage,
      );
    }
  }
}
