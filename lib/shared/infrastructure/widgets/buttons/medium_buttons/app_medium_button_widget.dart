import 'package:troglo_test/shared/infrastructure/screen_state/screen_state.dart';
import 'package:flutter/material.dart';
import 'package:troglo_test/shared/infrastructure/extensions/app_sizes_extensions.dart';
import 'package:troglo_test/shared/infrastructure/widgets/texts/app_text_widget.dart';

class AppMediumButtonWidget extends StatelessWidget {
  final String buttonText;
  final VoidCallback? function;
  final Color? textColor;
  final Color? loadingIndicatorColor;
  final ButtonStyle buttonStyle;
  final AlignmentGeometry? buttonAligment;
  final ScreenState? screenState;
  final EdgeInsetsGeometry? margin;

  AppMediumButtonWidget({
    required this.function,
    required this.buttonStyle,
    required this.buttonText,
    required this.screenState,
    this.margin,
    this.buttonAligment,
    this.textColor,
    this.loadingIndicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: buttonAligment ?? Alignment.center,
      child: Container(
        margin: margin,
        width: 138.propWidth(),
        height: 44.propHeight(),
        child: ElevatedButton(
          onPressed: function,
          style: buttonStyle,
          child: screenState == ScreenState.loadingState
              ? Container(
                  height: 24.propHeight(),
                  width: 24.propWidth(),
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      loadingIndicatorColor ?? Colors.white,
                    ),
                  ),
                )
              : AppTextWidget(
                  text: buttonText,
                  textAlign: TextAlign.center,
                  style: textColor == null
                      ? Theme.of(context).textTheme.headline4
                      : Theme.of(context).textTheme.headline4?.apply(
                            color: textColor,
                          ),
                ),
        ),
      ),
    );
  }
}
