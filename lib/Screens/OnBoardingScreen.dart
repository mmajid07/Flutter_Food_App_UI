import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sol_solution_food_app/Component/Image_Component.dart';
import 'package:sol_solution_food_app/Provider/OnBoardingScreen_Provider.dart';
import 'package:sol_solution_food_app/Screens/Welcome_Screen.dart';
import 'package:sol_solution_food_app/Utiles/AppImage.dart';
import 'package:sol_solution_food_app/Utiles/App_Theme.dart';
import 'package:sol_solution_food_app/Utiles/ScreenSize.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<OnBoardingScreenProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _pageController,
            itemCount: provider.pages.length,
            onPageChanged: (int page) {
              provider.pageChange(page);
            },
            itemBuilder: (context, index) {
              return provider.pages[index];
            },
          ),
          Positioned(
            bottom: 10,
            child: SizedBox(
              width: ScreenSize.screenWidth(context) * 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen()));
                    },
                    child: Text('Skip', style: AppTheme.buttonStyle(context)),
                  ),
                  Consumer<OnBoardingScreenProvider>(
                    builder: (context, value, child) {
                      return Row(
                        children: value.buildPageIndicator(),
                      );
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      if (provider.currentPage == provider.pages.length - 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeScreen()));
                      } else {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    },
                    child: ImageComponent(
                      image: AppImage.ButtonImage,
                      boxFit: BoxFit.cover,
                      height: ScreenSize.screenHeight(context) * 0.065,
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
