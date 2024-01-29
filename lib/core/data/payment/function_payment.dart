import 'dart:convert';

import 'package:elfardos/core/data/payment/url_payment.dart';
import 'package:elfardos/core/function/methodGPUD.dart';
import 'package:http/http.dart ' as http;

import '../../function/checkInternet.dart';

class FunctionPayment{
  Method method;
  FunctionPayment(this.method);
  String? token;
  String? idOrder;
 String? finalToken;
String? finalIdOrder;
 final String idCart = '4444285';
  final String   idKiosk= '4445091';

Future  getToken()async{

    if(await checkInInternet()){

      try{      var req =await http.post(Uri.parse(UrlPayment.getTokenUrl),headers: {
          'Content-Type': 'application/json'
        },body:json.encode({
          "api_key":"ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RVME5URTNMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuSUNGb2ZQeWpIQ0MyU0dTSkttd2lpWElLU2J4TFdfT1ZvTnd3UnhMdXBuRU9Nc2U4cnlickw0YkRFZWFjbFFPbUpkV0I5ZV9zTmlKTjV2aDRxdHZJUHc==",


        }) );

        Map responseBody =await  jsonDecode(req.body);
        if (req.statusCode >= 200 && req.statusCode < 300) {
          print(responseBody['token']);
          token=responseBody['token'];
          return token;
        }
        else {

        }

    }catch(e){
    print('error catch 1 ');
    print(e.toString());
    }
  }else{
  print('error check InInternet');
  }
  }
Future  registerTheOrder({required Map data})async{

    if(await checkInInternet()){

      try{      var req =await http.post(Uri.parse(UrlPayment.registerOrderUrl),headers: {
        'Content-Type': 'application/json'
      },body:json.encode(data) );

      Map responseBody =await  jsonDecode(req.body);
      if (req.statusCode >= 200 && req.statusCode < 300) {

        print('iddddddddddddddddddddddddddddd=');
     print(responseBody['id']);
     idOrder = responseBody['id'].toString() ;
     return idOrder;
      }
      else {

      }

      }catch(e){
        print('error catch 222222222222222222221 ');
        print(e.toString());
      }
    }else{
      print('error check InInternet');
    }
  }
  Future requestPaymentKey({required Map data})async {
    if(await checkInInternet()){

      try{      var req =await http.post(Uri.parse(UrlPayment.paymentKeysUrl),headers: {
        'Content-Type': 'application/json'
      },body:json.encode(data) );

      Map responseBody =await  jsonDecode(req.body);
      if (req.statusCode >= 200 && req.statusCode < 300) {

        print('token final =============================');
        print(responseBody["token"]);
        finalToken = responseBody[ "token"];
        print('token final =============================');
        print(finalToken);
        print('token final =============================');
        return finalToken;

      }
      else {

      }

      }catch(e){
        print('error catch 222222222222222222223 ');
        print(e.toString());
      }
    }else{
      print('error check InInternet');
    }
  }

  Future getRefCode({required Map data } )async {
    if(await checkInInternet()){

      try{      var req =await http.post(Uri.parse(UrlPayment.kioskPaymentsUrl),headers: {
        'Content-Type': 'application/json'
      },body:json.encode(data) );

      Map responseBody =await  jsonDecode(req.body);
      if (req.statusCode >= 200 && req.statusCode < 300) {
        print(responseBody);

        return responseBody;

      }
      else {

      }

      }catch(e){
        print('error catch 222222222222222222224 ');
        print(e.toString());
      }
    }else{
      print('error check InInternet');
    }
  }

}
