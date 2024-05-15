import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sol_solution_food_app/Screens/AdminSideScreen/BottomNavBar.dart';
import 'package:sol_solution_food_app/Screens/OnBoardingScreen.dart';



class AuthScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: _checkUserAuthentication(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator if authentication state is being checked
            return CircularProgressIndicator();
          } else {
            // Navigate to appropriate page based on authentication state
            if (snapshot.hasData) {
              // User is logged in, navigate to home page
              return BottomNavigationBarScreen(user: snapshot.data!);
            } else {
              // User is not logged in, navigate to login page
              return OnBoardingScreen();
            }
          }
        },
      ),
    );
  }

  Future<User?> _checkUserAuthentication() async {
    return _auth.currentUser;
  }
}
