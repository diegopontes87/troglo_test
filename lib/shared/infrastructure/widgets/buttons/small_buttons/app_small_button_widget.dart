import 'package:troglo_test/shared/infrastructure/screen_state/screen_state.dart';
import 'package:flutter/material.dart';
import 'package:troglo_test/shared/infrastructure/extensions/app_sizes_extensions.dart';
import 'package:troglo_test/shared/infrastructure/widgets/texts/app_text_widget.dart';
import 'package:troglo_test/shared/res/app_res.dart';

class AppSmallButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback? function;
  final TextStyle? style;
  final Color? textColor;
  final Color loadingIndicatorColor;
  final ButtonStyle buttonStyle;
  final AlignmentGeometry? buttonAligment;
  final ScreenState? screenState;
  final EdgeInsetsGeometry? margin;
  final double? height;
  final double? width;

  AppSmallButtonWidget(
      {required this.function,
      required this.buttonStyle,
      required this.buttonText,
      required this.screenState,
      this.textColor,
      this.height,
      this.width,
      this.style,
      this.buttonAligment,
      this.loadingIndicatorColor = Colors.white,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 40.propHeight(),
      width: width ?? 115.propWidth(),
      margin: margin,
      child: ElevatedButton(
        onPressed: function,
        style: buttonStyle,
        child: screenState == ScreenState.loadingState
            ? Container(
                height: 15.propHeight(),
                width: 15.propWidth(),
                child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(loadingIndicatorColor)))
            : Container(
                height: height ?? 40.propHeight(),
                width: width ?? 115.propWidth(),
                child: Center(
                  child: AppTextWidget(
                    textAlign: TextAlign.center,
                    text: buttonText,
                    style: style ??
                        AppRes.bodyText1.copyWith(
                          color: textColor ?? AppRes.appColorTheme.primary,
                        ),
                  ),
                ),
              ),
      ),
    );
  }
}
