 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SmallTimePicker extends StatelessWidget {
  final TextEditingController timeInput;
  final String hintText;
  final VoidCallback onTap;
   const SmallTimePicker({super.key, required this.timeInput, required this.hintText, required this.onTap});

   @override
   Widget build(BuildContext context) {
     return TextField(

       textAlign: TextAlign.center,
       controller:timeInput ,
       decoration: InputDecoration(
         contentPadding: EdgeInsets.symmetric(horizontal: 3.sp),

         hintText: hintText,
         hintStyle: TextStyle(
             color: Color(0xffBEC5D1)
         ),


         focusedBorder: OutlineInputBorder(
           borderSide: BorderSide(color: Colors.red),
           borderRadius: BorderRadius.circular(10),
         ),

         enabledBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(10),
           borderSide: BorderSide(width: 2, color: Color(0xffBEC5D1)), // Set the border color and width
         ),
       ),

       readOnly: true,  //set it true, so that user will not able to edit text
       onTap: onTap,

     );
   }
 }
