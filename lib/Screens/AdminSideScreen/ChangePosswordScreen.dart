import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sol_solution_food_app/Component/Custem_Text_Field.dart';
import 'package:sol_solution_food_app/Component/ElevatedBTN_Component.dart';
import 'package:sol_solution_food_app/Screens/AdminSideScreen/EditRegisterCompanyData.dart';
import 'package:sol_solution_food_app/Screens/RatingsAndReviews.dart';
import 'package:sol_solution_food_app/Utiles/AppStrings.dart';

import '../../Component/Image_Component.dart';
import '../../Utiles/AppImage.dart';
import '../../Utiles/App_Theme.dart';
import '../../Utiles/ScreenSize.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantController = TextEditingController();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                  width: ScreenSize.screenWidth(context),
                  child: ImageComponent(
                      height: ScreenSize.screenHeight(context) * 0.2,
                      boxFit: BoxFit.fill,
                      image: AppImage.foodMenuBG)),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: ScreenSize.screenHeight(context) * 0.065,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ImageComponent(image: AppImage.backButton),
                        Text(
                          "Change Password",
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
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: ScreenSize.screenWidth(context) * 0.03),
                      child: Text(
                        "Old Password",
                        style: AppTheme.CustemlableStyle(context),
                      ),
                    ),
                    CustomTextField(
                      controller: restaurantController,
                      hintText: "Old Password",
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: ScreenSize.screenWidth(context) * 0.03),
                      child: Text(
                        "New Password",
                        style: AppTheme.CustemlableStyle(context),
                      ),
                    ),
                    CustomTextField(
                      controller: restaurantController,
                      hintText: "New Password",
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: ScreenSize.screenWidth(context) * 0.03),
                      child: Text(
                        "Confirm Password",
                        style: AppTheme.CustemlableStyle(context),
                      ),
                    ),
                    CustomTextField(
                      controller: restaurantController,
                      hintText: "Confirm Password",
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          SizedBox(
            height: 49.h,
            width: 256.w,
            child: ElevatedBTN_Component(
              onPressed: () {},
              widget: Text(
                "Change Password",
                style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.white),
              ),
              bgColor: AppTheme.primaryColor,
              fgColor: AppTheme.white,
            ),
          )
        ],
      ),
    );
  }
}
