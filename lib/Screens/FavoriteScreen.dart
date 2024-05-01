import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Component/CustomContainer.dart';
import '../Component/ElevatedBTN_Component.dart';
import '../Component/Image_Component.dart';
import '../Utiles/AppImage.dart';
import '../Utiles/App_Theme.dart';
import '../Utiles/ScreenSize.dart';
import 'Restaurant_Menu_Moderate.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
                      height: 120.h,
                      boxFit: BoxFit.fill,
                      image: AppImage.foodMenuBG)),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 44.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ImageComponent(image: AppImage.backButton),
                      Text(
                        "Favorite",
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
                  ImageComponent(
                    image: AppImage.logo,
                    height: ScreenSize.screenHeight(context) * 0.14,
                  )
                ],
              )
            ],
          ),

          Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(
                        ScreenSize.screenHeight(context) * 0.01),
                    child: Material(
                      elevation: 5,
                      child: CustomContainer(
                        color: AppTheme.white,
                        widget: Padding(
                          padding: EdgeInsets.all(
                              ScreenSize.screenWidth(context) * 0.02),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  ImageComponent(
                                    image: AppImage.restaurant,
                                    boxFit: BoxFit.fill,
                                    height:66.h,
                                    width: 93.w,
                                  ),
                                  SizedBox(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Le Couno Restaurants",
                                          style:TextStyle(fontWeight: FontWeight.w400, fontSize: 22.sp),
                                        ),
                                        SizedBox(
                                          width: 213.w,
                                          child: Text(
                                            "Burger-Chicken-Riche-Wings",
                                            style:TextStyle(
                                                color: Color(0xffA0A5BA),
                                                fontWeight: FontWeight.w400, fontSize: 18.sp),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Open : ",
                                        style:TextStyle(

                                            fontWeight: FontWeight.w700, fontSize: 14.sp),
                                      ),
                                      Text(
                                        "12:00 PM",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14.sp,
                                            color: Colors.green),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Close : ",
                                        style:TextStyle(

                                            fontWeight: FontWeight.w700, fontSize: 14.sp),
                                      ),
                                      Text(
                                        "12:00 PM",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14.sp,
                                            color: AppTheme.primaryColor),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 29.w,
                                    height: 30.h,
                                    child: ImageComponent(image: AppImage.favorite,)
                                  )
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left:
                                    ScreenSize.screenWidth(context) *
                                        0.04,
                                    bottom:
                                    ScreenSize.screenWidth(context) *
                                        0.02,
                                    top: ScreenSize.screenWidth(context) *
                                        0.01),
                                child: Row(
                                  children: [
                                    SizedBox(
                                        width:21.w,
                                        height: 15.h,
                                        child: ImageComponent(image: AppImage.ratingStar)),
                                    SizedBox(
                                      width: ScreenSize.screenWidth(
                                          context) *
                                          0.02,
                                    ),
                                    Text(
                                      "4.7",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height:
                                    29.h,
                                    width:125.w,
                                    child: ElevatedBTN_Component(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    RestaurantMenuModerate()));
                                      },
                                      widget: Text("Moderate", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),),
                                      bgColor: AppTheme.white,
                                      fgColor: AppTheme.primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                    29.h,
                                    width:125.w,
                                    child: ElevatedBTN_Component(
                                      onPressed: () {},
                                      widget: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          Text("View Menu", style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700),),
                                          SizedBox(width: 1.w,),
                                          SizedBox(
                                              height: 16.h,
                                              width: 24.w,
                                              child: ImageComponent(image: AppImage.bookIcon))
                                        ],
                                      ),
                                      bgColor: AppTheme.primaryColor,
                                      fgColor: AppTheme.white,
                                    ),
                                  ),
                                  SizedBox(
                                      width: 38.w,
                                      height: 40.h,
                                      child: ImageComponent(image: AppImage.arrowBTN))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
