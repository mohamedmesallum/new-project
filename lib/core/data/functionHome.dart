

import 'package:elfardos/core/data/url.dart';

import '../function/methodGPUD.dart';

class  FunctionHome{
  Method method;
  FunctionHome(this.method);
  
  Future getData()async {
    var response = await method.getData(url: getDataHome);
    return response.fold((l) => l, (r) => r );
  }
  Future getOneCategories( {required String id })async{
    print(id);
    print('iddddddddddddddddddddddddddd');
    var response = await method.postData(url:getOneCategorie, data: {
      'categories_id':id,
    });
    return response.fold((l) => l, (r) => r);
  }
  
  
}