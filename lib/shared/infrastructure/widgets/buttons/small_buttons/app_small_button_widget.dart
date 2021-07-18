import 'package:troglo_test/shared/infrastructure/screen_state/screen_state.dart';
import 'package:flutter/material.dart';
import 'package:troglo_test/shared/infrastructure/extensions/app_sizes_extensions.dart';
import 'package:troglo_test/shared/infrastructure/widgets/texts/app_text_widget.dart';

class AppSmallButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback? function;
  final Color? textColor;
  final Color loadingIndicatorColor;
  final ButtonStyle buttonStyle;
  final AlignmentGeometry? buttonAligment;
  final ScreenState? screenState;
  final EdgeInsetsGeometry? margin;

  AppSmallButtonWidget(
      {required this.function,
      required this.buttonStyle,
      required this.buttonText,
      required this.screenState,
      this.textColor,
      this.buttonAligment,
      this.loadingIndicatorColor = Colors.white,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 115.propWidth(),
        height: 40.propHeight(),
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
                  child: Center(
                    child: AppTextWidget(
                      text: buttonText,
                      style: textColor == null
                          ? Theme.of(context).textTheme.bodyText1
                          : Theme.of(context).textTheme.bodyText1?.apply(
                                color: textColor,
                              ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
