import 'package:flutter/material.dart';
import 'package:sol_solution_food_app/Component/Image_Component.dart';
import 'package:sol_solution_food_app/Utiles/App_Theme.dart';
import 'package:sol_solution_food_app/Utiles/ScreenSize.dart';

class OnboardingPage3 extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  OnboardingPage3(
      {required this.imageUrl, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SizedBox(
          height: ScreenSize.screenHeight(context) * 0.2,
        ),
        Center(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.all(20),
                color: AppTheme.primaryColor,
                width: ScreenSize.screenWidth(context) * 0.8,
                height: ScreenSize.screenHeight(context) * 0.3,
              ),
              Positioned(
                bottom: ScreenSize.screenHeight(context) * 0.02,
                right: ScreenSize.screenWidth(context) * 0.03,
                child: ImageComponent(
                  width: ScreenSize.screenWidth(context) * 0.8,
                  height: ScreenSize.screenHeight(context) * 0.3,
                  image: imageUrl,
                  boxFit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: ScreenSize.screenHeight(context) * 0.1),
        Column(
          children: [
            Text(
              title,
              style: AppTheme.headlineStyle(context),
            ),
            SizedBox(height: ScreenSize.screenHeight(context) * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.screenHeight(context) * 0.02),
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
