import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sol_solution_food_app/Component/Custem_Text_Field.dart';
import 'package:sol_solution_food_app/Component/CustomContainer.dart';
import 'package:sol_solution_food_app/Component/ElevatedBTN_Component.dart';
import 'package:sol_solution_food_app/Component/Image_Component.dart';
import 'package:sol_solution_food_app/Provider/HomeScreenProvider.dart';
import 'package:sol_solution_food_app/Screens/Account_Setting.dart';
import 'package:sol_solution_food_app/Screens/RatingsAndReviews.dart';
import 'package:sol_solution_food_app/Screens/Restaurant_Menu_Moderate.dart';
import 'package:sol_solution_food_app/Utiles/AppImage.dart';
import 'package:sol_solution_food_app/Utiles/AppStrings.dart';
import 'package:sol_solution_food_app/Utiles/App_Theme.dart';
import 'package:sol_solution_food_app/Utiles/ScreenSize.dart';

import 'FavoriteScreen.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  final searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<homeScreenProvider>(context, listen: false);
    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: [
          Container(
            width: ScreenSize.screenWidth(context) * 1,
            height: ScreenSize.screenHeight(context) * 0.33,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(AppImage.homeCurve)),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: ScreenSize.screenHeight(context) * 0.08),
                  child: Container(
                    width: ScreenSize.screenWidth(context) * 0.85,
                    height: ScreenSize.screenHeight(context) * 0.09,
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenSize.screenWidth(context) * 0.04,
                          vertical: ScreenSize.screenWidth(context) * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: ScreenSize.screenWidth(context) * 0.4,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          _scaffoldKey.currentState!
                                              .openDrawer();
                                        },
                                        child: ImageComponent(
                                            image: AppImage.homeMenu)),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          AppStrings.deliverT0,
                                          style: AppTheme.homeDeliver(context),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              AppStrings.helalLabOffice,
                                              style:
                                                  AppTheme.halalStyle(context),
                                            ),
                                            Icon(Icons.arrow_drop_down)
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    AppStrings.hayLeo,
                                    style: AppTheme.bodyStyle(context),
                                  ),
                                  Text(
                                    AppStrings.goodAfternoon,
                                    style: AppTheme.goodafternoon(context),
                                  ),
                                ],
                              )
                            ],
                          ),
                          ImageComponent(image: AppImage.homeMan)
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: ScreenSize.screenHeight(context) * 0.025),
                  child: SizedBox(
                    width: ScreenSize.screenWidth(context) * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          ScreenSize.screenHeight(context) * 0.5),
                      child: CustomTextField(
                          radius: 60,
                          prefixIcon: Icon(Icons.search),
                          fillColor: AppTheme.white,
                          controller: searchController,
                          hintText: AppStrings.homeSearch),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: ScreenSize.screenHeight(context) * 0.67,
            color: AppTheme.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.all(ScreenSize.screenWidth(context) * 0.015),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.allCategories,
                        style: AppTheme.bodyStyle(context),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.seeAll,
                            style: AppTheme.bodyStyle(context),
                          ),
                          SizedBox(
                            width: ScreenSize.screenWidth(context) * 0.01,
                          ),
                          Icon(
                            Icons.arrow_back_ios,
                            size: ScreenSize.screenWidth(context) * 0.04,
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: ScreenSize.screenWidth(context) * 0.04,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Material(
                    elevation: 5,
                    color: AppTheme.lightGrey,
                    child: SizedBox(
                      height: ScreenSize.screenHeight(context) * 0.08,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: ScreenSize.screenWidth(context) * 0.4,
                                child: Consumer<homeScreenProvider>(
                                  builder: (context, value, child) {
                                    return GestureDetector(
                                      onTap: () {
                                        value.setColor(index);
                                      },
                                      child: CustomContainer(
                                        radius: 50,
                                        color: value.selectedIndex == index
                                            ? AppTheme.primaryColor
                                            : AppTheme.white,
                                        widget: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  ScreenSize.screenWidth(
                                                          context) *
                                                      0.02),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ImageComponent(
                                                image: AppImage.homeMan,
                                                height: ScreenSize.screenHeight(
                                                        context) *
                                                    0.05,
                                              ),
                                              Text(
                                                "Product ${index + 1}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        value.selectedIndex ==
                                                                index
                                                            ? AppTheme.white
                                                            : AppTheme.black),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          }),
                    )),
                Padding(
                  padding:
                      EdgeInsets.all(ScreenSize.screenHeight(context) * 0.01),
                  child: Text(
                    AppStrings.recommendedForYou,
                    style: AppTheme.headlineStyle(context),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(
                              ScreenSize.screenHeight(context) * 0.01),
                          child: Material(
                            elevation: 5,
                            child: CustomContainer(
                              color: AppTheme.white,
                              widget: Padding(
                                padding: EdgeInsets.all(
                                    ScreenSize.screenWidth(context) * 0.02),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ImageComponent(
                                          image: AppImage.restaurant,
                                          boxFit: BoxFit.fill,
                                          height:
                                              ScreenSize.screenHeight(context) *
                                                  0.1,
                                        ),
                                        SizedBox(
                                          height:
                                              ScreenSize.screenHeight(context) *
                                                  0.1,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Le Couno Restaurants",
                                                style:
                                                    AppTheme.lightHeadlineStyle(
                                                        context),
                                              ),
                                              Text(
                                                "Burger-Chicken-Riche-Wings",
                                                style:
                                                    AppTheme.bodyStyle(context),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Open : ",
                                              style: AppTheme.goodafternoon(
                                                  context),
                                            ),
                                            Text(
                                              "12:00 PM",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Close : ",
                                              style: AppTheme.goodafternoon(
                                                  context),
                                            ),
                                            Text(
                                              "12:00 PM",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: AppTheme.primaryColor),
                                            )
                                          ],
                                        ),
                                        Icon(
                                          Icons.favorite_outline,
                                          color: AppTheme.primaryColor,
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left:
                                              ScreenSize.screenWidth(context) *
                                                  0.04,
                                          bottom:
                                              ScreenSize.screenWidth(context) *
                                                  0.02,
                                          top: ScreenSize.screenWidth(context) *
                                              0.01),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star_border_purple500,
                                            color: AppTheme.primaryColor,
                                          ),
                                          SizedBox(
                                            width: ScreenSize.screenWidth(
                                                    context) *
                                                0.02,
                                          ),
                                          Text(
                                            "4.7",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          height:
                                              ScreenSize.screenHeight(context) *
                                                  0.055,
                                          width:
                                              ScreenSize.screenWidth(context) *
                                                  0.3,
                                          child: ElevatedBTN_Component(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          RestaurantMenuModerate()));
                                            },
                                            widget: Text("Moderate"),
                                            bgColor: AppTheme.white,
                                            fgColor: AppTheme.primaryColor,
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              ScreenSize.screenHeight(context) *
                                                  0.055,
                                          width:
                                              ScreenSize.screenWidth(context) *
                                                  0.33,
                                          child: ElevatedBTN_Component(
                                            onPressed: () {},
                                            widget: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text("View Menu"),
                                                Icon(
                                                  Icons.book_outlined,
                                                  color: AppTheme.white,
                                                )
                                              ],
                                            ),
                                            bgColor: AppTheme.primaryColor,
                                            fgColor: AppTheme.white,
                                          ),
                                        ),
                                        ImageComponent(image: AppImage.arrowBTN)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: ScreenSize.screenHeight(context) * 0.3,
              child: Stack(
                children: [
                  ImageComponent(
                    image: AppImage.scaffoldStart,
                    boxFit: BoxFit.cover,
                    width: ScreenSize.screenWidth(context),
                  ),
                  Positioned(
                    bottom: ScreenSize.screenHeight(context) * 0.02,
                    child: SizedBox(
                      width: ScreenSize.screenWidth(context) * 0.75,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageComponent(
                            image: AppImage.homeMan,
                            boxFit: BoxFit.cover,
                            height: ScreenSize.screenHeight(context) * 0.14,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  "Justice Life",
                  style: AppTheme.lightHeadlineStyle(context),
                ),
                Text(
                  "Justice@justice.life",
                  style: AppTheme.bodyStyle(context),
                )
              ],
            ),
            SizedBox(
              height: ScreenSize.screenWidth(context) * 0.06,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.screenWidth(context) * 0.045),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(
                    ScreenSize.screenWidth(context) * 0.04),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountSettingScreen()));
                  },
                  leading: Icon(Icons.person),
                  title: Text(
                    AppStrings.accountSetting,
                    style: AppTheme.bodyStyle(context),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: ScreenSize.screenWidth(context) * 0.07,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenSize.screenWidth(context) * 0.04),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(
                    ScreenSize.screenWidth(context) * 0.045),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.language),
                      title: Text(
                        AppStrings.language,
                        style: AppTheme.bodyStyle(context),
                      ),
                    ),
                    ListTile(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>FavoriteScreen()));
                      },
                      leading: Icon(Icons.favorite),
                      title: Text(
                        "Favorite",
                        style: AppTheme.bodyStyle(context),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.message),
                      title: Text(
                        AppStrings.feedBack,
                        style: AppTheme.bodyStyle(context),
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RatingsAndReviews()));
                      },
                      leading: Icon(Icons.star_half_rounded),
                      title: Text(
                        AppStrings.rateUs,
                        style: AppTheme.bodyStyle(context),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.arrow_circle_up_outlined),
                      title: Text(
                        AppStrings.newVersion,
                        style: AppTheme.bodyStyle(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
