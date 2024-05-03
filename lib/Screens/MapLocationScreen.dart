import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sol_solution_food_app/Component/Custem_Text_Field.dart';
import 'package:sol_solution_food_app/Component/ElevatedBTN_Component.dart';
import 'package:sol_solution_food_app/Component/Image_Component.dart';
import 'package:sol_solution_food_app/Screens/FoodMenu.dart';
import 'package:sol_solution_food_app/Utiles/AppImage.dart';
import 'package:sol_solution_food_app/Utiles/AppStrings.dart';
import 'package:sol_solution_food_app/Utiles/App_Theme.dart';
import 'package:sol_solution_food_app/Utiles/ScreenSize.dart';

class MapLocationScreen extends StatefulWidget {
  const MapLocationScreen({super.key});

  @override
  State<MapLocationScreen> createState() => _MapLocationScreenState();
}

class _MapLocationScreenState extends State<MapLocationScreen> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: ScreenSize.screenHeight(context),
        width: ScreenSize.screenWidth(context),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(AppImage.googleMapImage))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: ScreenSize.screenHeight(context) * 0.15,
              width: ScreenSize.screenWidth(context),
              color: AppTheme.primaryColor,
              child: Column(
                children: [
                  SizedBox(
                    height: ScreenSize.screenHeight(context) * 0.068,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          height: ScreenSize.screenHeight(context) * 0.08,
                          child: ImageComponent(image: AppImage.backButton)),
                      SizedBox(
                        width: ScreenSize.screenWidth(context) * 0.8,
                        child: CustomTextField(
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppTheme.black,
                            size: ScreenSize.screenHeight(context) * 0.04,
                          ),
                          suffix: Padding(
                            padding: EdgeInsets.only(
                                right: ScreenSize.screenWidth(context) * 0.03),
                            child: Container(
                              height: ScreenSize.screenHeight(context) * 0.03,
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: ImageComponent(image: AppImage.homeMan),
                            ),
                          ),
                          controller: searchController,
                          fillColor: AppTheme.white,
                          hintText: AppStrings.searchHint,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: ScreenSize.screenHeight(context) * 0.18,
              color: AppTheme.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ImageComponent(
                        image: AppImage.restaurant,
                        boxFit: BoxFit.fill,
                        height: ScreenSize.screenHeight(context) * 0.12,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Le Couno's Restorentie",
                            style: AppTheme.lightHeadlineStyle(context),
                          ),
                          Text(
                            "Burger - Chicken - Riche - Wings",
                            style: TextStyle(
                                color: Color(0xff808080),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star_outline,
                                color: AppTheme.primaryColor,
                                size: ScreenSize.screenHeight(context) * 0.025,
                              ),
                              SizedBox(
                                width: ScreenSize.screenWidth(context) * 0.01,
                              ),
                              Center(
                                child: Text(
                                  "4.7",
                                  style: TextStyle(
                                      fontSize:
                                          ScreenSize.screenHeight(context) *
                                              0.015,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Open : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      ScreenSize.screenHeight(context) * 0.015,
                                ),
                              ),
                              Text(
                                "12:00 PM",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      ScreenSize.screenHeight(context) * 0.015,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.screenWidth(context) * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 98.w,
                          height: 33.h,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                ScreenSize.screenWidth(context) * 0.025),
                            child: ElevatedBTN_Component(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FoodMenuScreen()));
                                },
                                widget: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "View Menu",
                                      style: TextStyle(
                                          fontSize:10.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.white),
                                    ),
                                    ImageComponent(
                                        height: 21.h,
                                        width: 24.w,
                                        image: AppImage.bookIcon)
                                  ],
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: ScreenSize.screenWidth(context) * 0.05),
                          child: Text(
                            "Distance : 1500 km away",
                            style: TextStyle(
                                fontSize:
                                    ScreenSize.screenHeight(context) * 0.018,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff808080)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
