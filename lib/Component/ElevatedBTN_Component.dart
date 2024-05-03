import 'package:flutter/material.dart';
import 'package:sol_solution_food_app/Utiles/App_Theme.dart';
import 'package:sol_solution_food_app/Utiles/ScreenSize.dart';

class ElevatedBTN_Component extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget widget;
  final TextStyle? textStyle;
  final Color? bgColor;
  final Color? fgColor;
  final Color? borderSideColor;

  const ElevatedBTN_Component({
    Key? key,
    required this.onPressed,
    required this.widget,
    this.textStyle,
    this.bgColor,
    this.fgColor,
    this.borderSideColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenSize.screenHeight(context) * 0.06,
      width: ScreenSize.screenWidth(context) * 0.7,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: fgColor,
          side: BorderSide(color: AppTheme.primaryColor), // Change border side color to red
        ),
        child: widget,
      ),
    );
  }
}
