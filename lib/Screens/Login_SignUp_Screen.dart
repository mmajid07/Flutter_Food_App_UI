import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sol_solution_food_app/Component/Custem_Text_Field.dart';
import 'package:sol_solution_food_app/Component/ElevatedBTN_Component.dart';
import 'package:sol_solution_food_app/Component/Image_Component.dart';
import 'package:sol_solution_food_app/Component/Text_Component.dart';
import 'package:sol_solution_food_app/Provider/LoginSignUp_Provider.dart';
import 'package:sol_solution_food_app/Screens/MapScreen.dart';
import 'package:sol_solution_food_app/Utiles/AppImage.dart';
import 'package:sol_solution_food_app/Utiles/AppStrings.dart';
import 'package:sol_solution_food_app/Utiles/App_Theme.dart';
import 'package:sol_solution_food_app/Utiles/ScreenSize.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({Key? key});

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                  height: ScreenSize.screenHeight(context) * 0.35,
                ),
                Container(
                  height: ScreenSize.screenHeight(context) *
                      (provider.isCreate_Account ? 0.65 : 0.6),
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
                                                AppStrings.fullName,
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
                                                hintText: AppStrings.fullName),
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
                                              controller: passwordController,
                                              hintText: AppStrings.password,
                                              obscureText: true,
                                            ),
                                          ],
                                        ),
                                        ElevatedBTN_Component(
                                          onPressed: () {},
                                          widget: Text(AppStrings.register),
                                          bgColor: AppTheme.primaryColor,
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
                                          bgColor: AppTheme.lightGrey,
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
                                              controller: passwordController,
                                              hintText: AppStrings.password,
                                              obscureText: true,
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                            onTap: () {},
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: TextComponent(
                                                  text:
                                                      AppStrings.forgotPassword,
                                                  textStyle:
                                                      AppTheme.buttonStyle(
                                                          context)),
                                            )),
                                        ElevatedBTN_Component(
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        mapScreen()));
                                          },
                                          widget: Text(AppStrings.login),
                                          bgColor: AppTheme.primaryColor,
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
                                          bgColor: AppTheme.lightGrey,
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
