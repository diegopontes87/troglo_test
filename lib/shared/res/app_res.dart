import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRes {
  //BLACK TEXTS THEMES
  static var _appTextTheme = Theme.of(Get.context!).textTheme;
  static TextStyle headline1 = _appTextTheme.headline1!;
  static TextStyle headline2 = _appTextTheme.headline2!;
  static TextStyle headline3 = _appTextTheme.headline3!;
  static TextStyle headline4 = _appTextTheme.headline4!;
  static TextStyle headline5 = _appTextTheme.headline5!;
  static TextStyle bodyText1 = _appTextTheme.bodyText1!;
  static TextStyle bodyText2 = _appTextTheme.bodyText2!;

  //WHITE TEXTS THEMES
  static TextStyle headlineOnPrimary1 = _appTextTheme.headline1!.copyWith(color: appColorTheme.onPrimary);
  static TextStyle headlineOnPrimary2 = _appTextTheme.headline2!.copyWith(color: appColorTheme.onPrimary);
  static TextStyle headlineOnPrimary3 = _appTextTheme.headline3!.copyWith(color: appColorTheme.onPrimary);
  static TextStyle headlineOnPrimary4 = _appTextTheme.headline4!.copyWith(color: appColorTheme.onPrimary);
  static TextStyle headlineOnPrimary5 = _appTextTheme.headline5!.copyWith(color: appColorTheme.onPrimary);
  static TextStyle bodyTextOnPrimary1 = _appTextTheme.bodyText1!.copyWith(color: appColorTheme.onPrimary);
  static TextStyle bodyTextOnPrimary2 = _appTextTheme.bodyText2!.copyWith(color: appColorTheme.onPrimary);

//BLACK TEXTS THEMES WITH OPACITY
  static TextStyle headlineOpacityOnbackground1 = _appTextTheme.headline1!.copyWith(color: appColorTheme.onBackground.withOpacity(0.54));
  static TextStyle headlineOpacityOnbackground2 = _appTextTheme.headline2!.copyWith(color: appColorTheme.onBackground.withOpacity(0.54));
  static TextStyle headlineOpacityOnbackground3 = _appTextTheme.headline3!.copyWith(color: appColorTheme.onBackground.withOpacity(0.54));
  static TextStyle headlineOpacityOnbackground4 = _appTextTheme.headline4!.copyWith(color: appColorTheme.onBackground.withOpacity(0.54));
  static TextStyle headlineOpacityOnbackground5 = _appTextTheme.headline5!.copyWith(color: appColorTheme.onBackground.withOpacity(0.54));
  static TextStyle bodyTextOpacityOnbackground1 = _appTextTheme.bodyText1!.copyWith(color: appColorTheme.onBackground.withOpacity(0.54));
  static TextStyle bodyTextOpacityOnbackground2 = _appTextTheme.bodyText2!.copyWith(color: appColorTheme.onBackground.withOpacity(0.54));

  //GREEN TEXTS THEMES
  static TextStyle headlinePrimary1 = _appTextTheme.headline1!.copyWith(color: appColorTheme.primary);
  static TextStyle headlinePrimary2 = _appTextTheme.headline2!.copyWith(color: appColorTheme.primary);
  static TextStyle headlinePrimary3 = _appTextTheme.headline3!.copyWith(color: appColorTheme.primary);
  static TextStyle headlinePrimary4 = _appTextTheme.headline4!.copyWith(color: appColorTheme.primary);
  static TextStyle headlinePrimary5 = _appTextTheme.headline5!.copyWith(color: appColorTheme.primary);
  static TextStyle bodyTextPrimary1 = _appTextTheme.bodyText1!.copyWith(color: appColorTheme.primary);
  static TextStyle bodyTextPrimary2 = _appTextTheme.bodyText2!.copyWith(color: appColorTheme.primary);

  //APP COLOR THEME
  static var appColorTheme = Theme.of(Get.context!).colorScheme;
}
