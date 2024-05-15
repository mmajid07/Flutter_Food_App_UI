import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sol_solution_food_app/Screens/AdminSideScreen/UploadMenuScreen.dart';

import '../../Component/Image_Component.dart';
import '../../Utiles/AppImage.dart';
import '../../Utiles/App_Theme.dart';
import '../../Utiles/ScreenSize.dart';

class AdminMenuScreen extends StatelessWidget {
    AdminMenuScreen({super.key});
  
  User? user =FirebaseAuth.instance.currentUser;

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
                      height: 120.h,
                      boxFit: BoxFit.fill,
                      image: AppImage.foodMenuBG)),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding:   EdgeInsets.only(left: 15.sp, right: 25.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          "Le Courno's Restorentie",
                          style: TextStyle(
                              color: AppTheme.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                              ScreenSize.screenHeight(context) * 0.02),
                        ),

                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>UploadMenuScreen()));
                          },
                          child: Container(
                            width: 38.w,
                            height: 34.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme.white
                            ),
                            child: ImageComponent(
                              width: 24.5.w,
                              height: 22.6.h,
                              image: AppImage.uploadMenu,),
                          ),
                        )

                      ],
                    ),
                  ),

                ],
              )
            ],
          ),

          Text("Restaurant Menu", style: GoogleFonts.italianno(
            fontSize:40.sp,
            fontWeight:FontWeight.w400,
            color:Colors.black,
          ),),

          Expanded(
            child: Padding(
              padding:   EdgeInsets.symmetric(horizontal: 15.w),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('admin').doc(user!.uid).collection("menuImage").snapshots(),
                builder: (context, snapshot){

                  if(snapshot.connectionState==ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(color: AppTheme.primaryColor,));

                  }else{
                    if(snapshot.hasError){
                      return Text("Error : ${snapshot.error}");
                    }else{
                      if(snapshot.data !=null){
                        final data= snapshot.data!.docs;
                        return GridView.builder(

                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 15.sp,
                                crossAxisSpacing: 15.sp,
                                crossAxisCount: 2
                            ),
                            itemCount: data.length,
                            itemBuilder: (context, index){
                              return Material(
                                elevation: 5,
                                borderRadius: BorderRadius.circular(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Image(
                                        width: 139.w,
                                        height: 90.h,
                                        image: NetworkImage(data[index]['menuPost']['image'].toString())),
                                    // ImageComponent(
                                    //     width: 139.w,
                                    //     height: 90.h,
                                    //     image: AppImage.restaurant_Main),

                                    Text(data[index]['menuPost']['dateTime'],
                                      style: GoogleFonts.inter(
                                          fontSize:12.sp,
                                          fontWeight:FontWeight.w500,
                                          color:Color(0xff808080)
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      }
                    }
                  }
                  return SizedBox();
                }

              ),
            ),
          ),
        ],
      ),
    );
  }
}
