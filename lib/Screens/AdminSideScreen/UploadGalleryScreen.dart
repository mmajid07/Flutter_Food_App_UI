import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sol_solution_food_app/Screens/AdminSideScreen/Model/GalleryModel.dart';
import 'package:sol_solution_food_app/Screens/AdminSideScreen/Model/Restaurant_Menu_Model.dart';
import '../../Component/ElevatedBTN_Component.dart';
import '../../Component/Image_Component.dart';
import '../../Utiles/AppImage.dart';
import '../../Utiles/App_Theme.dart';
import '../../Utiles/ScreenSize.dart';

class UploadGalleryScreen extends StatefulWidget {
  const UploadGalleryScreen({super.key});

  @override
  State<UploadGalleryScreen> createState() => _UploadGalleryScreenState();
}

class _UploadGalleryScreenState extends State<UploadGalleryScreen> {

  FirebaseFirestore _firestore=FirebaseFirestore.instance;
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

  Future<void> uploadMenuImage()async {
    User? user=await FirebaseAuth.instance.currentUser;

    String? uid= await user!.uid;
    if(user !=null){
      try{
        if(_imageFile!=null){
          Reference storageReference =FirebaseStorage.instance.ref().child("GalleryImages/${Timestamp.now()}");
          UploadTask uploadTask=  storageReference.putFile(_imageFile!);
          await uploadTask;
          String imageUrl= await storageReference.getDownloadURL();
          String month=_getMonthName(DateTime.now().month);
          GalleryModel galleryModel=GalleryModel(
              galleryImage: imageUrl.toString()  ,
              id: DateTime.now().toString() ,

          );

          await _firestore.collection("admin").doc(uid).collection("galleryImage").add({
            "galleryPost" : galleryModel.toMap()
          }).then((value) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Gallery Uploaded Successfull")));
            Navigator.pop(context);
          });
        }else{
          print("Failed Picked Image");
        }

      }catch(e){
        throw Exception(e.toString());
      }


    }
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
                      height: 135.h,
                      boxFit: BoxFit.fill,
                      image: AppImage.foodMenuBG)),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 47.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ImageComponent(image: AppImage.backButton),

                      Text(
                        "Ambiance Gallery",
                        style: TextStyle(
                            color: AppTheme.white,
                            fontWeight: FontWeight.bold,
                            fontSize:
                            ScreenSize.screenHeight(context) * 0.02),
                      ),

                      ImageComponent(image: AppImage.homeMenu)

                    ],
                  ),

                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


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
                          SizedBox(),
                          SizedBox(
                              width: 57.w,
                              height: 45.h,
                              child:  ImageComponent(image: AppImage.upload_Cloud,
                                boxFit: BoxFit.fill,
                              )),

                          GestureDetector(
                            onTap: (){
                              _pickImage();
                            },
                            child: RichText(
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
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  SizedBox(
                      height: 45.h,
                      width: 240.w,
                      child: ElevatedBTN_Component(
                          bgColor: AppTheme.primaryColor,
                          onPressed: ( ){
                            uploadMenuImage();
                          }, widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("SUBSCRIPTION",
                            style: GoogleFonts.mulish(
                                fontSize:14.sp,
                                fontWeight:FontWeight.w700,
                                color:AppTheme.white
                            ),
                          ),
                          SizedBox(width: 5,),
                          Icon(Icons.lock, size: 22,color: AppTheme.white,)
                        ],
                      )))
                ],
              ),



              SizedBox(),
            ],
          ),
        ],
      ),
    );
  }

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}
