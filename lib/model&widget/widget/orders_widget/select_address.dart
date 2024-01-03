import 'package:elfardos/controller/home/controller_address.dart';
import 'package:elfardos/controller/home/controller_orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/controllerMaps/controller_maps.dart';
import '../../../core/appTheme/colorTheme.dart';
import '../../../core/function/statusRequest.dart';
import '../../../core/routes/namePages.dart';
import '../loginWidget/bottom.dart';
import '../profile/profileWidget.dart';
import 'chose_orders_details.dart';

class SelectAddress extends StatelessWidget {

  SelectAddress ({Key? key}) : super(key: key);
List<String> address = [
  'Home',
  'Work',
  'Home Tow'
];
ControllerOrders _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerOrders>(
        builder: (_controller){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("choose the address ! ",style:
              Theme.of(context).textTheme.bodyMedium, ),
              CircleAvatar(
                radius:MediaQuery.of(context).size.height*0.02,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/previews/009/687/643/original/thinking-face-icon-yellow-file-png.png'),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.04,),
      GetBuilder<ControllerAddress>(
          init: ControllerAddress(),
          builder: (_controllerAddress){
            return
       _controllerAddress.addressIsEmpty==true?
            SizedBox(

        height: MediaQuery.of(context).size.height*0.30,
          width:MediaQuery.of(context).size.width*0.7,
          child: ListView.separated(

            separatorBuilder: (context,i)=>SizedBox(height:MediaQuery.of(context).size.height*0.02,),
            itemCount: _controllerAddress.addresses.data!.length,
            itemBuilder: (context,i){
              return SelectDetails(
                id: _controllerAddress.addresses.data![i].idAddres!,

                title: _controllerAddress.addresses.data![i].name!, onTap: () {
                _controller.selectIdAddress(id:_controllerAddress.addresses.data![i].idAddres!);
              },
                containerColor:_controller.ordersData.idAddress==_controllerAddress.addresses.data![i].idAddres ? Colors.red:Colors.white,
                titleColor: _controller.ordersData.idAddress==_controllerAddress.addresses.data![i].idAddres ?Colors.white: Colors.grey,);
            },
          ),
        ):Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             const Icon(Icons.home,size: 60,color: Colors.black38,),
             Text("You did not add any address  !",
               textAlign:TextAlign.center,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                   color: Colors.black54
               ),              )
             ,const SizedBox(height: 8,),
             GetBuilder<ControllerMaps>(
                 init: ControllerMaps(),
                 builder: (_controllerMaps){
                   return
                     _controllerMaps.statusRequest==StatusRequest.loading?
                     Center(child: CircularProgressIndicator(color: ColorTheme.themeColor,),):
                     InkWell(
                         onTap: (){
                           _controllerMaps.geoLocationServices(context).then((value) {
                             Get.toNamed(pAddNewAddress);
                           });
                         },
                         child:  Text("Add Now".tr,
                           style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,color:ColorTheme.themeColor,
                             decoration:TextDecoration.underline,),textAlign:TextAlign.center ,));
                 }),
             SizedBox(height:MediaQuery.of(context).size.height*0.04,),
           ],
         ),);

      }),
          SizedBox(height:MediaQuery.of(context).size.height*0.02,),
   Opacity(
                  opacity:_controller.ordersData.idAddress == null ? 0.2 :0.9,
                  child:   SizedBox(
                    width: MediaQuery.of(context).size.width*0.85,
                    child:    CustombButton('Next',(){
                      _controller.onTapPagView();

                    },4),
                  ),),

          SizedBox(height: MediaQuery.of(context).size.height*0.02),
          profileWidget(
              const   Icon(Icons.arrow_forward_ios,size: 18,),
              onTap:(){

              } ,
              titel: 'My addresses',
              icons: Icons.home ,
              context: context
          ),




        ],
      );
    });
  }
}
