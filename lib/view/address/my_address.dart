
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:elfardos/controller/controllerMaps/controller_maps.dart';
import 'package:elfardos/controller/home/controller_address.dart';
import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:elfardos/core/function/HindlingDataView.dart';
import 'package:elfardos/model&widget/widget/loginWidget/dialogWidget.dart';
import 'package:elfardos/model&widget/widget/mapsWidget/maps_widgets.dart';
import 'package:elfardos/view/address/view_one_addres.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/function/statusRequest.dart';
import '../../core/routes/namePages.dart';
import '../../model&widget/widget/addressWidget.dart';
import '../../model&widget/widget/loginWidget/bottom.dart';

class MyAddress extends StatelessWidget {
  MyAddress({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
     backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('My Address', style: Theme
            .of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(
          color: Colors.black,
          fontFamily: ' Cairo',
          fontWeight: FontWeight.w800,
          fontSize:18,

        )),
        actions: [

          Icon(Icons.shopping_basket_rounded,color: ColorTheme.themeColor,size: 27,),
          const SizedBox(width: 9,),
        ],
      ),
      body: GetBuilder<ControllerAddress>(
        init: ControllerAddress(),
        builder: (_controller)=>
        HandlingDataView(statusRequest: _controller.statusRequest!,
          widget:
          _controller.addressIsEmpty==true?
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(20),
            child: LayoutBuilder(
              builder: (context,boxSize){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: SizedBox(

                      child: ListView.separated(
                        separatorBuilder:(context,i)=>SizedBox(height: boxSize.maxWidth*0.02,),
                        itemCount: _controller.addresses.data!.length,
                        itemBuilder: (context,i){
                          return ContainerAddress(
                            onTap: (){
                            },
                            name: '${
                                _controller.addresses.data![i].name
                            }',
                            notes: '${_controller.addresses.data![i].notsAddres}',
                            phone:  '${_controller.addresses.data![i].phoneAddres}',
                            widget:  DropdownButton(items: ['delete','update'.tr].map((e) => DropdownMenuItem(
                              value:e ,
                              child: Text('${e}',style:
                              const TextStyle(fontSize: 14,fontWeight: FontWeight.w900,color: Colors.black)
                                ,),)).toList(),
                              underline:const Divider(thickness: 0,color: Colors.white,),
                              onChanged:(val){
                                print(val);
                                if(val=='update'){
                                  Get.to(()=>ViewOneAddress(infoAddres: _controller.addresses.data![i]));

                                  // ad.DeleteAddress(id_address: '${listData[index].adsressId}', context: context);
                                  //  Dilogeacaion(context: context,titel: '91'.tr,ontap:()async{
                                  // await  ad.deleteAddress(idAddress: '${ad.address!.data![i].adsressId}', context:context);

                                }else if(val=='delete'){
                                  dialogError(
                                    CustombButton(
                                        'Ok ',
                                            () {
                                          _controller.deleteAddress(idAddress: _controller.addresses.data![i].idAddres! ).then((value) {
                                            Get.back();
                                          });
                                          // _cartFavorites.FItemsCount();
                                        },
                                        2),
                                    context: context, title: 'Are you sure you want to delete the address?', dialogType:DialogType.info,

                                  );
                                  /*
                Get.toNamed(pageShowAndUpAddres,arguments:{
                  'iduser':ad.address!.data![i].userId,
                  'idaddress':ad.address!.data![i].adsressId,
                  'name':ad.address!.data![i].nameAddress,
                  'phone':ad.address!.data![i].phoneAddress,
                  'Details':ad.address!.data![i].addressDetails,
                  'longitude':ad.address!.data![i].longitude,
                  'latitude':ad.address!.data![i].latitude,
                });
                ads.arguments();
          */
                                }
                              },icon: Icon(Icons.more_vert),elevation: 0,),
                          );
                        },

                      ),

                    ),),
                    SizedBox(height: boxSize.maxHeight*0.04,),
                    GetBuilder<ControllerMaps>(
                        init: ControllerMaps(),
                        builder: (_controllerMaps){
                          return
                            _controllerMaps.statusRequest==StatusRequest.loading?
                            Center(child: CircularProgressIndicator(color: ColorTheme.themeColor,),):

                        Container(
                          width: boxSize.maxWidth*0.80,
                          child:     CustombButton(
                              'add New Address ',
                                  () {
                                _controllerMaps.geoLocationServices(context).then((value){
                                  Get.toNamed(pAddNewAddress);
                                });

                                // _cartFavorites.FItemsCount();
                              },
                              6),
                        );
                        })

                  ],
                );
              },
            )

        ):Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.home,size: 160,color: Colors.black38,),
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
                })

          ],
        ),
      ))


      ),

    );
  }
}
