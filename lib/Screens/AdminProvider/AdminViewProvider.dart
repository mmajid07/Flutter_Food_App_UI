import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AdminViewProvider with ChangeNotifier{
  String image="";

  String name="";

  String cuisine="";

  String openTime="";

  String description="";
  User? user=FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore =FirebaseFirestore.instance;
  Future<void> getAdminDetail()async{
    String uid=user!.uid;
    try{
      DocumentSnapshot snapshot= await firestore.collection("admin").doc(uid).get();
      if(snapshot.exists){
        Map<String, dynamic> data=snapshot.data() as Map<String, dynamic>;

          image=data['restaurant']['imageURL'];
          name=data['restaurant']['name'];
          cuisine=data['restaurant']['cuisine'];
          openTime=data['restaurant']['openingTime'];
          description=data['restaurant']['description'];
       notifyListeners();
      }
    }catch(e){
      throw Exception("Error : $e");
    }
  }
}