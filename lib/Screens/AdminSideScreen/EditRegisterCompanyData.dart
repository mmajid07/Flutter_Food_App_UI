import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sol_solution_food_app/Component/ElevatedBTN_Component.dart';
import 'package:sol_solution_food_app/Screens/AdminSideScreen/AdminHomeScreen.dart';
import 'package:sol_solution_food_app/Screens/AdminSideScreen/BottomNavBar.dart';

import '../../Component/Custem_Text_Field.dart';
import '../../Component/Image_Component.dart';
import '../../Utiles/AppImage.dart';
import '../../Utiles/AppStrings.dart';
import '../../Utiles/App_Theme.dart';
import '../../Utiles/ScreenSize.dart';

class EditRegisterCompanyData extends StatefulWidget {
  EditRegisterCompanyData({super.key});

  @override
  State<EditRegisterCompanyData> createState() =>
      _EditRegisterCompanyDataState();
}

class _EditRegisterCompanyDataState extends State<EditRegisterCompanyData> {
  final restaurantController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                    width: ScreenSize.screenWidth(context),
                    child: ImageComponent(
                        height: 130.h,
                        boxFit: BoxFit.fill,
                        image: AppImage.foodMenuBG)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Edit Restaurant",
                        style: GoogleFonts.sen(
                          textStyle: TextStyle(
                              color: AppTheme.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20.sp),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: Column(
                        children: [
                          Stack(children: [
                            ImageComponent(
                              width: 103.w,
                              height: 93.h,
                              image: AppImage.uploadImage,
                            ),
                            Positioned(
                                bottom: 15,
                                right: -5,
                                child: ImageComponent(
                                  width: 25.w,
                                  height: 22.h,
                                  image: AppImage.editImage,
                                  imageColor: Color(0xff545454),
                                ))
                          ]),
                          Text(
                            "Upload Image",
                            style: GoogleFonts.sen(
                                textStyle: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xff808080),
                              fontWeight: FontWeight.w400,
                            )),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: ScreenSize.screenWidth(context) * 0.03),
                            child: Text(
                              "Restaurant Name",
                              style: AppTheme.CustemlableStyle(context),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize.screenHeight(context) * 0.01,
                          ),
                          CustomTextField(
                            controller: restaurantController,
                            hintText: "Le Courno's Restaurant",
                            suffix: ImageComponent(
                              image: AppImage.editImage,
                              height: 22.h,
                              width: 25.w,
                              imageColor: Color(
                                0xff545454,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: ScreenSize.screenWidth(context) * 0.03),
                            child: Text(
                              "Restaurant Cuisine",
                              style: AppTheme.CustemlableStyle(context),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize.screenHeight(context) * 0.01,
                          ),
                          CustomTextField(
                            controller: restaurantController,
                            hintText: "Restaurant Cuisine",
                            suffix: ImageComponent(
                              image: AppImage.editImage,
                              height: 22.h,
                              width: 25.w,
                              imageColor: Color(
                                0xff545454,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: ScreenSize.screenWidth(context) * 0.03),
                            child: Text(
                              "Location",
                              style: AppTheme.CustemlableStyle(context),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize.screenHeight(context) * 0.01,
                          ),
                          CustomTextField(
                            controller: restaurantController,
                            hintText: "Location",
                            suffix: ImageComponent(
                              image: AppImage.location,
                              height: 22.h,
                              width: 25.w,
                              imageColor: Color(
                                0xff545454,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: ScreenSize.screenWidth(context) * 0.03),
                            child: Text(
                              "Description",
                              style: AppTheme.CustemlableStyle(context),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize.screenHeight(context) * 0.01,
                          ),
                          CustomTextField(
                            maxLine: 3,
                            controller: restaurantController,
                            hintText: "Write Description",
                            suffix: ImageComponent(
                              image: AppImage.editImage,
                              height: 22.h,
                              width: 25.w,
                              imageColor: Color(
                                0xff545454,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text("Opening Hour",
                          style: GoogleFonts.inter(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                            color: Color(0xff9CA3AF),
                          ))),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text("Opening",
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    color: Color(0xff000000),
                                  ))),
                              SizedBox(
                                width: 5.w,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xff9CA3AF),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(6.sp),
                                  child: Row(
                                    children: [
                                      Text("12:00",
                                          style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                            color: Color(0xff9CA3AF),
                                          ))),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text("PM",
                                          style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                            color: Color(0xff000000),
                                          ))),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text("Closed",
                                  style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                    color: Color(0xff000000),
                                  ))),
                              SizedBox(
                                width: 5.w,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xff9CA3AF),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(6.sp),
                                  child: Row(
                                    children: [
                                      Text("12:00",
                                          style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                            color: Color(0xff9CA3AF),
                                          ))),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                      Text("AM",
                                          style: GoogleFonts.inter(
                                              textStyle: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14.sp,
                                            color: Color(0xff000000),
                                          ))),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  ElevatedBTN_Component(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BottomNavigationBarScreen()));
                      },
                      radius: 10,
                      bgColor: AppTheme.primaryColor,
                      fgColor: AppTheme.white,
                      widget: Text(
                        "Edit Restaurant",
                        style: GoogleFonts.inter(
                            textStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700)),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
