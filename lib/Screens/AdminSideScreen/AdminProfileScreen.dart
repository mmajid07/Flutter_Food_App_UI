import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sol_solution_food_app/Screens/AdminSideScreen/ChangePosswordScreen.dart';
import 'package:sol_solution_food_app/Screens/AdminSideScreen/EditRegisterCompanyData.dart';
import 'package:sol_solution_food_app/Screens/RatingsAndReviews.dart';
import 'package:sol_solution_food_app/Utiles/AppStrings.dart';

import '../../Component/Image_Component.dart';
import '../../Utiles/AppImage.dart';
import '../../Utiles/App_Theme.dart';
import '../../Utiles/ScreenSize.dart';

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({super.key});

  @override
  State<AdminProfileScreen> createState() => _AdminProfileScreenState();
}

class _AdminProfileScreenState extends State<AdminProfileScreen> {
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
                  Padding(
                    padding: EdgeInsets.only(left: 20.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ImageComponent(image: AppImage.backButton),
                        Text(
                          "Account Setting",
                          style: TextStyle(
                              color: AppTheme.white,
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  ScreenSize.screenHeight(context) * 0.02),
                        ),
                        SizedBox(),
                        SizedBox(),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 70.sp,
                    backgroundImage: NetworkImage(restaurantImage),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 25.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePasswordScreen()));
                  },
                  leading: Icon(
                    Icons.lock,
                    size: 21,
                  ),
                  title: Text(
                    "Change Password",
                    style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 21,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditRegisterCompanyData()));
                  },
                  leading: Icon(
                    Icons.group,
                    size: 21,
                  ),
                  title: Text(
                    "Edit Restauarant",
                    style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 21,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RatingsAndReviews()));
                  },
                  leading: SizedBox(),
                  title: Text(
                    "Logout",
                    style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: ImageComponent(
                    image: AppImage.logout,
                    height: 20,
                    width: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
