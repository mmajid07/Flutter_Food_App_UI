import 'package:flutter/material.dart';
import 'package:sol_solution_food_app/Utiles/ScreenSize.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon? prefixIcon;
  final Widget? suffix;
  final bool obscureText;
  final Color? fillColor;
  final double? radius;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.fillColor,
    this.suffix,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double effectiveRadius = radius ?? 8.0; // Use radius or default value

    return Center(
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          suffixIcon: suffix,
          filled: true,
          fillColor: fillColor,
          hintText: hintText,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(effectiveRadius),
          ),
        ),
      ),
    );
  }
}
