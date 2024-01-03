import 'package:elfardos/core/data/url.dart';

import '../function/methodGPUD.dart';

class FunctionAddress{
  Method _method;
  FunctionAddress(this._method);


  addAddress({required Map data })async{
    var response = await _method.postData(url: addAddressUrl, data: data);
    return response.fold((l) => l, (r) =>r);
  }
  getAddress({required String  idUser })async{
    var response = await _method.postData(url: getAddressUrl, data: {
      'id_user':idUser,
    });
    return response.fold((l) => l, (r) =>r);
  }
  deleteAddress({required Map  data })async{
    var response = await _method.postData(url: deleteAddressUrl, data: data);
    return response.fold((l) => l, (r) =>r);
  }
}