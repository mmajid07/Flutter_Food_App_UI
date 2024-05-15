import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sol_solution_food_app/Screens/AdminSideScreen/UploadGalleryScreen.dart';
import 'package:sol_solution_food_app/Screens/AdminSideScreen/UploadMenuScreen.dart';

class AdminHomeProvider with ChangeNotifier{
  List<Map<String, dynamic>> _homeGridData= [
    {
      "title" :"Upload Menua",
      "icon" : Icons.menu_book_outlined,
      "color" : Colors.green,
      "page" : UploadMenuScreen(),
    },
    {
      "title" :"Gallery",
      "icon" : Icons.image,
      "color" : Colors.red,
      "page" : UploadGalleryScreen(),
    },

    {
      "title" :"Rating",
      "icon" : Icons.stars,
      "color" : Colors.yellow,
      "page" : UploadMenuScreen(),
    },

    {
      "title" :"Profile",
      "icon" : Icons.person,
      "color" : Colors.blueAccent,
      "page" : UploadMenuScreen(),
    },
  ];

  List<Map<String, dynamic>> get homeGridData=>_homeGridData;


}