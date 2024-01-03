
import 'package:elfardos/controller/controllerMaps/controller_maps.dart';
import 'package:elfardos/controller/home/controller_address.dart';
import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:elfardos/core/function/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../model&widget/widget/loginWidget/bottom.dart';
import '../../model&widget/widget/loginWidget/textField.dart';
import '../../model&widget/widget/profile/profileWidget.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({Key? key}) : super(key: key);

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  GoogleMapController? _controller ;
  ControllerMaps _controllerMaps = Get.find();

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
               backgroundColor: Colors.white,
             foregroundColor: Colors.black,
          elevation: 0,
            ),
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
                    height: MediaQuery.of(context).size.height*0.40,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      markers: _controllerMaps.myMarkers,
                      initialCameraPosition:   CameraPosition(
                        //location camera postions
                        target: LatLng(_controllerMaps.userLatitude,_controllerMaps.userLongitude),
                        zoom: 12.4746,
                      ),
                      onMapCreated: (GoogleMapController controller) {

                        setState(() {
                          _controller=controller;
                        });
                      },

                    ),
                  ),
                 GetBuilder<ControllerAddress>(
                     builder: (_controllerAddress){
                   return Container(
                     child: Column(
                       children: [
                         profileWidget(
                             IconButton(onPressed: (){
                               Get.snackbar(

                                   'title', 'message',
                                   backgroundColor: Colors.grey[300],
                                   titleText: Text(
                                     'notes : '
                                     ,style: Theme.of(context).textTheme.bodyMedium,
                                   ),
                                   messageText: Text(
                                     'Long press on the icon and choose the title'
                                     ,style: Theme.of(context).textTheme.bodyMedium,
                                   ),
                                   snackPosition: SnackPosition.BOTTOM,
                                   padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                   duration: Duration(seconds: 3)
                               );
                             },
                               icon:const  Icon(Icons.update),),
                             onTap:(){
                               setState(() {
                                 LatLng latLingUser = LatLng(_controllerMaps.userLatitude, _controllerMaps.userLongitude);
                                 _controller!.animateCamera(CameraUpdate.newLatLng(latLingUser));
                               });
                               // _controllerAddress.getAddress();
                             } ,
                             titel: 'My Location',
                             icons: Icons.home_work_sharp ,
                             context: context
                         ),
                         profileWidget(
                             null,
                             onTap:(){
                               setState(() {
                                 LatLng latLingUser =const  LatLng(26.155536, 32.726188 );
                                 _controller!.animateCamera(CameraUpdate.newLatLng(latLingUser));
                               });
                             } ,
                             titel: 'Store Location',
                             icons: Icons.home_work_sharp ,
                             context: context
                         ),
                         SizedBox(
                           width: boxSize.maxWidth*0.90,
                           child:  Field(
                               const   Icon(Icons.home_work_sharp,color: Colors.black45,size: 18,),
                               null,
                               namehient: 'name address',
                               keyboard: TextInputType.text,
                               valid: (valid){
                                 if(valid!=null){
                                   return '';
                                 }else{
                                   return 'required name ';
                                 }
                               },
                               controller: _controllerAddress.controllerName),
                         ),
                         SizedBox(height: boxSize.maxHeight*0.02,),
                         SizedBox(
                           width: boxSize.maxWidth*0.90,
                           child:  Field(
                               const  Icon(Icons.phone,color: Colors.black45,size: 18,),
                               null,
                               namehient: 'phone',
                               keyboard: TextInputType.text,
                               valid: (valid){},
                               controller:_controllerAddress.controllerPhone),
                         ),
                         SizedBox(height: boxSize.maxHeight*0.02,),
                         SizedBox(
                           width: boxSize.maxWidth*0.90,
                           child:  Field(
                               Icon(Icons.note_add,color: Colors.black45,size: 18,),
                               null,

                               namehient: 'notes',
                               keyboard: TextInputType.text,
                               valid: (valid){},
                               controller: _controllerAddress.controllerNotes),

                         ),
                         SizedBox(height: boxSize.maxHeight*0.02,),
                         SizedBox(
                           width: boxSize.maxWidth*0.85,
                           child:  _controllerAddress.statusRequestAdd==StatusRequest.loading?
                         Center(child: CircularProgressIndicator(color: ColorTheme.themeColor,),):
                       CustombButton(
                       'Save ',
                       () {
                         _controllerAddress.addAddress();
                       },
                       4),
                       ),

                         SizedBox(height: boxSize.maxHeight*0.02,),

                       ],
                     ),
                   );
                 })
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
