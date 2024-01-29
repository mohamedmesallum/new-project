
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controller/controllerMaps/controller_tracking.dart';
import '../../core/function/polyline.dart';

class Tracking extends StatefulWidget {
  const Tracking({Key? key}) : super(key: key);

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  GoogleMapController? _controller ;
  double? newLot ;
  double? nwoLang;
  ControllerTracking _controllerTracking = Get.put(ControllerTracking());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        foregroundColor: Colors.black,
        title: Text('Tracking Order',style: Theme.of(context).textTheme.bodyMedium,),

      ),
      body: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(8),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: LayoutBuilder(
            builder: (context,boxSize){
              return Column(
                children: [
                  Container(
                      height: boxSize.maxHeight*0.70,
                      width: boxSize.maxWidth,
                      child:GoogleMap(
                       // polygons:polylineSet,
                        mapType: MapType.normal,
                        markers: _controllerTracking.myMarkers,
                        initialCameraPosition:  _controllerTracking.cameraPosition!,
                        onMapCreated: (GoogleMapController controller) {

                          setState(() {
                            _controller=controller;
                          });
                        },
                      ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}



