import 'package:flutter/material.dart';
import 'package:sol_solution_food_app/Component/Custem_Text_Field.dart';
import 'package:sol_solution_food_app/Component/ElevatedBTN_Component.dart';
import 'package:sol_solution_food_app/Component/Image_Component.dart';
import 'package:sol_solution_food_app/Screens/HomeScreen.dart';
import 'package:sol_solution_food_app/Utiles/AppImage.dart';
import 'package:sol_solution_food_app/Utiles/AppStrings.dart';
import 'package:sol_solution_food_app/Utiles/ScreenSize.dart';

import '../Utiles/App_Theme.dart';

class mapScreen extends StatefulWidget {
  const mapScreen({super.key});

  @override
  State<mapScreen> createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(AppImage.googleMapImage),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    EdgeInsets.all(ScreenSize.screenHeight(context) * 0.02),
                child: CustomTextField(
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppTheme.black,
                    size: ScreenSize.screenHeight(context) * 0.04,
                  ),
                  suffix: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(backgroundImage: AssetImage(AppImage.homeMan),),
                  ),
                  // suffix: Icon(
                  //   Icons.circle,
                  //   color: AppTheme.lightGrey,
                  //   size: ScreenSize.screenHeight(context) * 0.03,
                  // ),
                  controller: searchController,
                  fillColor: AppTheme.white,
                  hintText: AppStrings.searchHint,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: ScreenSize.screenHeight(context) * 0.02),
                child: ElevatedBTN_Component(
                  bgColor: AppTheme.primaryColor,
                  fgColor: AppTheme.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => homeScreen()));
                  },
                  widget: Text(AppStrings.continueBTN),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
