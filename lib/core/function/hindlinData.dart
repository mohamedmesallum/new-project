



import 'package:elfardos/core/function/statusRequest.dart';

handlingData(response){
  if(response is StatusRequest){
    print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    return response;
  }else{
    print('sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss');
    return StatusRequest.success;
  }

}