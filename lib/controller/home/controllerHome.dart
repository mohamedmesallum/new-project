import 'package:elfardos/core/data/functionHome.dart';
import 'package:elfardos/core/function/hindlinData.dart';
import 'package:elfardos/core/function/statusRequest.dart';
import 'package:elfardos/model&widget/model/homeModel.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController{
 Future getData();

}
class ControllerHome extends HomeController{
  FunctionHome functionHome = FunctionHome(Get.find());
  late StatusRequest statusRequest;
   HomeModel? homeModel;




  @override
  Future getData()async {
   try{
statusRequest = StatusRequest.loading;
update();
 var response = await functionHome.getData();
 statusRequest = handlingData(response);
 if(statusRequest==StatusRequest.success){
   if(response['statues']==200){
     homeModel = HomeModel.fromJson(response);
     print('success success success success success ');
     print(homeModel!.banner!.length);
   }else{
     statusRequest = StatusRequest.failure;
     update();
   }
 }else{
   update();
   return statusRequest ;
}
   }catch(e){
     statusRequest = StatusRequest.failure;
     print(e.toString());
     update();
   }
   update();
  }


  @override
  void onInit() {
  getData();
    super.onInit();
  }

}