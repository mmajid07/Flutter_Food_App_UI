import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sol_solution_food_app/Screens/AdminProvider/BottomNavBarProvider.dart';

import '../../Utiles/App_Theme.dart';
import 'AdminHomeScreen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  final User? user;
  const BottomNavigationBarScreen({super.key, this.user});

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {



  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<BottomNavigationBarProvider>(context, listen: false);
    return Scaffold(
      body: Consumer<BottomNavigationBarProvider>(
        builder: (context, value, child){
          return value.navScreen[value.selectedIndex];
        }),
      bottomNavigationBar: Consumer<BottomNavigationBarProvider>(
        builder: (context, value, child){
          return BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu_book),
                label: "Menu",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.image),
                label: "Gallery",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_view),
                label: "View",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),

            ],

            currentIndex: value.selectedIndex,
            selectedItemColor: AppTheme.primaryColor,
            unselectedItemColor: AppTheme.secandryColor,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap:(index)=> value.onTapAction(index),

          );
        },

      ),
    );
  }
}
