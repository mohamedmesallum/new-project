

import 'dart:convert';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart ' as http;
Set<Polyline> polylineSet = {};
List<LatLng>  polylineCo = [];
PolylinePoints polylinePoints = PolylinePoints();

Future getPolyline({required double startLat,required double startLong,required double endLat,required double endLong,})async{
  var url = 'https://maps.googleapis.com/maps/api/directions/json?&origin=$startLat,$startLong&destination=Montreal=$endLat,$endLong&key=AIzaSyDhP_ulEKhJj8g3GVq0W1v1tKbJmHZxF90';

try{
  var response = await http.post(Uri.parse(url));
  var responseBody = jsonDecode(response.body);
  print(responseBody);
  print('=============================');
  //add the polyline
  var point = responseBody['routes'][0];
  List<PointLatLng> result = polylinePoints.decodePolyline(point);
  result.forEach((PointLatLng pointLatLng) { 
    polylineCo.add(LatLng( pointLatLng.longitude, pointLatLng.longitude));
  });
Polyline polyline = Polyline(polylineId:PolylineId('16'),
points: polylineCo
);
polylineSet.add(polyline);
return polylineSet;


}catch(e){
  print(e.toString());
  print('error catch');
}

}