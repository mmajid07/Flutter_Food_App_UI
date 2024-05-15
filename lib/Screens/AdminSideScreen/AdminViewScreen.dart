import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sol_solution_food_app/Screens/AdminProvider/AdminViewProvider.dart';

import '../../Component/Image_Component.dart';
import '../../Utiles/AppImage.dart';
import '../../Utiles/App_Theme.dart';
import '../../Utiles/ScreenSize.dart';

class AdminViewScreen extends StatefulWidget {
    AdminViewScreen({super.key});

  @override
  State<AdminViewScreen> createState() => _AdminViewScreenState();
}

class _AdminViewScreenState extends State<AdminViewScreen> {
  User? user=FirebaseAuth.instance.currentUser;

  FirebaseFirestore firestore= FirebaseFirestore.instance;





  @override
  void initState() {
    // TODO: implement initState
    final provider=Provider.of<AdminViewProvider>(context, listen: false);
    super.initState();
    provider.getAdminDetail();
  }

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<AdminViewProvider>(context, listen: false);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                  width: ScreenSize.screenWidth(context),
                  child: ImageComponent(
                      height: 162.h,
                      boxFit: BoxFit.fill,
                      image: AppImage.foodMenuBG)),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: ScreenSize.screenHeight(context) * 0.065,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ImageComponent(image: AppImage.backButton),
                        Text(
                          "Restaurant Menu",
                          style: TextStyle(
                              color: AppTheme.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  ScreenSize.screenHeight(context) * 0.02),
                        ),
                        ImageComponent(image: AppImage.editImage),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),

                  Consumer<AdminViewProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                      return Image(
                          height: 209.h,
                          fit: BoxFit.fill,
                          width: double.infinity,
                          image: NetworkImage(value.image));
                    },

                  )
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<AdminViewProvider>(
                  builder:(context, value, child){
                    return Text(
                      value.name,
                      style: GoogleFonts.sen(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff000000)),
                    );
    }
                ),
                Consumer<AdminViewProvider>(
                  builder: (context, value, child){
                    return Text(
                      value.cuisine,
                      style: GoogleFonts.sen(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff808080)),
                    );
                  }
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star_outline,
                          color: AppTheme.primaryColor,
                          size: 27.67.sp,
                        ),
                        SizedBox(
                          width: ScreenSize.screenWidth(context) * 0.01,
                        ),
                        Text(
                          "4.7",
                          style: GoogleFonts.sen(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ],
                    ),
                    Text(
                      "5000+ Ratings",
                      style: GoogleFonts.sen(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    Text(
                      "See Reviews",
                      style: GoogleFonts.sen(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffFF0000)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Row(
                        children: [
                          Text(
                            "Open : ",
                            style: GoogleFonts.sen(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                          Consumer<AdminViewProvider>(
                            builder: (BuildContext context, value, Widget? child){
                              return Text(
                                value.openTime,
                                style: GoogleFonts.inter(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff008000)),
                              );
                            },

                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        "Description",
                        style: GoogleFonts.sen(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff008000)),
                      ),
                    ),
                    Consumer<AdminViewProvider>(
                      builder: (BuildContext context, value, Widget? child){
                        return Text(
                          value.description,
                          style: GoogleFonts.sen(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff000000)),
                        );
                      } ,

                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Text(
              "Menu",
              textAlign: TextAlign.start,
              style: GoogleFonts.sen(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffFF0000)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 12.sp),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("admin").doc(user!.uid).collection("menuImage").snapshots(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(color: AppTheme.primaryColor,));

                  }else{
                    if(snapshot.hasError){
                      return Text("Error : ${snapshot.error}");
                    }else{
                      if(snapshot.data !=null){
                        final data= snapshot.data!.docs;
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(8.sp),
                                child: Material(
                                  elevation: 5,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppTheme.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Image(
                                              height: 63.h,
                                              width: 95.w,
                                              image: NetworkImage(data[index]['menuPost']['image'].toString())),

                                          Text(
                                            data[index]['menuPost']['dateTime'].toString(),
                                            style: GoogleFonts.inter(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xff808080)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
          SizedBox(),
        ],
      ),
    );
  }
}
