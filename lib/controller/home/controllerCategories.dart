import 'package:elfardos/model&widget/model/products.dart';
import 'package:get/get.dart';

import '../../core/data/functionHome.dart';
import '../../core/function/hindlinData.dart';
import '../../core/function/statusRequest.dart';

abstract class  CategoriesController extends GetxController{
 Future getCategories();
}
class ControllerCategories extends  CategoriesController{
  FunctionHome functionHome = FunctionHome(Get.find());
  late StatusRequest statusRequest;
Products? oneCategoriesModel;

  @override
  Future getCategories()async {
    try{
      statusRequest = StatusRequest.loading;
      update();
      var response = await functionHome.getOneCategories(id: '${Get.parameters['idCategories']}');
      print(response);
statusRequest=handlingData(response);
print(statusRequest);
print('ldkdl');
      if(statusRequest==StatusRequest.success){
        if(response['statues']==200){
      oneCategoriesModel = Products.fromJson(response);
       print(oneCategoriesModel!.data![0].nameAr);
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

  void  sort(){
statusRequest = StatusRequest.loading;
update();
   oneCategoriesModel!.data!.sort((a,b)=>a.priec!.compareTo(b.priec!));
   print(oneCategoriesModel!.data!);
update();
    print('ssssssssssssssssssssssssssssss');
       print(oneCategoriesModel!.data![0].priec);
       statusRequest= StatusRequest.success;
  }



  @override
  void onInit() {
  getCategories();
    super.onInit();
  }
}