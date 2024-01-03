
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/controller_orders.dart';
import '../loginWidget/bottom.dart';
import '../profile/profileWidget.dart';
import 'chose_orders_details.dart';

class PaymentMethod extends StatelessWidget {

  PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerOrders>(
        builder: (_controllerOrders){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Choose payment method ! ",style:
              Theme.of(context).textTheme.bodyMedium, ),
              CircleAvatar(
                radius:MediaQuery.of(context).size.height*0.02,
                backgroundColor: Colors.white,
                backgroundImage:const  NetworkImage('https://static.vecteezy.com/system/resources/previews/009/687/643/original/thinking-face-icon-yellow-file-png.png'),
              )
            ],
          ),

          SizedBox(
              height: MediaQuery.of(context).size.height*.30,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.40,
                    height:MediaQuery.of(context).size.height*0.06,
                    child: SelectDetails(
                      id: 0, title: 'Cash',
                      onTap: () {
                        _controllerOrders.selectPaymentMethod(id: 0);
                      },
                      containerColor:_controllerOrders.ordersData.paymentMethod==0?Colors.red: Colors.white,
                      titleColor:_controllerOrders.ordersData.paymentMethod==0?Colors.white: Colors.grey ,),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.40,
                    height:MediaQuery.of(context).size.height*0.06,
                    child:  SelectDetails(
                      id: 1,
                      title: 'Credit Card',
                      onTap: () {
                        _controllerOrders.selectPaymentMethod(id: 1);
                      },
                      containerColor:_controllerOrders.ordersData.paymentMethod==1?Colors.red: Colors.white,
                      titleColor:_controllerOrders.ordersData.paymentMethod==1?Colors.white: Colors.grey ,),
                  ),

                ],
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),

          Opacity(
            opacity:_controllerOrders.ordersData.paymentMethod ==  null ? 0.2 :0.9,
            child:   SizedBox(
              width: MediaQuery.of(context).size.width*0.85,
              child:    CustombButton('Next',(){
                _controllerOrders.addOrders();
                //      controller.signIn();
                //  Get.offAllNamed(pBottomBar);
              },4),
            ),),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          profileWidget(
              const   Icon(Icons.arrow_forward_ios,size: 18,),
              onTap:(){

              } ,
              titel:'Payment',
              icons: Icons.credit_card ,
              context: context
          ),
        ],
      );
    });
  }
}
