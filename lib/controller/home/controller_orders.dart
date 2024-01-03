import 'package:elfardos/controller/controllerLogin/controllerLogin.dart';
import 'package:elfardos/core/data/function_orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/function/hindlinData.dart';
import '../../core/function/statusRequest.dart';
import '../../model&widget/model/order_details_model.dart';
import '../../model&widget/model/ordersModel.dart';
import '../../model&widget/widget/orders_widget/select_address.dart';
import '../../model&widget/widget/orders_widget/select_order_typ.dart';
import '../../model&widget/widget/orders_widget/select_payment_method.dart';
import 'controllerCart&Favorites.dart';

abstract class OrdersController extends GetxController{
  selectIdAddress({required int id});
  selectOrderTyp({required int id});
  selectPaymentMethod({required int id});
  getOneOrder({required String idOrder ,required String idAddress});
  Future addOrders();
  Future getOrders();
}
class ControllerOrders extends OrdersController{
ControllerCartFavorites _controllerCartFavorites = Get.find();
late FunctionOrders _functionOrders = FunctionOrders(Get.find());
ControllerLogin _controllerLogin = Get.find();
ControllerCartFavorites _cartFavorites = Get.find();
Orders ordersData = Orders();
DetailsOrderModel? detailsOrderModel;
OrdersModel? orders ;
late PageController controllerPage;
int currentPage = 0;
late StatusRequest statusRequest;
AllOrdersModel? allOrdersModel;

void onTapPagView(){
    if(ordersData.ordersTyp != null && currentPage ==0) {
      currentPage++;
      update();
    }
      if(ordersData.idAddress != null) {
        currentPage++;
        update();
      }
        if(ordersData.paymentMethod != null){
          currentPage++;
          update();
        }
        update();
    print(currentPage);
  }


  @override
  selectIdAddress({required int id}) {
    ordersData.idAddress = id;
    print(ordersData.idAddress);
    update();
  }
  @override
  void onInit() {
    controllerPage = PageController();
    super.onInit();
  }

  @override
  selectOrderTyp({required int id}) {
    ordersData.ordersTyp = id;
    print( ordersData.ordersTyp);
    update();
  }

  @override
  selectPaymentMethod({required int id}) {
    ordersData.paymentMethod = id;
    print(ordersData.paymentMethod);
update();
  }

  @override
  Future addOrders()async {
  try{
    statusRequest = StatusRequest.loading;
    update();
    var response = await _functionOrders.addOrders(data:{
      'id_user':_controllerLogin.userData.user!.id!.toString(),
      'price_orders':'${_cartFavorites.totalPriceCart.toString()}',
      'id_address':'${ordersData.idAddress.toString()}',
      'coupon_order':'77',
      'payment_method':'${ordersData.paymentMethod.toString()}',
      'orders_typ':'${ordersData.ordersTyp.toString()}'
    } );

    statusRequest = handlingData(response);
    if(statusRequest==StatusRequest.success){
      if(response['status']==200){
     print('oooooooooooooooooooooooooooooooooooooooooooooooooooooop');
     _controllerCartFavorites.cartMap.clear();
     _cartFavorites.getCart();
        print(response);
      // orders = OrdersModel.fromJson(response);
       //print(orders!.message!);
       update();
      }else{
        print(statusRequest);
        statusRequest = StatusRequest.serverFailure;
      }
      update();
    }else{
      print(statusRequest);
      return statusRequest;
    }
    update();
  }catch(e){
    statusRequest = StatusRequest.failure;
    print(statusRequest);
    print(e.toString());
  }

  update();
  }

  @override
  Future getOrders() async{
   try{
     statusRequest=StatusRequest.loading;
     var response = await _functionOrders.getOrders(id: '${_controllerLogin.userData.user!.id!}');
     statusRequest = handlingData(response);
     if(statusRequest==StatusRequest.success){
       if(response['status']==200){
         allOrdersModel = AllOrdersModel.fromJson(response);
         print(allOrdersModel!.ordresComplete![0].idOrders);

         print('ssspppppppppppppppppppppppppppppppppppppppppppp');
         update();
       }else{
         statusRequest=StatusRequest.failure;
         update();
       }
     }else{
       print(statusRequest);
       update();
       return statusRequest;
     } update();
   }catch(e){
     print(e.toString());
   }
   update();
  }

  @override
  getOneOrder({required String idOrder, required String idAddress})async {
  try{
    statusRequest = StatusRequest.loading;
    var response = await _functionOrders.getOneOrder(data: {
      'id_user':'66',
      'id_orders':'46'
    });
    statusRequest = handlingData(response);
    if(statusRequest==StatusRequest.success){
      if(response['status']==200){
        detailsOrderModel = DetailsOrderModel.fromJson(response);
        print(detailsOrderModel!.data![0].nameAr);
        print('zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz');
      }else{
        statusRequest = StatusRequest.failure;
        print('status != 200');
        print('sssssssssssssssssssssssssssssssssrr');
        update();
      }
    }else{
      print(statusRequest);
      print("sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss not sussies");
      update();
    }
    update();
  }catch(e){
    print(e.toString());
    statusRequest = StatusRequest.failure;
    print('error catttttttttttttttttttttttttttttttttsh');
    update();
    }
  update();
  }



}