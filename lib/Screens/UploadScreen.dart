import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:sol_solution_food_app/Component/ElevatedBTN_Component.dart';
import 'package:sol_solution_food_app/Component/Image_Component.dart';

import '../Utiles/AppImage.dart';
import '../Utiles/App_Theme.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text("Upoload", style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400
              ),),
            ),

            Column(
              children: [
                DottedBorder(
                  color: AppTheme.lightGrey,
                  strokeWidth: 2,
                  strokeCap: StrokeCap.butt,
                  child: Container(
                    width: 342.w,
                    height: 298.h,
                    decoration:const BoxDecoration(
                      color: Color(0xffF8F8FF),
                       
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                            width: 57.w,
                            height: 45.h,
                            child:  ImageComponent(image: AppImage.upload_Cloud,
                            boxFit: BoxFit.fill,
                            )),
                        
                        RichText(
                            text:  TextSpan(
                              text: "Drag and drop file or",
                              style: TextStyle(
                                color: AppTheme.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                              ),
                              children: [
                                TextSpan(
                                  text: " Browse",
                                  style: TextStyle(
                                     decoration: TextDecoration.underline,
                                    color: AppTheme.primaryColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ]
                            ),
                        ),

                        SizedBox(
                          height: 48.h,
                          width: 223.w,
                          child: Text("Supported formates: JPEG, PNG, GIF, MP4, PDF, PSD, AI, Word, PPT",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                            color: AppTheme.secandryColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp
                          ),),
                        ),

                        SizedBox(),
                        SizedBox(),
                        SizedBox(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30.h,),
                SizedBox(
                    height: 45.h,
                    width: 240.w,
                    child: ElevatedBTN_Component(onPressed: ( ){}, widget: Text("UPLOAD FILES")))
              ],
            ),
            
            

            SizedBox(),
          ],
        ),
      ),
    );
  }
}
