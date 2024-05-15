import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon? prefixIcon;
  final Widget? suffix;
  final bool? obscureText;
  final Color? fillColor;
  final double? radius;
  final int? maxLine;
  final String? Function(String?)? validate;

  CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.obscureText,
    this.fillColor,
    this.suffix,
    this.radius,
    this.maxLine,
    this.validate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double effectiveRadius = radius ?? 12.0;

    return Center(
      child: TextFormField(
        validator: validate,
        controller: controller,
        obscureText: maxLine == 1 && obscureText!,
        maxLines: maxLine,
        decoration: InputDecoration(
          suffixIcon: suffix,
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(effectiveRadius),
            borderSide: BorderSide.none, // Remove the border
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(effectiveRadius),
            borderSide: BorderSide(width: 2, color: Color(0xffBEC5D1)), // Set the border color and width
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(effectiveRadius),
          ),
        ),
      ),
    );
  }
}
