

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/function/statusRequest.dart';
import '../../model&widget/widget/loginWidget/bottom.dart';
import '../../model&widget/widget/loginWidget/dialogWidget.dart';

abstract class MapsController extends GetxController {
 Future geoLocationServices (BuildContext context);
  getPermission();
  getPosition();
  functionRequestPermission();
}

class ControllerMaps extends MapsController {
  Set<Marker> myMarkers = {
    Marker(markerId: const MarkerId('1'),
        infoWindow: const InfoWindow(title: 'AlFardos Store'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
        //location stor
        position: const LatLng(26.155536, 32.726188)),

  };
  StatusRequest? statusRequest;
  late bool services;
  late LocationPermission locationPermission;
  late Position position;
  late double userLatitude;
  late double userLongitude;
  double? choiceUserLatitude;
  double? choiceUserLongitude;

  bool userPosition = false;

  @override
  functionRequestPermission() async {
    locationPermission = await Geolocator.requestPermission();
    if (locationPermission == LocationPermission.always ||
        locationPermission == LocationPermission.whileInUse) {
      update();
      return getPosition();
    } else {
      update();
      print('userpositon ========================== ${userPosition}');
      return userPosition;
    }
  }

  @override
  geoLocationServices(BuildContext context) async {
    statusRequest = StatusRequest.loading;
    update();
    services = await Geolocator.isLocationServiceEnabled();
    print(services);
    if (services == false) {
      statusRequest = StatusRequest.success;
      update();
      return
        widgetDialog(nameImage: 'images/logo.jpg',
          context: context,
          textBody: 'Please activate the location service to add the address and enjoy the services',
          textTitle: 'Activate the location service ',
          widget: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.07,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.30,
                  child: CustombButton('Ok', () async {
                    Navigator.of(context).pop();
                    // controller.Nextpage();

                  }, 6),
                ),
              ],
            ),
          ),);
    } else {
      update();
      return await getPermission();
    }
  }

  @override
  getPermission() async {
    print(' Getpermission 2222222222222222222222222222222222');
    locationPermission = await Geolocator.checkPermission();
    print(locationPermission);
    if (locationPermission == LocationPermission.denied ||
        locationPermission == LocationPermission.deniedForever) {
      update();
      statusRequest = StatusRequest.success;
      update();
      return await functionRequestPermission();
    } else if (locationPermission == LocationPermission.always ||
        locationPermission == LocationPermission.whileInUse) {
      return getPosition();
    }
  }

  @override
  getPosition() async {
    print('Getposition 333333333333333333333333333333333333333333333333333');
    position = await Geolocator.getCurrentPosition();

    userLatitude = position.latitude;
    userLongitude = position.longitude;
    update();
    myMarkers.add(Marker(markerId: MarkerId('2',),
        position: LatLng(userLatitude, userLongitude),
        infoWindow: InfoWindow(title: 'My Location'),
        draggable: true,
        onDragEnd: (Lat) async {
          userLatitude = Lat.latitude;
          userLongitude = Lat.longitude;
          print('تم اختيار موقع اخر  ');
          print(userLatitude);
          print(userLatitude);
          update();
        }),
    );
    userPosition = true;
    print(' userlatitude ========================${userLatitude}');
    print(' userlongitude ========================${userLongitude}');
    if (userPosition != false) {
      statusRequest = StatusRequest.success;
      //
      // Get.toNamed(pageAddAddressMaps);
    }
    statusRequest = StatusRequest.success;
    print('userpositon ========================== ${userPosition}');
    update();
  }
}