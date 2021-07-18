import 'package:troglo_test/shared/infrastructure/screen_state/screen_state.dart';
import 'package:troglo_test/shared/infrastructure/extensions/app_sizes_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:troglo_test/shared/res/app_res.dart';

class AppTextFormField extends StatelessWidget {
  final FocusNode? focus;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final bool isPassword;
  final TextInputAction? textInputAction;
  final TextStyle? hintStyle;
  final TextEditingController? textFieldController;
  final ScreenState? screenState;
  final TextStyle? style;
  final ValueChanged<String>? onChangedFunction;
  final EdgeInsetsGeometry? margin;
  final TextAlign? textAlign;
  final Widget? prefixIcon;

  AppTextFormField(
      {this.margin,
      this.onChangedFunction,
      this.focus,
      this.inputFormatters,
      this.hintText,
      this.validator,
      this.keyboardType,
      this.textInputAction,
      this.isPassword = false,
      this.hintStyle,
      this.textFieldController,
      this.screenState,
      this.style,
      this.textAlign,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.propHeight(),
      margin: margin,
      child: TextFormField(
        textAlign: textAlign ?? TextAlign.start,
        cursorColor: AppRes.appColorTheme.primary,
        focusNode: focus,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        obscureText: isPassword,
        controller: textFieldController,
        inputFormatters: inputFormatters,
        validator: validator,
        enabled: screenState != ScreenState.loadingState,
        style: style,
        onChanged: (value) {
          if (onChangedFunction != null) {
            onChangedFunction!(value);
          }
        },
        decoration: InputDecoration(
          errorStyle: TextStyle(height: 0),
          isDense: true,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppRes.appColorTheme.primary, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: hintText,
          hintStyle: hintStyle,
        ),
      ),
    );
  }
}
