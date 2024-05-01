import 'package:flutter/cupertino.dart';

class homeScreenProvider with ChangeNotifier {
  int selectedIndex = 0;

  void setColor(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
