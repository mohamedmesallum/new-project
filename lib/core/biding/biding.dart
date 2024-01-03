

import 'package:elfardos/controller/home/controllerHome.dart';
import 'package:get/get.dart';

import '../../controller/controllerLogin/controllerLogin.dart';
import '../../controller/home/controllerCart&Favorites.dart';
import '../../controller/home/controllerCategories.dart';
import '../../controller/home/controllerProducts.dart';
import '../function/methodGPUD.dart';

class BidingControllerLogin implements Bindings{
  @override
  void dependencies() {
    Get.put(Method(),permanent: true);
    Get.put(ControllerLogin(),permanent: true);


  }
  //ControllerHome

}
class BidingControllerHome implements Bindings{
  @override
  void dependencies() {
    Get.put(ControllerHome());
    Get.put(ControllerCartFavorites());

  }
//ControllerHome

}
class BidingControllerCategories implements Bindings{
  @override
  void dependencies() {
    Get.put(ControllerCategories());

  }
//Get.put(ControllerProduct());

}
class BidingControllerViewProduct implements Bindings{
  @override
  void dependencies() {
    Get.put(ControllerProduct());

  }
//);

}
