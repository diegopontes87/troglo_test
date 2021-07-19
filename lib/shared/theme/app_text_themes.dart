import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:troglo_test/shared/res/app_colors.dart';
import 'package:troglo_test/shared/infrastructure/extensions/app_sizes_extensions.dart';

class AppTextTheme {
  static TextTheme get getTextTheme {
    return TextTheme(
      headline1: GoogleFonts.inter(
        fontSize: 40.propHeight(),
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      headline2: GoogleFonts.inter(
        fontSize: 30.propHeight(),
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      headline3: GoogleFonts.inter(
        fontSize: 18.propHeight(),
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      headline4: GoogleFonts.inter(
        fontSize: 16.propHeight(),
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      headline5: GoogleFonts.inter(
        fontSize: 13.propHeight(),
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      bodyText1: GoogleFonts.inter(
        fontSize: 18.propHeight(),
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        height: 1.7,
      ),
      bodyText2: GoogleFonts.inter(
        fontSize: 13.propHeight(),
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        height: 1.7,
      ),
      subtitle1: GoogleFonts.inter(
        fontSize: 11.propHeight(),
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        height: 1,
      ),
    );
  }
}
