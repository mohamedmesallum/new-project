import 'package:elfardos/core/function/methodGPUD.dart';

import '../url.dart';

class FunctionLogin {
  Method method;
  FunctionLogin(this.method);

  signIn({required Map data})async{
    var response = await method.postData(url: signInUrl, data: data);
    return response.fold((l) => l, (r) => r);
  }

  signUp({required Map data})async{
    var response = await method.postData(url: signUpUrl, data: data);
    return response.fold((l) => l, (r) => r);
  }
}