import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sol_solution_food_app/Component/Image_Component.dart';
import 'package:sol_solution_food_app/Utiles/AppImage.dart';
import 'package:sol_solution_food_app/Utiles/AppStrings.dart';
import 'package:sol_solution_food_app/Utiles/App_Theme.dart';
import 'package:sol_solution_food_app/Utiles/ScreenSize.dart';

class AccountSettingScreen extends StatefulWidget {
  const AccountSettingScreen({super.key});

  @override
  State<AccountSettingScreen> createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                  width: ScreenSize.screenWidth(context),
                  child: ImageComponent(
                      height: ScreenSize.screenHeight(context) * 0.25,
                      boxFit: BoxFit.fill,
                      image: AppImage.foodMenuBG)),
              Column(
                children: [
                  SizedBox(
                    height: ScreenSize.screenHeight(context) * 0.09,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ImageComponent(image: AppImage.backButton),
                        Text(
                          "Account Setting",
                          style: TextStyle(
                              color: AppTheme.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  ScreenSize.screenHeight(context) * 0.02),
                        ),
                        SizedBox(),
                        SizedBox(),
                      ],
                    ),
                  ),
                  ImageComponent(
                    image: AppImage.logo,
                    height: ScreenSize.screenHeight(context) * 0.14,
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: ScreenSize.screenHeight(context) * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.screenWidth(context) * 0.045),
            child: Material(
              elevation: 5,
              borderRadius:
                  BorderRadius.circular(ScreenSize.screenWidth(context) * 0.03),
              child: ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.lock_outlined,
                  color: AppTheme.black,
                ),
                title: Text(
                  AppStrings.changepassword,
                  style: TextStyle(
                      fontSize: ScreenSize.screenHeight(context) * 0.02,
                      color: AppTheme.black,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppTheme.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: ScreenSize.screenHeight(context) * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.screenWidth(context) * 0.045),
            child: Material(
              elevation: 5,
              borderRadius:
                  BorderRadius.circular(ScreenSize.screenWidth(context) * 0.03),
              child: ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.group_outlined,
                  color: AppTheme.black,
                ),
                title: Text(
                  AppStrings.editProfile,
                  style: TextStyle(
                      fontSize: ScreenSize.screenHeight(context) * 0.02,
                      color: AppTheme.black,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppTheme.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: ScreenSize.screenHeight(context) * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenSize.screenWidth(context) * 0.045),
            child: Material(
              elevation: 5,
              borderRadius:
                  BorderRadius.circular(ScreenSize.screenWidth(context) * 0.03),
              child: ListTile(
                onTap: () {},
                leading: SizedBox(),
                title: Text(
                  AppStrings.logout,
                  style: TextStyle(
                      fontSize: ScreenSize.screenHeight(context) * 0.02,
                      color: AppTheme.black,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Icon(
                  Icons.logout,
                  color: AppTheme.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
