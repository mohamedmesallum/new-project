import 'package:elfardos/controller/controllerLogin/controllerLogin.dart';
import 'package:elfardos/core/data/functionCartFavorites.dart';
import 'package:elfardos/core/function/hindlinData.dart';
import 'package:elfardos/model&widget/model/products.dart';
import 'package:get/get.dart';

import '../../core/function/statusRequest.dart';
import '../../model&widget/model/cart_model.dart';

abstract class CartFavoritesController extends GetxController{
 Future addDeleteFavorites({required int idProduct });
 Future addDeleteCart({required int idProduct ,required int count  });
 Future getFavorites();
 Future getCart();
}
class ControllerCartFavorites extends CartFavoritesController{
  late StatusRequest statusRequestFavorites;
  late StatusRequest statusRequestCart;
  late StatusRequest statusRequestGetFavorites ;
  late StatusRequest statusRequestGetCart;
  ControllerLogin _controllerLogin = Get.find();
 int itemsCount = 0 ;
  Products? favorites;
  CartModel? cart;
 dynamic totalPriceCart ;
  Map<int,bool>favoritesMap = {};
  Map<int,bool>cartMap = {};
   FunctionCartFavorites functions = FunctionCartFavorites(Get.find());





  @override
  Future getFavorites()async {
    try{
      statusRequestGetFavorites = StatusRequest.loading;
      update();
      var response = await functions.getFavorites(idUser:_controllerLogin.userData!.user!.id!);
      statusRequestGetFavorites =  handlingData(response);
      if(statusRequestGetFavorites==StatusRequest.success){
        if(response['statues']==200){
          favorites = Products.fromJson(response);
          if(favorites!.data!.isNotEmpty){
            favorites!.data!.forEach((element) {
              favoritesMap.addAll(
                  {
                    element.id! :true,
                  }
              );
            });
            print(favoritesMap);
          }
        }else{
          statusRequestGetFavorites = StatusRequest.failure;
          update();
        }
      }else{
        update();
        return statusRequestGetFavorites;
      }
      update();
    }catch(e){
      print(e.toString());
      statusRequestGetFavorites=StatusRequest.failure;
      update();
    }
    update();
  }


  @override
  Future getCart()async {
   try{
     statusRequestGetCart = StatusRequest.loading;
     update();
     var response = await functions.getCart(idUser:_controllerLogin.userData!.user!.id!);
     statusRequestGetCart =  handlingData(response);
     if(statusRequestGetCart==StatusRequest.success){
       if(response['statues']==200){
         cart = CartModel.fromJson(response);
         if(cart!.data!.isNotEmpty){
           cart!.data!.forEach((element) {
             cartMap.addAll(
                 {
                   element.idProducts! :true,
                 }
             );
           });
           print('caaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaart ');
           print(cartMap);
           update();
          await getTotalCart();
          await fItemsCount();
           print(totalPriceCart);
         }
       }else{
         statusRequestGetCart = StatusRequest.failure;
         update();
       }
     }else{
       update();
       return statusRequestGetCart;
     }
     update();
   }catch(e){
     statusRequestGetCart = StatusRequest.failure;
     print(e.toString());
     update();
   }
   update();
  }


  @override
  Future addDeleteFavorites({required int idProduct})async {
   try{
     statusRequestFavorites=StatusRequest.loading;
     update();
     var response = await functions.addDeleteFavorites(data: {
       'id_products':idProduct.toString(),
       'id_user':_controllerLogin.userData!.user!.id!.toString()
     });
     statusRequestFavorites = handlingData(response);
     if(statusRequestFavorites==StatusRequest.success){
       if(response['statues']==200){
       if(response['mesaage']=='تم اضافه العنصر بنجاح'){
      favoritesMap.addAll({
        idProduct:true
      });
      print(favoritesMap);
         update();
       }else if(response['mesaage']=='تم حذف العنصر بنجاح'){
         favoritesMap.remove(idProduct);
         update();

         print(favoritesMap);
         update();
       }
         print('success success success success success success Favorites ');
        print(response['mesaage']);
       }else{
         statusRequestFavorites = StatusRequest.failure;
         update();
       }
       update();
     }else{
       update();
       return statusRequestFavorites;
     }
     update();
   }catch(e){
     print(e.toString());
     statusRequestFavorites = StatusRequest.failure;
     update();
   }
   update();
  }


  @override
  Future addDeleteCart({required int idProduct,required int count})async {
    try{
      statusRequestCart=StatusRequest.loading;
      update();
      var response = await functions.addDeleteCart(data: {
        'id_products':idProduct.toString(),
        'id_user':_controllerLogin.userData!.user!.id!.toString(),
        'count':count.toString(),
      });
      statusRequestCart = handlingData(response);
      if(statusRequestCart==StatusRequest.success){
        if(response['statues']==200){
          if(response['mesaage']=='تم اضافه العنصر بنجاح'){
            cartMap.addAll({
              idProduct:true
            });
            print(cartMap);
            update();
          }else if(response['mesaage']=='تم حذف العنصر بنجاح'){
            cartMap.remove(idProduct);
            print(cartMap);
            update();
          }

          print('success success success success success success Favorites ');
          print(response['mesaage']);
        }else{
          statusRequestCart = StatusRequest.failure;
          update();
        }
      }else{
        update();
        return statusRequestCart;
      }
update();
    }catch(e){
      statusRequestCart = StatusRequest.failure;
      update();
      print(e.toString());

    }
    update();
  }


  getTotalCart(){
    totalPriceCart = cart!.data!.map((e) => e.price! * e.count!).reduce((value, element) => value +element ).toDouble();
    update();
    print(totalPriceCart);
    return totalPriceCart;

  }
  int fItemsCount(){
   itemsCount = cart!.data!.map((e) => e.count! * 1).reduce((value, element) => value +element );
   update();
   print(itemsCount);
   return itemsCount;

  }
  void addMunsCount ({required int idProducts,required int countNew}){
  cart!.data!.forEach((element) {
    if(element.idProducts==idProducts){
      element.count = countNew;
    }

  });
  getTotalCart();
  fItemsCount();
  update();
  }




@override
  void onInit() {
  getCart();
 getFavorites();

    super.onInit();
  }
}