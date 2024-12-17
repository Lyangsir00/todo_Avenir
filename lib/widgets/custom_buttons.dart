import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.buttonText,
      this.onTap,
      this.borderRadius,
      this.backgroundColor,
      this.textColor});
  VoidCallback? onTap;
  String? buttonText;
  Color? textColor;
  Color? backgroundColor;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.blue,
          borderRadius: borderRadius ?? BorderRadius.circular(8)),
      child: InkWell(
          onTap: onTap,
          child: Text(
            buttonText ?? "null",
            style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500),
          )),
    );
  }
}
