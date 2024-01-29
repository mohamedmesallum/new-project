import 'dart:async';

import 'package:elfardos/core/function/polyline.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../model&widget/model/order_details_model.dart';

abstract class TrackingController extends GetxController{
Future getLocation();
}
class ControllerTracking extends TrackingController{
 late DetailsOrderModel detailsOrderModel;
  StreamSubscription<Position>? _position;
  CameraPosition? cameraPosition;
  Set<Marker> myMarkers = {
    Marker(markerId: const MarkerId('2'),
        infoWindow: const InfoWindow(title: 'Delivery'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
        //location stor
        position: const LatLng(26.155536, 32.726188)),

  };
  @override
  getLocation()async {
  try{
    cameraPosition = const   CameraPosition(
      //location camera postions
      // target: LatLng(detailsOrderModel.dataaddres![0].latitude!,detailsOrderModel.dataaddres![0].longitude!),
      target: const LatLng(22.155536,30.726188),
      zoom: 12.4746,
    );
    _position = Geolocator.getPositionStream().listen((position) {
     // myMarkers.removeWhere((element) => element.mapsId.value=='1');
      myMarkers.add(
        Marker(markerId: const MarkerId('1'),
            infoWindow: const InfoWindow(title: 'UserName'),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
            //location stor
            position:  LatLng(22.155536,30.726188)),
      );
      print(position.latitude);
      print(position.longitude);
      print('poooooooooostio');
    });
 // getPolyline(startLat: startLat, startLong: startLong, endLat: endLat, endLong: endLong)
update();
  }catch(e){
    print(e.toString());
    print('catch error ');
  }
  }
void argument(){
    detailsOrderModel =   Get.arguments['detailsOrderModel'];
    print(detailsOrderModel.dataaddres![0].latitude!);
    print(detailsOrderModel.dataaddres![0].name);
}
@override
  void onInit() {
   getLocation();
    super.onInit();
  }

}