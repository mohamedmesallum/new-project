


import 'package:elfardos/controller/home/controller_payment_Paymob.dart';
import 'package:elfardos/core/data/payment/url_payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class WebViewVisa extends StatefulWidget {
  const WebViewVisa({Key? key}) : super(key: key);

  @override
  State<WebViewVisa> createState() => _WebViewVisaState();
}

class _WebViewVisaState extends State<WebViewVisa> {
  @override
  void initState() {
    super.initState();

  }


  ControllerPayment _controllerPayment = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visa',style: Theme.of(context).textTheme.bodyMedium,),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),

    );
  }
}

