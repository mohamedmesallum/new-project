import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:elfardos/core/function/statusRequest.dart';
import 'package:http/http.dart ' as http;
import 'package:path/path.dart';
import 'checkInternet.dart';


class Method{

  Future<Either<StatusRequest,Map>> postData({Map<String,String>? headers,required String url,required Map data})async{
try{
  if(await checkInInternet()){
    var response = await http.post(Uri.parse(url),body:data,headers:headers);
    if(response.statusCode==200 || response.statusCode==201 ){
      Map responseBody = jsonDecode(response.body);
      return  Right(responseBody);
    }else{

      return const Left(StatusRequest.serverFailure);
    }
  }else{
    return const Left(StatusRequest.internetFailure);
  }
}catch(e){
  print(e.toString());
  return const Left(StatusRequest.offLienFailure);
}
  }


    Future<Either<StatusRequest,Map>> getData({required String url})async{
    try{
      if(await checkInInternet()){
        var response = await http.get(Uri.parse(url));
        if(response.statusCode==200 || response.statusCode==201 ){
          Map responseBody = jsonDecode(response.body);
          return  Right(responseBody);
        }else{
          return const Left(StatusRequest.serverFailure);
        }
      }else{
        print('CheckIntrnet');
        return const Left(StatusRequest.internetFailure);
      }
    }catch(e){
      return const Left(StatusRequest.offLienFailure);
    }

  }


  Future<Either<StatusRequest,Map>> postFile({required String url,required Map data,required File file})async{
    try{
      if(await checkInInternet()){
        var requst = await http.MultipartRequest('POST',Uri.parse(url),);
        var length = await file.length();
        var strem =  http.ByteStream(file.openRead());
        var multipartR = http.MultipartFile('image',strem,length,filename:basename(file.path));
      requst.files.add(multipartR);
        data.forEach((key, value) {
          requst.fields[key] = value;
        });
          var resbons = await requst.send();
        var resbosbody = await http.Response.fromStream(resbons);
        print(resbosbody.body);
        if(resbosbody.statusCode==200 || resbosbody.statusCode==201 ){
          var resbonsMap = jsonDecode(resbosbody.body) as Map<String, dynamic>;
          return  Right(resbonsMap);
        }else{

          return const Left(StatusRequest.serverFailure);
        }
      }else{
        print('CheckIntrnet');
        return const Left(StatusRequest.internetFailure);
      }
    }catch(e){
      print('jjjjjjjjjjjjjjjjjjj');
      print(e.toString());
      return const Left(StatusRequest.offLienFailure);
    }
  }
}
