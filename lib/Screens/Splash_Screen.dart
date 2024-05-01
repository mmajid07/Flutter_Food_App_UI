import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sol_solution_food_app/Component/Image_Component.dart';
import 'package:sol_solution_food_app/Provider/SplashProvider.dart';
import 'package:sol_solution_food_app/Utiles/AppImage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashProvider? welcomeProvider;
  @override
  void initState() {
    // TODO: implement initState
    welcomeProvider = Provider.of<SplashProvider>(context, listen: false);
    welcomeProvider!.splashFunction(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: [
        ImageComponent(
          image: AppImage.welcomeImage1,
          boxFit: BoxFit.fill,
          height: height,
        ),
        Positioned(
          top: 130,
          left: 75,
          child: ImageComponent(
            image: AppImage.welcomeImage2,
            boxFit: BoxFit.cover,
            height: height * 0.3,
          ),
        )
      ]),
    );
  }
}
