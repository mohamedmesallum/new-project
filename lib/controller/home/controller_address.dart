import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:elfardos/controller/controllerLogin/controllerLogin.dart';
import 'package:elfardos/controller/controllerMaps/controller_maps.dart';
import 'package:elfardos/model&widget/model/adresess_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/data/function_address.dart';
import '../../core/function/hindlinData.dart';
import '../../core/function/statusRequest.dart';
import '../../model&widget/widget/loginWidget/dialogWidget.dart';

abstract class AddressController extends GetxController{
 Future addAddress();
 Future getAddress();
 Future deleteAddress({required int idAddress});
}
class ControllerAddress extends AddressController{
 final ControllerLogin _controllerLogin = Get.find();
 StatusRequest? statusRequest ,statusRequestAdd ,statusRequestDelete;

bool addressIsEmpty=false;
 Addresses addresses = Addresses();
 var controllerName = TextEditingController();
 var controllerPhone = TextEditingController();
 var controllerNotes= TextEditingController();
 final FunctionAddress _functionAddress = FunctionAddress(Get.find());
 ControllerMaps _controllerMaps = Get.put(ControllerMaps());


  @override
  Future addAddress()async {
 try{
  statusRequestAdd = StatusRequest.loading;
  update();
  var response = await _functionAddress.addAddress(data: {
'id_user':'${_controllerLogin.userData.user!.id!}',
   'name':controllerName.text,
   'Latitude':'${_controllerMaps.userLatitude.toDouble()}',
   'Longitude':'${_controllerMaps.userLongitude.toDouble()}',
   'phone_addres':'${controllerPhone.text}',
   'nots_addres':'${controllerNotes.text}',
  });
  statusRequestAdd = handlingData(response);
  if(statusRequestAdd==StatusRequest.success){
   if(response['statues']==200){
    getAddress().then((value) {
     Get.back();
    });
    print(response['message']);
   }else{
    dialogError(
        null,
        context: Get.context!,
        title: 'Something went wrong, please try again',
        dialogType: DialogType.error
    );
    update();
   }
   update();
  }else{
   dialogError(
       null,
       context: Get.context!,
       title: 'Something went wrong, please try again',
       dialogType: DialogType.error
   );
  }
 }catch(e){
  dialogError(
      null,
      context: Get.context!,
      title: 'Something went wrong, please try again',
      dialogType: DialogType.error
  );
  print(e.toString());
 }
 update();
  }

  @override
  Future getAddress() async{
  try{
   statusRequest = StatusRequest.loading;
   update();
   var response = await _functionAddress.getAddress(idUser:_controllerLogin.userData.user!.id!.toString(),);
   statusRequest = handlingData(response);
   if(statusRequest==StatusRequest.success){
    if(response['statues']==200){
     addresses = Addresses.fromJson(response);
    if(addresses.data!.isNotEmpty){
     addressIsEmpty = true;
     update();
    }
    }else{
     statusRequest = StatusRequest.failure;
     update();

    }
    update();
   }else{
    update();
    return statusRequest;
   }
  }catch(e){
   statusRequest = StatusRequest.failure;
   print(e.toString());
  }
  update();
  }
@override
  void onInit() {
    getAddress();
    super.onInit();
  }

  @override
  Future deleteAddress({required int idAddress})async {
  try{
   statusRequest= StatusRequest.loading;
   update();
   var response =await  _functionAddress.deleteAddress(data: {
    'id_user':'${_controllerLogin.userData.user!.id!}',
'id_addres':'${idAddress}',
   });
   statusRequest = handlingData(response);
   if(statusRequest==StatusRequest.success){
    if(response['status']==200){
     print(response['message']);
 var x = addresses.data!.firstWhere((element) => element.idAddres==idAddress);
addresses.data!.remove(x);
if(addresses.data!.isEmpty){
 addressIsEmpty = false;
 update();
}
 update();
    }else{
     statusRequest=StatusRequest.failure;
     update();
    }
   }else{
    update();
    return statusRequest;
   }
  }catch(e){
   print(e.toString());
  }
  update();
  }
}