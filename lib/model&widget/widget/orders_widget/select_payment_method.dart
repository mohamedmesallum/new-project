
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:elfardos/core/function/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/controller_orders.dart';
import '../../../core/appTheme/colorTheme.dart';
import '../loginWidget/bottom.dart';
import '../loginWidget/dialogWidget.dart';
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
                      containerColor:_controllerOrders.ordersData.paymentMethod==0?ColorTheme.themeColor: Colors.white,
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
                      containerColor:_controllerOrders.ordersData.paymentMethod==1?ColorTheme.themeColor: Colors.white,
                      titleColor:_controllerOrders.ordersData.paymentMethod==1?Colors.white: Colors.grey ,),
                  ),

                ],
              )
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.02,),
          _controllerOrders.statusRequestAddOrders==StatusRequest.loading?
          Center(child: CircularProgressIndicator(color: ColorTheme.themeColor,),):
          Opacity(
            opacity:_controllerOrders.ordersData.paymentMethod ==  null ? 0.2 :0.9,
            child:   SizedBox(
              width: MediaQuery.of(context).size.width*0.85,
              child:    CustombButton(_controllerOrders.ordersData.paymentMethod==1?'Next':'Check Out',(){
                if(_controllerOrders.ordersData.paymentMethod==1){
                  print('order Credit Card ');
                _controllerOrders.currentPage++;
                _controllerOrders.update();
                }else if(_controllerOrders.ordersData.paymentMethod==0){
                  dialogError(
                    _controllerOrders.statusRequestAddOrders==StatusRequest.loading?
                       Center(child: CircularProgressIndicator(color: ColorTheme.themeColor,),):
                    CustombButton(
                        'Ok ',
                            () {
                          _controllerOrders.addOrders();

                        },
                        2),
                    context: context, title: 'You have completed the information,\n When you click OK, the request will be sent', dialogType:DialogType.success

                  );
                //  _controllerOrders.addOrders();
                }else{
                  return ;
                }
              //  _controllerOrders.addOrders();
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
