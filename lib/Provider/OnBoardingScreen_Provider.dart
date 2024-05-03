import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sol_solution_food_app/Screens/OnBoardingScreen/ScreenOne.dart';
import 'package:sol_solution_food_app/Screens/OnBoardingScreen/ScreenThree.dart';
import 'package:sol_solution_food_app/Screens/OnBoardingScreen/ScreenTwo.dart';
import 'package:sol_solution_food_app/Utiles/AppImage.dart';
import 'package:sol_solution_food_app/Utiles/AppStrings.dart';
import 'package:sol_solution_food_app/Utiles/App_Theme.dart';

class OnBoardingScreenProvider with ChangeNotifier {
  int currentPage = 0;

  List<Widget> pages = [
    OnboardingPage1(
      imageUrl1: AppImage.Unb1_image1,
      imageUrl2: AppImage.Unb1_image2,
      title: AppStrings.Unb1_title,
      description: AppStrings.Unb1_Description,
    ),
    OnboardingPage2(
      imageUrl: AppImage.Unb2_image,
      title: AppStrings.Unb2_title,
      description: AppStrings.Unb2_Description,
    ),
    OnboardingPage3(
      imageUrl: AppImage.Unb3_image,
      title: AppStrings.Unb3_title,
      description: AppStrings.Unb3_Description,
    ),
  ];

  void pageChange(int page) {
    currentPage = page;
    notifyListeners();
  }

  List<Widget> buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < pages.length; i++) {
      indicators.add(currentPage == i ? indicator(true) : indicator(false));
    }

    return indicators;
  }

  Widget indicator(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        color: isActive ? AppTheme.primaryColor : AppTheme.black,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
