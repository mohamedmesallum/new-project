import 'package:elfardos/core/data/url.dart';
import 'package:elfardos/core/function/methodGPUD.dart';

class FunctionOrders{
  Method _method;
  FunctionOrders(this._method);


  addOrders({required Map data })async{
    var response = await _method.postData(url: addOrdersUrl, data: data);
    return response.fold((l) => l, (r) =>r);
  }
  getOrders({required String id})async{
    var response= await _method.postData(url:getOrdersUrl, data: {
      'id_user':id.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
  getOneOrder({required Map data})async{
    var response = await _method.postData(url: getOneOrderUrl, data: data);
    return response.fold((l) => l, (r) => r);
  }


}