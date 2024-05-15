import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sol_solution_food_app/Screens/AdminProvider/AdminHomeProvider.dart';

import '../../Component/Image_Component.dart';
import '../../Utiles/AppImage.dart';
import '../../Utiles/App_Theme.dart';
import '../../Utiles/ScreenSize.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  String restaurantName='';
  String restaurantImage='';

  Future<void> getRestaurantData(String uid) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection("admin").doc(uid).get();
      if (snapshot.exists) {
        // Document exists, retrieve restaurant data
        Map<String, dynamic> data = snapshot.data()as Map<String, dynamic>;
        // Now you have access to the restaurant data, you can extract the name or other fields as needed
        setState(() {
          restaurantName = data['restaurant']['name'];
          restaurantImage = data['restaurant']['imageURL'];
        });
        print(restaurantName);
      } else {
        print("Document does not exist");
      }
    } catch (e) {
      print("Error getting restaurant data: $e");
    }
  }


  User? user=FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      getRestaurantData(user!.uid.toString());
  }



  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<AdminHomeProvider>(context,listen: false);
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
                      height: ScreenSize.screenHeight(context) * 0.2,
                      boxFit: BoxFit.fill,
                      image: AppImage.foodMenuBG)),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: ScreenSize.screenHeight(context) * 0.065,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10.w,),
                      Text(
                        restaurantName,
                        style: TextStyle(
                            color: AppTheme.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Center(
                    child:CircleAvatar(
                      radius: 60.sp,
                      backgroundImage: NetworkImage(restaurantImage),)
                  )
                ],
              )
            ],
          ),

          Padding(
            padding:   EdgeInsets.symmetric(horizontal: 15.w),
            child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 15.sp,
              crossAxisSpacing: 15.sp,
              crossAxisCount: 2
            ),
                itemCount: provider.homeGridData.length,
                itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>provider.homeGridData[index]['page']));
                },
                child: Material(
                  child: Container(
                    height: 137.h,
                    width: 149.w,
                    decoration: BoxDecoration(
                      color:  provider.homeGridData[index]['color'],
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient:LinearGradient(colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.5)
                        ],
                        begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(provider.homeGridData[index]['icon'],size: 40,color: Colors.white,),

                          Text(provider.homeGridData[index]['title'],
                          style: GoogleFonts.sen(
                            fontSize:14.sp,
                            fontWeight:FontWeight.w700,
                            color:Colors.white
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),

          Padding(
            padding:   EdgeInsets.only(left: 15.w, top: 5.w, bottom: 5.w),
            child: Text("Review & Rating", style: GoogleFonts.sen(
              fontSize:24.sp,
              fontWeight:FontWeight.w700,
              color:Colors.black,
            ),),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:  15.0),
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index){
                return Padding(
                  padding:   EdgeInsets.only(bottom:  10.sp),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: 323.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: AppTheme.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ImageComponent(
                              height: 73.h,
                              width: 75.w,
                              image: AppImage.homeMan),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Justice Life", style: GoogleFonts.inter(
                                fontSize:18.sp,
                                fontWeight:FontWeight.w600,

                              ),),
                              Row(
                                children: [
                                  Icon(Icons.star_border, color: AppTheme.primaryColor,size: 29.sp,),
                                  Icon(Icons.star_border, color: AppTheme.primaryColor,size: 29.sp,),
                                  Icon(Icons.star_border, color: AppTheme.primaryColor,size: 29.sp,),
                                  Icon(Icons.star_border, color: AppTheme.primaryColor,size: 29.sp,),

                                ],
                              ),



                            ],
                          ),


                          Text("12-Feb-2024", style: GoogleFonts.inter(
                            fontSize:10.sp,
                            fontWeight:FontWeight.w700,
                            color:Color(0xff808080)

                          ),),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
