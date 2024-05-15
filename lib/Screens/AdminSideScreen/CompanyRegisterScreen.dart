import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:sol_solution_food_app/Component/ElevatedBTN_Component.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sol_solution_food_app/Component/SmallTextForm.dart';
import 'package:sol_solution_food_app/Screens/AdminSideScreen/Model/Restaurant_Model.dart';
import '../../Component/Custem_Text_Field.dart';
import '../../Component/Image_Component.dart';
import '../../Utiles/AppImage.dart';
import '../../Utiles/App_Theme.dart';
import '../../Utiles/ScreenSize.dart';
import 'BottomNavBar.dart';

class CompanyRegisterScreen extends StatefulWidget {
    CompanyRegisterScreen({super.key});

  @override
  State<CompanyRegisterScreen> createState() => _CompanyRegisterScreenState();
}

class _CompanyRegisterScreenState extends State<CompanyRegisterScreen> {

  TextEditingController openingController = TextEditingController();
  TextEditingController closingController = TextEditingController();
  //text editing controller for text field

  @override
  void initState() {
    openingController.text = ""; //set the initial value of text field
    closingController.text = ""; //set the initial value of text field
    super.initState();
  }


  final nameController=TextEditingController();
  final cuisineController=TextEditingController();
  final locationController=TextEditingController();
  final descriptionController=TextEditingController();
  FirebaseAuth _auth=FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null)  {
        _imageFile =  File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }



  Future<void> restaurantDataCollection() async {
    User? user = await _auth.currentUser;

    if (user != null) {
      String uid = user.uid;
      String? email=await user.email;
      try {
        if (_imageFile != null) {
          // Upload image to Firebase Storage
          Reference storageReference = FirebaseStorage.instance.ref().child('images/${DateTime.now().toString()}');
          UploadTask uploadTask = storageReference.putFile(_imageFile!);

          // Await upload task completion
          await uploadTask;

          // Get image download URL
          String imageURL = await storageReference.getDownloadURL();

          Restaurant restaurant = Restaurant(
            name: nameController.text,
            cuisine: cuisineController.text,
            location: locationController.text,
            description: descriptionController.text,
            imageURL: imageURL,
            openingTime: openingController.text,
            closingTime: closingController.text,
          );

          await _firestore.collection("admin").doc(uid).set({"restaurant": restaurant.toMap()}, SetOptions(merge: true));
          Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigationBarScreen()));

          print('Collection created for user with UID: $uid');
        } else {
          print('No image selected.');
        }
      } catch (e) {
        print('Error creating collection: $e');
      }
    } else {
      print('User is not authenticated.');
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                    width: ScreenSize.screenWidth(context),
                    child: ImageComponent(
                        height: 100.h,
                        boxFit: BoxFit.fill,
                        image: AppImage.foodMenuBG)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35.h,
                    ),
        
        
        
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Company Register Screen",
            style: GoogleFonts.sen(
            textStyle: TextStyle(color: AppTheme.white,fontWeight: FontWeight.w700, fontSize: 20.sp),
            ),
                          ),
        
        
        
        
                          ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: _pickImage,
                        child: ImageComponent(
                          width: 103.w,
                            height: 93.h,
                          image:  AppImage.uploadImage,
                        ),
                      ),
        
                      Text("Upload Image", style: GoogleFonts.sen(
                        textStyle:TextStyle(fontSize: 14.sp,
                          color: Color(0xff808080),
                          fontWeight: FontWeight.w400,)
                      ),),
                    ],
                  ),
                  ],
                )
              ],
            ),
        
            Padding(
              padding:   EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: ScreenSize.screenWidth(
                                    context) *
                                    0.03),
                            child: Text(
                              "Restaurant Name",
                              style:
                              AppTheme.CustemlableStyle(
                                  context),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize.screenHeight(
                                context) *
                                0.01,
                          ),
                          CustomTextField(
                              controller: nameController,
                              hintText: "Restaurant Name"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: ScreenSize.screenWidth(
                                    context) *
                                    0.03),
                            child: Text(
                              "Restaurant Cuisine",
                              style:
                              AppTheme.CustemlableStyle(
                                  context),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize.screenHeight(
                                context) *
                                0.01,
                          ),
                          CustomTextField(
                              controller: cuisineController,
                              hintText: "Restaurant Cuisine"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: ScreenSize.screenWidth(
                                    context) *
                                    0.03),
                            child: Text(
                              "Location",
                              style:
                              AppTheme.CustemlableStyle(
                                  context),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize.screenHeight(
                                context) *
                                0.01,
                          ),
                          CustomTextField(
                              controller: locationController,
                              hintText: "Location"),
                        ],
                      ),
                      Column(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: ScreenSize.screenWidth(
                                    context) *
                                    0.03),
                            child: Text(
                              "Description",
                              style:
                              AppTheme.CustemlableStyle(
                                  context),
                            ),
                          ),
                          SizedBox(
                            height: ScreenSize.screenHeight(
                                context) *
                                0.01,
                          ),
                          CustomTextField(
                            maxLine: 3,
                              controller: descriptionController,
                              hintText: "Write Description"),
                        ],
                      ),
                              
                      Text(
                        "Opening Hour",
                        style:GoogleFonts.inter(
                          textStyle:TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                            color: Color(0xff9CA3AF),
                          )
                        )
                              
                      ),
                              
                      SizedBox(
                        height: 10.h,
                      ),
                              
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          Row(
                            children: [
                              Text(
                                  "Opening",
                                  style:GoogleFonts.inter(
                                      textStyle:TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        color: Color(0xff000000),
                                      )
                                  )

                              ),
                              SizedBox(
                                width: 5.w,
                              ),

                              SizedBox(
                                height: 35,
                                width: 100,
                                child: SmallTimePicker(timeInput: openingController, hintText: "12:00 PM",
                                    onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    initialTime: TimeOfDay.now(),
                                    context: context,
                                  );

                                  if (pickedTime != null) {
                                    print(pickedTime.format(context)); // Output: 10:51 PM

                                    // Construct DateTime object using today's date and the selected time
                                    DateTime parsedTime = DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      pickedTime.hour,
                                      pickedTime.minute,
                                    );

                                    // Format the DateTime object
                                    String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);

                                    setState(() {
                                      openingController.text = formattedTime; // Set the value of text field.
                                      print("Time selected: $formattedTime");
                                    });
                                  } else {
                                    print("Time is not selected");
                                  }
                                }),
                              )


                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  "Closed",
                                  style:GoogleFonts.inter(
                                      textStyle:TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        color: Color(0xff000000),
                                      )
                                  )

                              ),
                              SizedBox(
                                width: 5.w,
                              ),

                              SizedBox(
                                height: 35,
                                width: 100,
                                child: SmallTimePicker(timeInput: closingController, hintText: "12:00 AM",
                                    onTap: () async {
                                  TimeOfDay? pickedTime = await showTimePicker(
                                    initialTime: TimeOfDay.now(),
                                    context: context,
                                  );

                                  if (pickedTime != null) {
                                    print(pickedTime.format(context)); // Output: 10:51 PM

                                    // Construct DateTime object using today's date and the selected time
                                    DateTime parsedTime = DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      pickedTime.hour,
                                      pickedTime.minute,
                                    );

                                    // Format the DateTime object
                                    String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);

                                    setState(() {
                                      closingController.text = formattedTime; // Set the value of text field.
                                      print("Time selected: $formattedTime");
                                    });
                                  } else {
                                    print("Time is not selected");
                                  }
                                }),
                              )


                            ],
                          ),
                        ],
                      ),
                              
                              
                    ],
                  ),
                  SizedBox(height: 30.h,),
                  ElevatedBTN_Component(onPressed: ( )async{
                    await restaurantDataCollection();
                  },
                      radius: 10,
              
                      bgColor: AppTheme.primaryColor,
                      fgColor: AppTheme.white,
                      widget: Text("Register Restaurant", style: GoogleFonts.inter(
                        textStyle:TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700
                        )
                      ),))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
