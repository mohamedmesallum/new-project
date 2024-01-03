

import 'package:elfardos/controller/controllerMaps/controller_maps.dart';
import 'package:elfardos/model&widget/model/adresess_model.dart';
import 'package:elfardos/model&widget/widget/loginWidget/textField.dart';
import 'package:elfardos/model&widget/widget/productsWidget/textFieldReview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../model&widget/widget/loginWidget/bottom.dart';
import '../../model&widget/widget/profile/profileWidget.dart';

class ViewOneAddress extends StatefulWidget {

  const ViewOneAddress({Key? key, required this.infoAddres}) : super(key: key);
  final Data infoAddres ;
  @override
  State<ViewOneAddress> createState() => _ViewOneAddressState();
}

class _ViewOneAddressState extends State<ViewOneAddress> {
  GoogleMapController? _controller ;
  @override
  var controllerName = TextEditingController();
  var controllerPhone = TextEditingController();
  var controllerNotes= TextEditingController();
 double? newLot ;
 double? nwoLang;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //         backgroundColor: Colors.white,
      //         foregroundColor: Colors.black,
      //         elevation: 0,
      //       )
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: LayoutBuilder(
          builder: (context,boxSize){
            return SingleChildScrollView(
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.pink,
                    width:MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.60,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      markers: { Marker(markerId:  const MarkerId('1'),
                          infoWindow: InfoWindow(title: '${widget.infoAddres.name}'),
                          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed), //location stor
                          position: LatLng(37.43296265331129,-122.08832357078792),draggable: true,
                          onDragEnd:(lat){
                            setState(() {
                              newLot=lat.longitude;
                              nwoLang =lat.latitude;
                            });

                          }),
                      },
                      initialCameraPosition:   CameraPosition(
                        //location camera postions
                        target: LatLng(37.43296265331129,-122.08832357078792),
                        zoom: 12.4746,
                      ),
                      onMapCreated: (GoogleMapController controller) {

                        setState(() {
                          _controller=controller;
                        });
                      },
                    ),
                  ),

                  Container(
                    width: boxSize.maxWidth*0.90,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        profileWidget(
                            Icon(Icons.update),
                            onTap:(){} ,
                            titel: widget.infoAddres.name!,
                            icons: Icons.location_on_sharp ,
                            context: context
                        ),
                        SizedBox(height: boxSize.maxHeight*0.02,),

                        Container(
                          width: boxSize.maxWidth*0.90,
                          child:  Field(null,
                              Icon(Icons.home_work_sharp,color: Colors.black38,),
                              namehient: widget.infoAddres.name != null ? widget.infoAddres.name!:'name address',
                              keyboard: TextInputType.text,
                              valid: (valid){},
                              controller: controllerName),
                        ),
                        SizedBox(height: boxSize.maxHeight*0.02,),
                        Container(
                          width: boxSize.maxWidth*0.90,
                          child:  Field(null,
                              Icon(Icons.phone,color:Colors.black38,),
                              namehient: widget.infoAddres.phoneAddres != null ? widget.infoAddres.phoneAddres!:'phone',
                              keyboard: TextInputType.text,
                              valid: (valid){},
                              controller: controllerPhone),
                        ),
                        SizedBox(height: boxSize.maxHeight*0.02,),
                        Container(
                          width: boxSize.maxWidth*0.90,
                          child:  Field(null,
                              Icon(Icons.note_add,color: Colors.black38,),
                              namehient: widget.infoAddres.notsAddres != null ? widget.infoAddres.notsAddres!:'notes',
                              keyboard: TextInputType.text,
                              valid: (valid){},
                              controller: controllerNotes),

                        ),
                        SizedBox(height: boxSize.maxHeight*0.02,),
                        CustombButton(
                            'Save ',
                                () {

                              // _cartFavorites.FItemsCount();
                            },
                            6),
                        SizedBox(height: boxSize.maxHeight*0.02,),

                      ],
                    ),
                  )

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
