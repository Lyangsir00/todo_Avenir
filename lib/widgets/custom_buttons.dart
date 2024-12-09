import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.buttonText, this.onTap});
  VoidCallback? onTap;
  String? buttonText;
  Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(color: textColor ?? Colors.blue),
      child: InkWell(onTap: onTap, child: Text(buttonText ?? "null")),
    );
  }
}
