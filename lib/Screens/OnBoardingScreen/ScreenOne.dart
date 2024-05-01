import 'package:flutter/material.dart';
import 'package:sol_solution_food_app/Component/Image_Component.dart';
import 'package:sol_solution_food_app/Utiles/AppImage.dart';
import 'package:sol_solution_food_app/Utiles/AppStrings.dart';
import 'package:sol_solution_food_app/Utiles/App_Theme.dart';
import 'package:sol_solution_food_app/Utiles/ScreenSize.dart';

class OnboardingPage1 extends StatelessWidget {
  final String imageUrl1;
  final String imageUrl2;
  final String title;
  final String description;

  OnboardingPage1(
      {required this.imageUrl1,
      required this.imageUrl2,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        SizedBox(
          height: ScreenSize.screenHeight(context) * 0.1,
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(60.0),
              child: ImageComponent(
                image: imageUrl1,
                boxFit: BoxFit.cover,
                width: ScreenSize.screenWidth(context) * 0.7,
              ),
            ),
            Positioned(
                top: 230,
                left: 0,
                child: ImageComponent(
                  image: imageUrl2,
                  boxFit: BoxFit.cover,
                  height: ScreenSize.screenHeight(context) * 0.2,
                ))
          ],
        ),
        SizedBox(
          height: ScreenSize.screenHeight(context) * 0.051,
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
                horizontal: ScreenSize.screenHeight(context) * 0.02,
              ),
              child: Text(description,
                  textAlign: TextAlign.center,
                  style: AppTheme.bodyStyle(context)),
            ),
          ],
        ),
        SizedBox(
          height: ScreenSize.screenHeight(context) * 0.1,
        )
      ],
    );
  }
}
