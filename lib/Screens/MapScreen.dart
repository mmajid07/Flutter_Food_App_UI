import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sol_solution_food_app/Component/Custem_Text_Field.dart';
import 'package:sol_solution_food_app/Component/ElevatedBTN_Component.dart';
import 'package:sol_solution_food_app/Component/Image_Component.dart';
import 'package:sol_solution_food_app/Provider/MapScreenProvider.dart';
import 'package:sol_solution_food_app/Screens/HomeScreen.dart';
import 'package:sol_solution_food_app/Utiles/AppImage.dart';
import 'package:sol_solution_food_app/Utiles/AppStrings.dart';
import 'package:sol_solution_food_app/Utiles/ScreenSize.dart';
import 'package:provider/provider.dart';
import '../Utiles/App_Theme.dart';

class mapScreen extends StatefulWidget {
  const mapScreen({super.key});

  @override
  State<mapScreen> createState() => _mapScreenState();
}

class _mapScreenState extends State<mapScreen> {
  final searchController = TextEditingController();

  LatLng startLocation = LatLng(37.7749, -122.4194);
  LatLng endLocation = LatLng(37.7896, -122.4300);


  @override
  Widget build(BuildContext context) {
    //final provider=Provider.of<MapScreenProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(37.7749, -122.4194),
                zoom: 12,
              ),
              //markers: provider.markers,
              mapType: MapType.satellite,
              //onMapCreated: provider.onMapCreate,
              compassEnabled: true,
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              //polylines: provider.generatePolyline(startLocation, endLocation),
               
            ),
            Positioned(
              bottom: 130,
              right: 10,
              child: FloatingActionButton(
                onPressed: (){},//provider.moveToCurrentLocation, // Call method to handle location button press
                child: Icon(Icons.location_on, size: 30.sp,color: AppTheme.primaryColor,),
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                  EdgeInsets.all(ScreenSize.screenHeight(context) * 0.02),
                  child: CustomTextField(
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppTheme.black,
                      size: ScreenSize.screenHeight(context) * 0.04,
                    ),
                    suffix: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(AppImage.homeMan),
                      ),
                    ),
                    controller: searchController,
                    fillColor: AppTheme.white,
                    hintText: AppStrings.searchHint,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: ScreenSize.screenHeight(context) * 0.02),
                  child: ElevatedBTN_Component(
                    bgColor: AppTheme.primaryColor,
                    fgColor: AppTheme.white,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    widget: Text(AppStrings.continueBTN),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
