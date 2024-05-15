import 'package:flutter/cupertino.dart';
import 'package:sol_solution_food_app/Screens/AdminSideScreen/AdminGalleryScreen.dart';
import 'package:sol_solution_food_app/Screens/AdminSideScreen/AdminHomeScreen.dart';
import 'package:sol_solution_food_app/Screens/AdminSideScreen/AdminMenuScreen.dart';

import '../AdminSideScreen/AdminProfileScreen.dart';
import '../AdminSideScreen/AdminViewScreen.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  List<Widget> _navScreen=[
    AdminHomeScreen(),
    AdminMenuScreen(),
    AdminGalleryScreen(),
    AdminViewScreen(),
    AdminProfileScreen(),

  ];

  List<Widget> get navScreen=> _navScreen;

  void _onTapAction(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void Function(int index) get onTapAction=>_onTapAction;
}
