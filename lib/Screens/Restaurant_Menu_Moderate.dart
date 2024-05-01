import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sol_solution_food_app/Component/ElevatedBTN_Component.dart';
import 'package:sol_solution_food_app/Component/Image_Component.dart';
import 'package:sol_solution_food_app/Screens/MapLocationScreen.dart';
import 'package:sol_solution_food_app/Utiles/AppImage.dart';
import 'package:sol_solution_food_app/Utiles/AppStrings.dart';
import 'package:sol_solution_food_app/Utiles/App_Theme.dart';
import 'package:sol_solution_food_app/Utiles/ScreenSize.dart';

class RestaurantMenuModerate extends StatefulWidget {
  const RestaurantMenuModerate({super.key});

  @override
  State<RestaurantMenuModerate> createState() => _RestaurantMenuModerateState();
}

class _RestaurantMenuModerateState extends State<RestaurantMenuModerate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          AppStrings.retaurantMenu,
          style: AppTheme.welcomeStyle(context),
        ),
        leading: ImageComponent(image: AppImage.backButton),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.book))],
      ),
      body: Column(
        children: [
          SizedBox(
            height: ScreenSize.screenHeight(context) * 0.5,
            width: ScreenSize.screenWidth(context),
            child: Stack(
              children: [
                SizedBox(
                  height: ScreenSize.screenHeight(context) * 0.4,
                  width: ScreenSize.screenWidth(context),
                  child: ImageComponent(
                    image: AppImage.restaurant_Main,
                    boxFit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: ScreenSize.screenHeight(context) * 0.01,
                  child: SizedBox(
                    width: ScreenSize.screenWidth(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageComponent(
                          image: AppImage.logo,
                          boxFit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.screenWidth(context) * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Le Courno's Restorentie",
                    style: AppTheme.lightHeadlineStyle(context),
                  ),
                  Text(
                    "Burger - Chicken - Riche - Wings",
                    style: AppTheme.bodyStyle(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star_outline,
                            color: AppTheme.primaryColor,
                            size: ScreenSize.screenHeight(context) * 0.03,
                          ),
                          SizedBox(
                            width: ScreenSize.screenWidth(context) * 0.01,
                          ),
                          Text(
                            "4.7",
                            style: TextStyle(
                                fontSize:
                                    ScreenSize.screenHeight(context) * 0.015,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        "5000+ Ratings",
                        style: TextStyle(
                          fontSize: ScreenSize.screenHeight(context) * 0.015,
                        ),
                      ),
                      Text(
                        "See Reviews",
                        style: TextStyle(
                            fontSize: ScreenSize.screenHeight(context) * 0.015,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryColor),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
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
                      Text(
                        "Distance : 1500 km away",
                        style: TextStyle(
                            fontSize: ScreenSize.screenHeight(context) * 0.015,
                            color: AppTheme.secandryColor),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: AppTheme.headlineStyle(context),
                      ),
                      SizedBox(
                        height: ScreenSize.screenHeight(context) * 0.01,
                      ),
                      Text(
                        "It is a restaurent which have amazing menu burger-steak , pizza , wrape , drinks , hot bar , salad bar and many other items which will give you joy and taste ",
                        style: AppTheme.bodyStyle(context),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: ScreenSize.screenWidth(context) * 0.6,
                        child: ElevatedBTN_Component(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MapLocationScreen()));
                            },
                            widget: Text("Moderate")),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MapLocationScreen()));
                        },
                        child: ImageComponent(
                          image: AppImage.ButtonImage,
                          height: ScreenSize.screenHeight(context) * 0.06,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
