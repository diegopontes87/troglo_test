import 'package:troglo_test/shared/infrastructure/widgets/app_snack_bar.dart';

class GeneralFunctions {
  static void getErrorSnackBar(String? errorTitle, String? errorMessage) {
    AppSnackBar.getErrorSnackBar(
      title: errorTitle,
      message: errorMessage,
    );
  }
}
