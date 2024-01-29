
import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/controller_orders.dart';
import '../loginWidget/bottom.dart';
import '../profile/profileWidget.dart';
import 'chose_orders_details.dart';

class OrdersTyp extends StatelessWidget {

   OrdersTyp({Key? key,}) : super(key: key);
  //ControllerOrders _controllerOrders = Get.find();
  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerOrders>(
     // init: ControllerOrders(),
        builder: (_controllerOrders){
      return  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Choose how to receive the order  ! ",style:
              Theme.of(context).textTheme.bodySmall, ),
              CircleAvatar(
                radius:MediaQuery.of(context).size.height*0.02,
                backgroundColor: Colors.white,
                backgroundImage:const  NetworkImage('https://static.vecteezy.com/system/resources/previews/009/687/643/original/thinking-face-icon-yellow-file-png.png'),
              )
            ],
          ),

          SizedBox(
              height: MediaQuery.of(context).size.height*0.30,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.40,
                    height:MediaQuery.of(context).size.height*0.06,
                    child: SelectDetails(
                      id: 0, title: 'Delivery',
                      onTap: () {
                        _controllerOrders.selectOrderTyp(id: 0);
                      },
                      containerColor:_controllerOrders.ordersData.ordersTyp==0?ColorTheme.themeColor: Colors.white,
                      titleColor:_controllerOrders.ordersData.ordersTyp==0?Colors.white: Colors.grey ,),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.40,
                    height: MediaQuery.of(context).size.height*0.06,
                    child:  SelectDetails(
                      id: 1,
                      title: 'Pick up from store',
                      onTap: () {
                        _controllerOrders.selectOrderTyp(id: 1);
                      },
                      containerColor:_controllerOrders.ordersData.ordersTyp==1?ColorTheme.themeColor: Colors.white,
                      titleColor:_controllerOrders.ordersData.ordersTyp==1?Colors.white: Colors.grey ,),
                  ),

                ],
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          Opacity(
            opacity:_controllerOrders.ordersData.ordersTyp == null ? 0.2 :0.9,
            child:   SizedBox(
              width:MediaQuery.of(context).size.width*0.85,
              child:    CustombButton('Next',(){
                if(_controllerOrders.ordersData.ordersTyp ==0 ){
                  _controllerOrders.currentPage++;
                  _controllerOrders.update();
                  print( _controllerOrders.currentPage);
                  print('ordersTyp ==0');
                }else if(_controllerOrders.ordersData.ordersTyp ==1){
                 print( _controllerOrders.currentPage);
                 print('ordersTyp ==1');
                  _controllerOrders.currentPage = 2;
                  _controllerOrders.update();
                }else{
                  return ;
                }
              },4),
            ),),
        ],
      );
    });
  }
}
