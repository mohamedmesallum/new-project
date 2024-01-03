import 'package:elfardos/controller/controllerLogin/controllerLogin.dart';
import 'package:elfardos/core/data/functionProducts.dart';
import 'package:elfardos/core/function/statusRequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/function/hindlinData.dart';
import '../../model&widget/model/products&review.dart';

abstract class ProductsController  extends GetxController{
  Future getProduct({required String id});
  changeRate({required int index});
 Future addReview();
  goodRate();
  badRate();

}
class ControllerProduct extends ProductsController{
  FunctionProducts functionProducts = FunctionProducts(Get.find());
  ControllerLogin _controllerLogin = Get.find();
  late StatusRequest statusRequest;
  StatusRequest? statusRequestReview;
  var commentController = TextEditingController();
  OneProduct? oneProduct;
  Map<int,bool> starts={
    0:false,
    1:false,
    2:false,
    3:false,
    4:false,
  };
 var  rate = 0;


  @override
  Future getProduct({required String id})async {
    print(id);
try{
  statusRequest = StatusRequest.loading;
  update();
  var response = await functionProducts.getOneProduct(id: id);
  statusRequest=handlingData(response);
  if(statusRequest==StatusRequest.success){
    if(response['status']==200){
     // oneProduct = Products.fromJson(response['data']);
      oneProduct=OneProduct.fromJson(response);

      print('success success success success get Products and review success sayed');
     if(oneProduct!.review.isNotEmpty){
       print(oneProduct!.review?[0].name);
     }
      update();
    }else{
      update();
      statusRequest = StatusRequest.failure;
      return statusRequest;
    }
  }else{
    update();
    return statusRequest;
  }
  update();
}catch(e){
  statusRequest=StatusRequest.failure;
  print(e.toString());
  update();
}
    update();
  }

  @override
  Future addReview()async {
  try{
    statusRequestReview = StatusRequest.loading;
    update();
    var response = await functionProducts.addReview(data: {
      'id_product':'${Get.parameters[ 'idProducts']}',
      'id_user':_controllerLogin.userData!.user!.id!,
      'ratings':rate.toString(),
      'comment':commentController.text
    });
    statusRequestReview = handlingData(response);
    if(statusRequestReview==StatusRequest.success){
      if(response['status']==200){
        print('success success success success success success add Review');
      }else{
        print(response['statues']);
        print(response['error']);
        statusRequestReview=StatusRequest.failure;
        update();
      }
    }else{
      print(response['statues']);
      update();
      return statusRequest;

    }
    update();
  }catch(e){
    statusRequestReview=StatusRequest.failure;
    update();
    print(e.toString());
  }
  }

  @override
  changeRate({required int index}){
    if(starts[index]==false){
      starts[index]=true;
      rate++;
      update();
    }else {
      starts[index]=false;
      rate--;
      update();
    }
    update();
  }

  @override
  goodRate(){
    starts.forEach((key, value) {
      starts[key]=true;
      rate = 5 ;
      update();
    });
  }

  @override
  badRate(){
    starts.forEach((key, value) {
      starts[key]=false;
      rate = 0 ;
      update();
    });
  }





  @override
  void onInit() {
   getProduct(id: '${Get.parameters[ 'idProducts']}').then((value) => print(statusRequest));
   print(' onInit Controllers Products');
   super.onInit();
  }



}