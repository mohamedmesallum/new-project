

import 'package:elfardos/controller/controllerLogin/controllerLogin.dart';
import 'package:elfardos/controller/home/controller_orders.dart';
import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model&widget/widget/loginWidget/bottom.dart';
import '../../model&widget/widget/orders_widget/add_phone_order.dart';
import '../../model&widget/widget/orders_widget/chose_orders_details.dart';
import '../../model&widget/widget/orders_widget/select_address.dart';
import '../../model&widget/widget/orders_widget/select_order_typ.dart';
import '../../model&widget/widget/orders_widget/select_payment_method.dart';
import '../../model&widget/widget/payment_method_widget/slect_typ_payment.dart';
import '../../model&widget/widget/profile/profileWidget.dart';

class AllOrders extends StatelessWidget {
   AllOrders({Key? key}) : super(key: key);
ControllerOrders _c = Get.put(ControllerOrders());//Bideing
   ControllerLogin _controllerLogin = Get.find();
   List<Widget> pageViewOrders =[
    //
     OrdersTyp(),
     SelectAddress(),
     AddPhoneOrder(),
     PaymentMethod(),
    ChooseCardMethod(),
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      foregroundColor: Colors.black,
     // leading: IconButton(icon:Icon(Icons.arrow_back),onPressed: (){
      // if(_c.currentPage != 0){
      //   _c.currentPage--;
      //   _c.update();
      // }else{
      //   Get.back();
      // }
     // },),
    ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: LayoutBuilder(
          builder: (context,boxSize){
            return SingleChildScrollView(
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: boxSize.maxHeight,
                    height: boxSize.maxHeight*0.20,
                    decoration:const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/changePsw.jpg'),
                        )
                    ) ,
                  ),
                  Text('Hi , ${_controllerLogin.userData.user!.name} ',style: Theme.of(context).textTheme.bodyMedium,),
                  Container(
                    alignment: Alignment.center,
                    padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 5) ,
                    child:  Text( "There are some steps left to complete the order,\n"
                        " including choosing the address and payment methods",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black54,
                      ),textAlign: TextAlign.center,maxLines: 4,),
                  ),
                  SizedBox(height: boxSize.maxHeight*0.00,),

                  SizedBox(
                    height: boxSize.maxHeight*0.60,
                    child:     GetBuilder<ControllerOrders>(
                        init: ControllerOrders(),
                        builder: (_c){
                          return
                            PageView.builder(
                              physics:const  NeverScrollableScrollPhysics(),
                              itemCount:pageViewOrders.length ,
                              itemBuilder: (BuildContext context, int index) {
                                return pageViewOrders[_c.currentPage];
                              },

                              //   physics: NeverScrollableScrollPhysics(),


                            );
                        }
                    ),
                  )



                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
