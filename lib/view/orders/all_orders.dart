

import 'package:elfardos/controller/home/controller_orders.dart';
import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model&widget/widget/loginWidget/bottom.dart';
import '../../model&widget/widget/orders_widget/chose_orders_details.dart';
import '../../model&widget/widget/orders_widget/select_address.dart';
import '../../model&widget/widget/orders_widget/select_order_typ.dart';
import '../../model&widget/widget/orders_widget/select_payment_method.dart';
import '../../model&widget/widget/profile/profileWidget.dart';

class AllOrders extends StatelessWidget {
   AllOrders({Key? key}) : super(key: key);
ControllerOrders _c = Get.put(ControllerOrders());//Bideing
   List<Widget> pageViewOrders =[
     OrdersTyp(),
     SelectAddress(),
     PaymentMethod(),
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:customAppBarProfile(
          context: context,
          title: ''
    ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: LayoutBuilder(
          builder: (context,boxSize){
            return Column(
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
                Text('Hi , Ahmed ',style: Theme.of(context).textTheme.bodyMedium,),
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
            );
          },
        ),
      ),
    );
  }
}
