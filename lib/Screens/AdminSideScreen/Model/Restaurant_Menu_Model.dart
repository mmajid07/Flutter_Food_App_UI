import 'package:cloud_firestore/cloud_firestore.dart';

class MenuModel{
  final String image;
  final String dateTime;
  MenuModel({
    required this.image,
    required this.dateTime,
  });

  Map<String, dynamic> toMap(){
    return{
      "image": image,
      "dateTime": dateTime,
    };
  }
}