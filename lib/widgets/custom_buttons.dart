import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.buttonText, this.onTap, this.borderRadius});
  VoidCallback? onTap;
  String? buttonText;
  Color? textColor;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
          color: textColor ?? Colors.blue,
          borderRadius: borderRadius ?? BorderRadius.circular(5)),
      child: InkWell(onTap: onTap, child: Text(buttonText ?? "null")),
    );
  }
}
