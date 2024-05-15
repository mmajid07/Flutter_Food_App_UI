import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sol_solution_food_app/Provider/HomeScreenProvider.dart';
import 'package:sol_solution_food_app/Provider/LoginSignUp_Provider.dart';
import 'package:sol_solution_food_app/Provider/MapScreenProvider.dart';
import 'package:sol_solution_food_app/Provider/OnBoardingScreen_Provider.dart';
import 'package:sol_solution_food_app/Provider/SplashProvider.dart';
import 'package:sol_solution_food_app/Screens/AdminProvider/AdminHomeProvider.dart';
import 'package:sol_solution_food_app/Screens/AdminProvider/AdminViewProvider.dart';
import 'package:sol_solution_food_app/Screens/AdminProvider/BottomNavBarProvider.dart';
import 'package:sol_solution_food_app/Screens/AdminSideScreen/CompanyRegisterScreen.dart';
import 'package:sol_solution_food_app/Screens/Splash_Screen.dart';
import 'package:sol_solution_food_app/Utiles/ScreenSize.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        ChangeNotifierProvider(create: (_) => homeScreenProvider()),
        //ChangeNotifierProvider(create: (_) => MapScreenProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider()),
        ChangeNotifierProvider(create: (_) => AdminHomeProvider()),
        ChangeNotifierProvider(create: (_) => AdminViewProvider()),
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
