import 'package:flutter/material.dart';
import 'package:sol_solution_food_app/Component/Image_Component.dart';
import 'package:sol_solution_food_app/Utiles/AppStrings.dart';
import 'package:sol_solution_food_app/Utiles/App_Theme.dart';
import 'package:sol_solution_food_app/Utiles/ScreenSize.dart';

class OnboardingPage2 extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  OnboardingPage2(
      {required this.imageUrl, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SizedBox(
          height: ScreenSize.screenHeight(context) * 0.2,
        ),
        Stack(
          children: [
            Container(
              color: AppTheme.primaryColor,
              child: ImageComponent(
                image: imageUrl,
                boxFit: BoxFit.cover,
                width: ScreenSize.screenWidth(context) * 0.8,
              ),
            )
          ],
        ),
        SizedBox(
          height: ScreenSize.screenHeight(context) * 0.1,
        ),
        Column(
          children: [
            Text(
              title,
              style: AppTheme.headlineStyle(context),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.screenWidth(context) * 0.02),
              child: Text(description,
                  textAlign: TextAlign.center,
                  style: AppTheme.bodyStyle(context)),
            ),
          ],
        ),
        SizedBox(
          height: ScreenSize.screenHeight(context) * 0.2,
        )
      ],
    );
  }
}
