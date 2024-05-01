import 'package:flutter/material.dart';
import 'package:sol_solution_food_app/Component/ElevatedBTN_Component.dart';
import 'package:sol_solution_food_app/Screens/Login_SignUp_Screen.dart';
import 'package:sol_solution_food_app/Utiles/AppImage.dart';
import 'package:sol_solution_food_app/Utiles/AppStrings.dart';
import 'package:sol_solution_food_app/Utiles/App_Theme.dart';
import 'package:sol_solution_food_app/Utiles/ScreenSize.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImage.bg_image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Opacity(
            opacity: 0.6,
            child: Container(
              color: AppTheme.black,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(),
              Container(
                height: ScreenSize.screenHeight(context) * 0.6,
                width: ScreenSize.screenWidth(context) * 0.9,
                decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(0.5),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.welcome,
                          textAlign: TextAlign.left,
                          style: AppTheme.welcomeStyle(context),
                        ),
                        SizedBox(
                          height: ScreenSize.screenHeight(context) * 0.02,
                        ),
                        Text(
                          AppStrings.welcome_intro,
                          textAlign: TextAlign.center,
                          style: AppTheme.welcomeIntroStyle(context),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedBTN_Component(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginSignUpScreen()));
                          },
                          widget: Text(AppStrings.login),
                          bgColor: AppTheme.primaryColor,
                          fgColor: AppTheme.white,
                        ),
                        SizedBox(
                          height: ScreenSize.screenHeight(context) * 0.02,
                        ),
                        ElevatedBTN_Component(
                          onPressed: () {},
                          widget: Text(AppStrings.create_Account),
                          bgColor: AppTheme.white,
                          fgColor: AppTheme.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: ScreenSize.screenWidth(context) * 0.9,
                child: Text(
                  AppStrings.Welcome_Privacy,
                  textAlign: TextAlign.center,
                  style: AppTheme.welcomeIntroStyle(context),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
