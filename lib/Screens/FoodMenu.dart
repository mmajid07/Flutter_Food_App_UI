import 'package:flutter/material.dart';
import 'package:flutter/src/animation/animation_controller.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/ticker_provider.dart';
import 'package:sol_solution_food_app/Component/Image_Component.dart';
import 'package:sol_solution_food_app/Utiles/AppImage.dart';
import 'package:sol_solution_food_app/Utiles/App_Theme.dart';
import 'package:sol_solution_food_app/Utiles/ScreenSize.dart';

class FoodMenuScreen extends StatefulWidget {
  const FoodMenuScreen({super.key});

  @override
  State<FoodMenuScreen> createState() => _FoodMenuScreenState();
}

class _FoodMenuScreenState extends State<FoodMenuScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                          "Food Menu",
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
            height: ScreenSize.screenHeight(context) * 0.01,
          ),
          Text(
            "Le Courn's Restorentie",
            style: TextStyle(
                color: AppTheme.black,
                fontSize: ScreenSize.screenHeight(context) * 0.023),
          ),
          SizedBox(
            height: ScreenSize.screenHeight(context) * 0.01,
          ),
          Expanded(
              child: Stack(
            children: [
              ImageComponent(
                boxFit: BoxFit.fill,
                image: AppImage.menuGirl,
                height: ScreenSize.screenHeight(context),
                width: ScreenSize.screenWidth(context),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenSize.screenWidth(context) * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ImageComponent(image: AppImage.backButton),
                        ImageComponent(image: AppImage.forwordButton),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
