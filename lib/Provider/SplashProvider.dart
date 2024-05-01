import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sol_solution_food_app/Screens/OnBoardingScreen.dart';

class SplashProvider with ChangeNotifier {
  void splashFunction(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OnBoardingScreen(),
        ),
      ),
    );

    notifyListeners();
  }
}
