import 'package:get/get.dart';
import 'package:troglo_test/core/presentation/onboarding/bindings/onboarding_bindings.dart';
import 'package:troglo_test/core/presentation/onboarding/pages/login_page.dart';
import 'package:troglo_test/core/presentation/onboarding/pages/sign_up_credentials_page.dart';
import 'package:troglo_test/core/presentation/onboarding/pages/sign_up_info_page.dart';

class AppRoutes {
  static String initialRoute = '/';
  static const loginPage = '/login';
  static const signUpInfoPage = '/signupinfo';
  static const signUpCredentialsPage = '/signupcredentials';

  static List<GetPage> pageList = [
    GetPage(
      name: loginPage,
      page: () => LoginPage(),
      binding: OnboardingBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: signUpInfoPage,
      page: () => SignUpInfoPage(),
      binding: OnboardingBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: signUpCredentialsPage,
      page: () => SignUpCredentialsPage(),
      binding: OnboardingBindings(),
      transition: Transition.fadeIn,
    ),
  ];
}
