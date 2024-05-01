import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sol_solution_food_app/Provider/HomeScreenProvider.dart';
import 'package:sol_solution_food_app/Provider/LoginSignUp_Provider.dart';
import 'package:sol_solution_food_app/Provider/OnBoardingScreen_Provider.dart';
import 'package:sol_solution_food_app/Provider/SplashProvider.dart';
import 'package:sol_solution_food_app/Screens/Splash_Screen.dart';
import 'package:sol_solution_food_app/Utiles/ScreenSize.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => OnBoardingScreenProvider()),
        ChangeNotifierProvider(create: (_) => LoginSignUpProvider()),
        ChangeNotifierProvider(create: (_) => homeScreenProvider())
      ],
      child: ScreenUtilInit(
        designSize:const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.red,
            ),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
