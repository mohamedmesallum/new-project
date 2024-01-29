import 'package:elfardos/controller/controllerLogin/controllerLogin.dart';
import 'package:elfardos/controller/home/controllerCart&Favorites.dart';
import 'package:elfardos/core/data/payment/function_payment.dart';
import 'package:elfardos/core/data/payment/model_rigister_order.dart';
import 'package:elfardos/core/function/hindlinData.dart';
import 'package:elfardos/core/function/methodGPUD.dart';
import 'package:elfardos/core/function/statusRequest.dart';
import 'package:get/get.dart';

abstract class PaymentController extends GetxController{
Future getToken();
}
class ControllerPayment extends PaymentController{
FunctionPayment _functionPayment = FunctionPayment(Get.find());
  StatusRequest? statusRequest ;
  ControllerCartFavorites _cartFavorites = Get.find();
  ControllerLogin _controllerLogin = Get.find();
String? finalToken;


v(){
   print( _controllerLogin.userData.user!.email!);
   print( _controllerLogin.userData.user!.name);
    print(_cartFavorites.totalPriceCart);
  }
  @override
  Future getToken() async{
try{
var x = await _functionPayment.getToken().then((value)async{
  print(value);
  print('1');
   await _functionPayment.registerTheOrder(data: {
    "auth_token":value,
    "currency": "EGP",
    "amount_cents": '${_cartFavorites.totalPriceCart.toString()}',
     "shipping_data": {
       "email": _controllerLogin.userData.user!.email,
       "first_name": _controllerLogin.userData.user!.name,
       "last_name": "MOHAMED",
       "phone_number": "011111111111",

     },
  }).then((value) async{
     print(value);
     print('2');
    await _functionPayment.requestPaymentKey(data:
    {
      "auth_token": _functionPayment.token,
      "amount_cents":'${99}',
      "expiration": 3600,
      "order_id": '${_functionPayment.idOrder}',
      "billing_data": {
        "apartment": "NA",
        "email": _controllerLogin.userData.user!.email,
        "floor": "NA",
        "first_name": _controllerLogin.userData.user!.name,
        "street": "NA",
        "building": "NA",
        "phone_number": "+0201097179840",
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": "MOHAMED",
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id":4444285 ,


    }
    ).then((value)async {
      // print(value);
      // print('3');
      // await _functionPayment.getRefCode().then((value){
      //   print(value);
      //   print('4');
      //   print('final id order sosssss');
      //   print(value);
      // }).catchError((onError){
      //   print('error catch . final ');
      //   print(onError.toString());
      // });
    });

   });
}).catchError((onError){
  print('error catch . then');
 print(onError.toString());
});


}catch(e){
  print(e.toString());
  print('error catch');
}

  }
  test()async{
    var token =await _functionPayment.getToken();
    print(token);
    var idOrder =await _functionPayment.registerTheOrder(data: {
      "auth_token":token,
      "currency": "EGP",
      "amount_cents": '160',
      "shipping_data": {
        "email": _controllerLogin.userData.user!.email,
        "first_name": _controllerLogin.userData.user!.name,
        "last_name": "MOHAMED",
        "phone_number": "011111111111",

      },
    });
  finalToken = await _functionPayment.requestPaymentKey(data:
    {
      "auth_token": token,
      "amount_cents": '160',
      "expiration": 3600,
      "order_id": idOrder,
      "billing_data": {
        "apartment": "803",
        "email":_controllerLogin.userData.user!.email,
        "floor": "42",
        "first_name": _controllerLogin.userData.user!.name,
        "street": "Ethan Land",
        "building": "8028",
        "phone_number": "011111111111",
        "shipping_method": "PKG",
        "postal_code": "01898",
        "city": "Jaskolskiburgh",
        "country": "CR",
        "last_name":"MOHAMED",
        "state": "Utah"
      },
      "currency": "EGP",
      "integration_id": 4444285

    }
    );
    print(finalToken);

    print(idOrder);
    finalToken = await  _functionPayment.getRefCode(data:
      {
        "source": {
          "identifier": "AGGREGATOR",
          "subtype": "AGGREGATOR"
        },
        "payment_token":finalToken,
      }
    );
    print(finalToken);
  }


}
