import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sol_solution_food_app/Component/Custem_Text_Field.dart';
import 'package:sol_solution_food_app/Component/ElevatedBTN_Component.dart';
import 'package:sol_solution_food_app/Component/Image_Component.dart';
import 'package:sol_solution_food_app/Utiles/AppImage.dart';
import 'package:sol_solution_food_app/Utiles/App_Theme.dart';
import 'package:sol_solution_food_app/Utiles/ScreenSize.dart';

import 'UploadScreen.dart';

class RatingsAndReviews extends StatefulWidget {
  const RatingsAndReviews({super.key});

  @override
  State<RatingsAndReviews> createState() => _RatingsAndReviewsState();
}

class _RatingsAndReviewsState extends State<RatingsAndReviews> {
  final reviewController = TextEditingController();
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
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ImageComponent(image: AppImage.backButton),
                        Text(
                          "Rating and Reviews",
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
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.screenWidth(context) * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    elevation: 2,
                    borderRadius: BorderRadius.circular(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: ScreenSize.screenWidth(context) * 0.05),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "4.3",
                                  style: TextStyle(
                                      fontSize:
                                          ScreenSize.screenHeight(context) *
                                              0.03,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.black),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          ScreenSize.screenHeight(context) *
                                              0.01),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: AppTheme.starColor,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: AppTheme.starColor,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: AppTheme.starColor,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: AppTheme.starColor,
                                      ),
                                      Icon(
                                        Icons.star_half_outlined,
                                        color: AppTheme.starColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "All Rating (5000+)",
                                  style: TextStyle(
                                      fontSize:
                                          ScreenSize.screenHeight(context) *
                                              0.015,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: ScreenSize.screenWidth(context) * 0.01),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "5",
                                      style: TextStyle(
                                          fontSize:
                                              ScreenSize.screenHeight(context) *
                                                  0.015,
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.black),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: AppTheme.starColor,
                                    ),
                                    SizedBox(
                                      width: ScreenSize.screenWidth(context) *
                                          0.28,
                                      child: LinearProgressIndicator(
                                        value: 0.69,
                                        backgroundColor: AppTheme.lightGrey,
                                        color: AppTheme.starColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: ScreenSize.screenWidth(context) *
                                          0.015,
                                    ),
                                    Text(
                                      "69%",
                                      style: TextStyle(
                                          fontSize:
                                              ScreenSize.screenHeight(context) *
                                                  0.015,
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "4",
                                      style: TextStyle(
                                          fontSize:
                                              ScreenSize.screenHeight(context) *
                                                  0.015,
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.black),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: AppTheme.starColor,
                                    ),
                                    SizedBox(
                                      width: ScreenSize.screenWidth(context) *
                                          0.28,
                                      child: LinearProgressIndicator(
                                        value: 0.15,
                                        backgroundColor: AppTheme.lightGrey,
                                        color: AppTheme.starColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: ScreenSize.screenWidth(context) *
                                          0.015,
                                    ),
                                    Text(
                                      "15%",
                                      style: TextStyle(
                                          fontSize:
                                              ScreenSize.screenHeight(context) *
                                                  0.015,
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "3",
                                      style: TextStyle(
                                          fontSize:
                                              ScreenSize.screenHeight(context) *
                                                  0.015,
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.black),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: AppTheme.starColor,
                                    ),
                                    SizedBox(
                                      width: ScreenSize.screenWidth(context) *
                                          0.28,
                                      child: LinearProgressIndicator(
                                        value: 0.09,
                                        backgroundColor: AppTheme.lightGrey,
                                        color: AppTheme.starColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: ScreenSize.screenWidth(context) *
                                          0.015,
                                    ),
                                    Text(
                                      "9%",
                                      style: TextStyle(
                                          fontSize:
                                              ScreenSize.screenHeight(context) *
                                                  0.015,
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "2",
                                      style: TextStyle(
                                          fontSize:
                                              ScreenSize.screenHeight(context) *
                                                  0.015,
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.black),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: AppTheme.starColor,
                                    ),
                                    SizedBox(
                                      width: ScreenSize.screenWidth(context) *
                                          0.28,
                                      child: LinearProgressIndicator(
                                        value: 0.04,
                                        backgroundColor: AppTheme.lightGrey,
                                        color: AppTheme.starColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: ScreenSize.screenWidth(context) *
                                          0.015,
                                    ),
                                    Text(
                                      "4%",
                                      style: TextStyle(
                                          fontSize:
                                              ScreenSize.screenHeight(context) *
                                                  0.015,
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.black),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "1",
                                      style: TextStyle(
                                          fontSize:
                                              ScreenSize.screenHeight(context) *
                                                  0.015,
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.black),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: AppTheme.starColor,
                                    ),
                                    SizedBox(
                                      width: ScreenSize.screenWidth(context) *
                                          0.28,
                                      child: LinearProgressIndicator(
                                        value: 0.09,
                                        backgroundColor: AppTheme.lightGrey,
                                        color: AppTheme.starColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: ScreenSize.screenWidth(context) *
                                          0.015,
                                    ),
                                    Text(
                                      "9%",
                                      style: TextStyle(
                                          fontSize:
                                              ScreenSize.screenHeight(context) *
                                                  0.015,
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.black),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Reviews",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenSize.screenHeight(context) * 0.025),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        thickness: 2,
                      ),
                      Text(
                        "Mian",
                        style: TextStyle(
                            fontSize: ScreenSize.screenHeight(context) * 0.02,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.black),
                      ),
                      SizedBox(
                        height: ScreenSize.screenHeight(context) * 0.01,
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.star,
                                color: AppTheme.starColor,
                              ),
                              Icon(
                                Icons.star_border_outlined,
                                color: AppTheme.starColor,
                              ),
                              Icon(
                                Icons.star_border_outlined,
                                color: AppTheme.starColor,
                              ),
                              Icon(
                                Icons.star_border_outlined,
                                color: AppTheme.starColor,
                              ),
                              Icon(
                                Icons.star_border_outlined,
                                color: AppTheme.starColor,
                              ),
                            ],
                          ),
                          Text(
                            " - Yesterday",
                            style: TextStyle(
                                fontSize:
                                    ScreenSize.screenHeight(context) * 0.015,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.lightGrey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenSize.screenHeight(context) * 0.01,
                      ),
                      Text(
                        "There were no burger in any of deal",
                        style: TextStyle(
                            fontSize: ScreenSize.screenHeight(context) * 0.015,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.black),
                      ),
                      SizedBox(
                        height: ScreenSize.screenHeight(context) * 0.01,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.thumb_up,
                            color: AppTheme.lightGrey,
                          ),
                          SizedBox(
                            width: ScreenSize.screenWidth(context) * 0.02,
                          ),
                          Text(
                            "Helpful",
                            style: TextStyle(
                                fontSize:
                                    ScreenSize.screenHeight(context) * 0.015,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.lightGrey),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 2,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Rate this app",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenSize.screenHeight(context) * 0.025),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_border,
                        color: AppTheme.primaryColor,
                        size: ScreenSize.screenHeight(context) * 0.04,
                      ),
                      Icon(
                        Icons.star_border,
                        color: AppTheme.primaryColor,
                        size: ScreenSize.screenHeight(context) * 0.04,
                      ),
                      Icon(
                        Icons.star_border,
                        color: AppTheme.primaryColor,
                        size: ScreenSize.screenHeight(context) * 0.04,
                      ),
                      Icon(
                        Icons.star_border,
                        color: AppTheme.primaryColor,
                        size: ScreenSize.screenHeight(context) * 0.04,
                      ),
                      Icon(
                        Icons.star_border,
                        color: AppTheme.primaryColor,
                        size: ScreenSize.screenHeight(context) * 0.04,
                      ),
                      SizedBox(),
                      SizedBox(),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Wrie a Review",
                      style: TextStyle(
                          fontSize: ScreenSize.screenHeight(context) * 0.02),
                    ),
                  ),
                  SizedBox(
                    height: ScreenSize.screenHeight(context) * 0.07,
                    width: ScreenSize.screenWidth(context),
                    child: CustomTextField(
                        controller: reviewController,
                        hintText: "Describe Your Experience (Optional)"),
                  ),
                  SizedBox(
                    height: ScreenSize.screenHeight(context) * 0.06,
                    width: ScreenSize.screenWidth(context) * 0.7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: ElevatedBTN_Component(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadScreen()));
                          },
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Upload Image", style: TextStyle(fontSize: ScreenSize.screenWidth(context)*0.04),),
                                SizedBox(width: ScreenSize.screenWidth(context)*0.01,),
                              Icon(Icons.file_upload_outlined)
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
