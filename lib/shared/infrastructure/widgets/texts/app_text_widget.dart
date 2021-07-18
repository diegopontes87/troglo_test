import 'package:flutter/material.dart';

class AppTextWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final String? text;
  final int? maxLines;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  AppTextWidget({
    required this.text,
    this.style,
    this.maxLines,
    this.textAlign,
    this.overflow,
    this.margin,
    this.padding,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width,
      color: Colors.transparent,
      child: Text(
        text == null ? '' : text!,
        style: style == null ? Theme.of(context).textTheme.headline5 : style,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
      ),
    );
  }
}
