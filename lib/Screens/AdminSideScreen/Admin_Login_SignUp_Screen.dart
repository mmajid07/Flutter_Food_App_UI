import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sol_solution_food_app/Component/Custem_Text_Field.dart';
import 'package:sol_solution_food_app/Component/ElevatedBTN_Component.dart';
import 'package:sol_solution_food_app/Component/Image_Component.dart';
import 'package:sol_solution_food_app/Component/Text_Component.dart';
import 'package:sol_solution_food_app/Provider/LoginSignUp_Provider.dart';
import 'package:sol_solution_food_app/Screens/AdminSideScreen/Auth_Service/Auth_Service.dart';
import 'package:sol_solution_food_app/Screens/AdminSideScreen/Auth_Service/FormValidation.dart';
import 'package:sol_solution_food_app/Screens/AdminSideScreen/BottomNavBar.dart';
import 'package:sol_solution_food_app/Screens/AdminSideScreen/CompanyRegisterScreen.dart';
import 'package:sol_solution_food_app/Screens/AdminSideScreen/Model/adminDetailModel.dart';
import 'package:sol_solution_food_app/Utiles/AppImage.dart';
import 'package:sol_solution_food_app/Utiles/AppStrings.dart';
import 'package:sol_solution_food_app/Utiles/App_Theme.dart';
import 'package:sol_solution_food_app/Utiles/ScreenSize.dart';

class AdminLoginSignUpScreen extends StatefulWidget {
  const AdminLoginSignUpScreen({Key? key});

  @override
  State<AdminLoginSignUpScreen> createState() => _AdminLoginSignUpScreenState();
}

class _AdminLoginSignUpScreenState extends State<AdminLoginSignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FirebaseFirestore firestore=FirebaseFirestore.instance;

  final _formKey=GlobalKey<FormState>();

  Future<void> saveAdminDetail(String uid)async{

    try{
      AdminDetail adminDetail=AdminDetail(email: emailController.text, password: passwordController.text);

      await firestore.collection("admin").doc(uid).set({
        "adminDetail": adminDetail.toMap()
      },SetOptions(merge:true));
    }catch(e){
      throw Exception("Error $e");
    }

  }


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginSignUpProvider>(context, listen: false);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImage.bg_image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Opacity(
            opacity: 0.6,
            child: Container(
              color: AppTheme.black,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: ScreenSize.screenHeight(context) * 0.5,
                ),
                Container(
                  height: ScreenSize.screenHeight(context) *0.5,
                  width: ScreenSize.screenWidth(context) * 1,
                  decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      SizedBox(
                          height: ScreenSize.screenHeight(context) * 0.015),
                      SizedBox(
                        width: ScreenSize.screenWidth(context) * 0.2,
                        child: Divider(
                          thickness: 5,
                        ),
                      ),
                      SizedBox(
                          height: ScreenSize.screenHeight(context) * 0.015),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              provider.setCreateAccount();
                              print("Value of is Check" +
                                  provider.isCreate_Account.toString());
                            },
                            child: Consumer<LoginSignUpProvider>(
                              builder: (context, value, child) {
                                return Column(
                                  children: [
                                    Text(
                                      AppStrings.create_Account,
                                      style: TextStyle(
                                          fontSize:
                                              ScreenSize.screenHeight(context) *
                                                  0.02,
                                          color: value.isCreate_Account
                                              ? AppTheme.primaryColor
                                              : AppTheme.secandryColor),
                                    ),
                                    value.isCreate_Account
                                        ? SizedBox(
                                            width: ScreenSize.screenWidth(
                                                    context) *
                                                0.3,
                                            child: Divider(
                                                thickness: 3,
                                                color: value.isCreate_Account
                                                    ? AppTheme.primaryColor
                                                    : AppTheme.secandryColor))
                                        : SizedBox(
                                            width: ScreenSize.screenWidth(
                                                    context) *
                                                0.3,
                                            child: Divider(
                                                thickness: 3,
                                                color: Colors.transparent)),
                                  ],
                                );
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: (() {
                              provider.Login();
                            }),
                            child: Consumer<LoginSignUpProvider>(
                              builder: (context, value, child) {
                                return Column(
                                  children: [
                                    Text(
                                      AppStrings.login,
                                      style: TextStyle(
                                          fontSize:
                                              ScreenSize.screenHeight(context) *
                                                  0.02,
                                          color: value.isCreate_Account
                                              ? AppTheme.secandryColor
                                              : AppTheme.primaryColor),
                                    ),
                                    value.isCreate_Account
                                        ? SizedBox(
                                            width: ScreenSize.screenWidth(
                                                    context) *
                                                0.08,
                                            child: Divider(
                                                thickness: 3,
                                                color: Colors.transparent))
                                        : SizedBox(
                                            width: ScreenSize.screenWidth(
                                                    context) *
                                                0.1,
                                            child: Divider(
                                              thickness: 3,
                                              color: value.isCreate_Account
                                                  ? AppTheme.secandryColor
                                                  : AppTheme.primaryColor,
                                            )),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Consumer<LoginSignUpProvider>(
                          builder: (context, value, child) {
                            return value.isCreate_Account
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            ScreenSize.screenWidth(context) *
                                                0.06),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Form(
                                            key: _formKey,
                                            child: Column(
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
                                                    AppStrings.email,
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
                                                  validate: Validator.validateEmail,
                                                    controller: emailController,
                                                    hintText: AppStrings.email),
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
                                                    AppStrings.password,
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
                                                  validate: Validator.validatePassword,
                                                  controller: passwordController,
                                                  hintText: AppStrings.password,
                                                  obscureText: true,
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),

                                        ElevatedBTN_Component(
                                          onPressed: () async{
                                            if(_formKey.currentState!.validate()){
                                              FirebaseAuth auth=FirebaseAuth.instance;
                                              User? user=auth.currentUser;
                                              String uid= user!.uid;
                                              await saveAdminDetail(uid);
                                              final message = await AuthService().registration(
                                                email: emailController.text,
                                                password: passwordController.text,
                                              );
                                              if (message!.contains('Success')) {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    content: Text("Successfully Registered"),
                                                  ),
                                                );
                                              }
                                            }


                                          },
                                          widget: Text(AppStrings.register),
                                          bgColor: AppTheme.primaryColor,
                                          fgColor: AppTheme.white,
                                        ),
                                        ElevatedBTN_Component(
                                          onPressed: () {},
                                          widget: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ImageComponent(
                                                image: AppImage.ic_Google,
                                                height: ScreenSize.screenHeight(
                                                        context) *
                                                    0.02,
                                              ),
                                              SizedBox(
                                                  width: ScreenSize.screenWidth(
                                                          context) *
                                                      0.04),
                                              Text(AppStrings.signInWithGoogle),
                                            ],
                                          ),
                                          bgColor: Color(0xffF4F4F4),
                                          fgColor: AppTheme.black,
                                        )
                                      ],
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            ScreenSize.screenWidth(context) *
                                                0.06),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Form(
                                            key: _formKey,
                                            child: Column(
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
                                                        AppStrings.email,
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
                                                      validate: Validator.validateEmail,
                                                        controller: emailController,
                                                        hintText: AppStrings.email),
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
                                                        AppStrings.password,
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
                                                      validate: Validator.validatePassword,
                                                      controller: passwordController,
                                                      hintText: AppStrings.password,
                                                      obscureText: true,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                        GestureDetector(
                                            onTap: () {},
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: TextComponent(
                                                  text:
                                                      AppStrings.forgotPassword,
                                                  textStyle:TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12.sp,
                                                    color: AppTheme.primaryColor
                                                  )
                                                       ),
                                            )),
                                        ElevatedBTN_Component(
                                          radius: 10,
                                          onPressed: () async{
                                            if(_formKey.currentState!.validate()){
                                              try {
                                                User? user = FirebaseAuth.instance.currentUser;
                                                if (user != null) {
                                                  String? uid = user.uid;
                                                  if (uid != null) {
                                                    DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection("admin").doc(uid).get();

                                                    final message = await AuthService().login(
                                                      email: emailController.text,
                                                      password: passwordController.text,
                                                    );

                                                    if (message!.contains('Success')) {
                                                      if (snapshot.exists) {
                                                        Navigator.of(context).pushReplacement(
                                                          MaterialPageRoute(builder: (context) => BottomNavigationBarScreen()),
                                                        );
                                                      } else {
                                                        Navigator.of(context).pushReplacement(
                                                          MaterialPageRoute(builder: (context) => CompanyRegisterScreen()),
                                                        );
                                                      }
                                                    }

                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        content: Text(message!),
                                                      ),
                                                    );
                                                  } else {
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        content: Text("User email is null"),
                                                      ),
                                                    );
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text("User is not authenticated"),
                                                    ),
                                                  );
                                                }
                                              } catch (e) {
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                  SnackBar(
                                                    content: Text("Error: $e"),
                                                  ),
                                                );
                                              }
                                            }

                                          },
                                          widget: Text(AppStrings.login),
                                          bgColor: AppTheme.primaryColor,
                                          fgColor: AppTheme.white,
                                        ),

                                        ElevatedBTN_Component(
                                          radius: 10,
                                          onPressed: () {},
                                          widget: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ImageComponent(
                                                image: AppImage.ic_Google,
                                                height: ScreenSize.screenHeight(
                                                        context) *
                                                    0.02,
                                              ),
                                              SizedBox(
                                                  width: ScreenSize.screenWidth(
                                                          context) *
                                                      0.04),
                                              Text(AppStrings.signInWithGoogle),
                                            ],
                                          ),
                                          bgColor: Color(0xffF4F4F4),
                                          fgColor: AppTheme.black,
                                        )
                                      ],
                                    ),
                                  );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
