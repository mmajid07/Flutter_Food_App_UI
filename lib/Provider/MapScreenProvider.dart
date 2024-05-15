// import 'package:flutter/material.dart';
// import 'package:location/location.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class MapScreenProvider with ChangeNotifier{
//   GoogleMapController? googleMapController;
//   Location location=Location();
//   Set<Marker> markers={};
//
//   Future<void> getLocation()async{
//     final userLocation=await location.getLocation();
//     markers.add(Marker(
//         markerId: MarkerId('marker1'),
//         position: LatLng(userLocation.latitude!, userLocation.longitude!)
//     ));
//   }
//
//   void onMapCreate(GoogleMapController controller)async{
//     googleMapController=controller;
//     await getLocation();
//     notifyListeners();
//   }
//
//   void moveToCurrentLocation() async {
//    // LocationData? currentLocation;
//     try {
//     //  currentLocation = await location.getLocation();
//     } catch (e) {
//       print('Error getting current location: $e');
//     }
//     if (currentLocation != null) {
//
//       googleMapController?.animateCamera(CameraUpdate.newLatLng(
//           LatLng(currentLocation.latitude!, currentLocation.longitude!)));
//     }
//   }
//
//   Set<Polyline> generatePolyline(LatLng start, LatLng end) {
//     return {
//       Polyline(
//         polylineId: PolylineId('route1'),
//         points: [start, end],
//         color: Colors.blue,
//         width: 4,
//       ),
//     };
//   }
//
//
// }