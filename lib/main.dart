// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:troglo_test/shared/res/app_routes.dart';
import 'package:troglo_test/shared/theme/app_theme.dart';

import 'shared/infrastructure/base/base_bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setSystemPreferences();
  await Firebase.initializeApp();
  await startAppFunctions();
  runApp(App());
}

void setSystemPreferences() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

Future startAppFunctions() async {
  var _auth = FirebaseAuth.instance;
  var user = _auth.currentUser;
  if (user != null) {
    AppRoutes.initialRoute = AppRoutes.homePage;
  } else {
    AppRoutes.initialRoute = AppRoutes.loginPage;
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      getPages: AppRoutes.pageList,
      initialRoute: AppRoutes.initialRoute,
      initialBinding: BaseBindings(),
    );
  }
}
