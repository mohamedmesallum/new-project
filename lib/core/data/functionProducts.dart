

import 'package:elfardos/core/function/methodGPUD.dart';

import 'url.dart';

class FunctionProducts{
Method method;
FunctionProducts(this.method);


getOneProduct({required String id})async{
  var response =await method.getData(url:  '$getProductUId/$id');
  return response.fold((l) => l, (r) => r);
}

addReview({required Map data})async{
  var response = await method.postData(url:addReviewUrl, data: data);
  return response.fold((l) => l, (r) => r);
}

}