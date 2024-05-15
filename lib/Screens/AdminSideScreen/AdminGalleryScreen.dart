import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Component/Image_Component.dart';
import '../../Utiles/AppImage.dart';
import '../../Utiles/App_Theme.dart';
import '../../Utiles/ScreenSize.dart';

class AdminGalleryScreen extends StatefulWidget {
    AdminGalleryScreen({super.key});

  @override
  State<AdminGalleryScreen> createState() => _AdminGalleryScreenState();
}

class _AdminGalleryScreenState extends State<AdminGalleryScreen> {

  String restaurantImage="";


  Future<void> getUserImage(String uid)async{
    DocumentSnapshot snapshot=await FirebaseFirestore.instance.collection("admin").doc(uid).get();

    try{
      if(snapshot.exists){
        Map<String, dynamic> data=snapshot.data() as Map<String, dynamic>;
        setState(() {
          restaurantImage=data["restaurant"]["imageURL"];
        });
      }
    }catch(e){
      throw Exception("not have document");
    }
  }
  User? user=FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserImage(user!.uid.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                  width: ScreenSize.screenWidth(context),
                  child: ImageComponent(
                      height: ScreenSize.screenHeight(context) * 0.2,
                      boxFit: BoxFit.fill,
                      image: AppImage.foodMenuBG)),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: ScreenSize.screenHeight(context) * 0.065,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [

                      Text(
                        "Ambiance Gallery",
                        style: TextStyle(
                            color: AppTheme.white,
                            fontWeight: FontWeight.bold,
                            fontSize:
                            ScreenSize.screenHeight(context) * 0.02),
                      ),

                      SizedBox(),

                      ImageComponent(
                          width: 45.w,
                          height: 45.h,
                          image: AppImage.homeMenu)

                    ],
                  ),
                   CircleAvatar(
                     radius: 70.sp,
                     backgroundImage: NetworkImage(restaurantImage),
                   )
                ],
              )
            ],
          ),

          Expanded(
            child: Padding(
              padding:   EdgeInsets.symmetric(horizontal: 15.w),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("admin").doc(user!.uid).collection("galleryImage").snapshots(),
                builder: (context, snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(color: AppTheme.primaryColor,));

                  }else{
                    if(snapshot.hasError){
                      return Text("Error : ${snapshot.error}");
                    }else{
                      if(snapshot.data !=null){
                        final data= snapshot.data!.docs;
                        return MasonryGridView.count(
                            shrinkWrap: true,
                            itemCount: data.length,
                            crossAxisCount: 3,
                            crossAxisSpacing: 15.sp,
                            mainAxisSpacing: 15.sp,

                            itemBuilder: (context, index){
                              double ht=((index%2)+1)*70;
                              double width=((index%4)+1)*40;
                              return SizedBox(
                                height: ht.h,
                                width: width.w,
                                child: Material(
                                    elevation: 5,
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      data[index]["galleryPost"]["image"].toString(),
                                      fit: BoxFit.fill,
                                    )
                                ),
                              );
                            });
                      }
                    }
                  }
                  return SizedBox();
                },

              ),
            ),
          ),
        ],
      ),
    );
  }
}
