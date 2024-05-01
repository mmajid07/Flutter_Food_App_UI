import 'package:flutter/material.dart';
import 'package:sol_solution_food_app/Utiles/ScreenSize.dart';

class AppTheme {
  // Handle color here
  static const Color black = Color(0xff1F2937);
  static const Color white = Color(0xffffffff);
  static const Color secandryColor = Color(0xff4B5563);
  static const Color primaryColor = Color(0xffEB4646);
  static const Color welcomeInrto = Color(0xffEB4646);
  static const Color lightGrey = Color.fromARGB(255, 158, 158, 158);
  static const Color starColor = Color(0xffEB7B2C);

  // // Handle Font here
  // static const double headlineFontSize = 24.0;
  // static const double bodyFontSize = 14.0;
  // static const double buttonFontSize = 16.0;

  static TextStyle headlineStyle(BuildContext context) {
    final titleStyle = TextStyle(
        fontSize: ScreenSize.screenWidth(context) * 0.06,
        fontWeight: FontWeight.w600,
        color: black);
    return titleStyle;
  }

  static TextStyle lightHeadlineStyle(BuildContext context) {
    final titleStyle = TextStyle(
        fontSize: ScreenSize.screenWidth(context) * 0.055,
        fontWeight: FontWeight.w500,
        color: black);
    return titleStyle;
  }

  static TextStyle CustemlableStyle(BuildContext context) {
    final titleStyle = TextStyle(
        fontSize: ScreenSize.screenWidth(context) * 0.04,
        fontWeight: FontWeight.w600,
        color: secandryColor);
    return titleStyle;
  }

  static TextStyle welcomeStyle(BuildContext context) {
    final titleStyle = TextStyle(
        fontSize: ScreenSize.screenWidth(context) * 0.04,
        fontWeight: FontWeight.w600,
        color: white);
    return titleStyle;
  }

  static TextStyle welcomeIntroStyle(BuildContext context) {
    final titleStyle = TextStyle(
        fontSize: ScreenSize.screenWidth(context) * 0.039,
        fontWeight: FontWeight.w600,
        color: white);
    return titleStyle;
  }

  static TextStyle bodyStyle(BuildContext context) {
    final titleStyle = TextStyle(
        fontSize: ScreenSize.screenWidth(context) * 0.038,
        fontWeight: FontWeight.w500,
        color: secandryColor);
    return titleStyle;
  }

  static TextStyle goodafternoon(BuildContext context) {
    final titleStyle = TextStyle(
        fontSize: ScreenSize.screenWidth(context) * 0.038,
        fontWeight: FontWeight.w600,
        color: black);
    return titleStyle;
  }

  static TextStyle buttonStyle(BuildContext context) {
    final titleStyle = TextStyle(
        fontSize: ScreenSize.screenWidth(context) * 0.05,
        fontWeight: FontWeight.w600,
        color: primaryColor);
    return titleStyle;
  }

  static TextStyle homeDeliver(BuildContext context) {
    final titleStyle = TextStyle(
        fontSize: ScreenSize.screenWidth(context) * 0.03,
        fontWeight: FontWeight.w600,
        color: primaryColor);
    return titleStyle;
  }

  static TextStyle halalStyle(BuildContext context) {
    final titleStyle = TextStyle(
        fontSize: ScreenSize.screenWidth(context) * 0.025,
        fontWeight: FontWeight.w600,
        color: secandryColor);
    return titleStyle;
  }
}
