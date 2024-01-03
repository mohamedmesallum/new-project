import 'package:elfardos/core/function/methodGPUD.dart';

import 'url.dart';

class FunctionCartFavorites{
  Method method;
  FunctionCartFavorites(this.method);

  addDeleteFavorites({required Map data})async{
    var response = await method.postData(url: addDeleteFavoritesUrl, data: data);
    return response.fold((l) => l, (r) => r);
  }

  addDeleteCart({required Map data})async{
    var response = await method.postData(url: addDeleteCartUrl, data: data);
    return response.fold((l) => l, (r) => r);
  }
  getFavorites({required int idUser})async{
    var response = await method.postData(url: getFavoritesUrl, data: {
      'id_user':idUser.toString()
    });
    return response.fold((l) => l, (r) => r);
  }
  getCart({required int idUser})async{
    var response = await method.postData(url: getCartUrl, data: {
      'id_user':idUser.toString()
    });
    return response.fold((l) => l, (r) => r);
  }


}