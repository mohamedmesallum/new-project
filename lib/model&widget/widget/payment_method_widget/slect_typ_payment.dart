import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home/controller_orders.dart';
import '../../../controller/home/controller_payment_Paymob.dart';
import '../../../core/appTheme/colorTheme.dart';
import '../../../view/orders/view_visa.dart';
import '../loginWidget/bottom.dart';
import '../profile/profileWidget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChooseCardMethod extends StatelessWidget {

  ChooseCardMethod({Key? key}) : super(key: key);
  ControllerPayment controllerPayment = Get.find();
  Future<void> _launchUrl() async {
    print(controllerPayment.finalToken);
   try{
     Uri _url =Uri.parse('https://accept.paymob.com/api/acceptance/iframes/818301?payment_token=${controllerPayment.finalToken}') ;
     if (!await launchUrl(_url)) {
       throw Exception('Could not launch $_url');
     }
   }catch(e){
  print('error catch');
     print(e.toString());

   }
  }

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
                   InkWell(
                     onTap: (){
                       _controllerOrders.selectTypCard(id: 1);
                     },
                     child:    Container(

                       width: MediaQuery.of(context).size.width*0.40,
                       height:MediaQuery.of(context).size.height*0.20,
                       decoration: BoxDecoration(
                           color:_controllerOrders.ordersData.cardTyp==1?ColorTheme.themeColor:Colors.white,
                           image:const  DecorationImage(

                               fit: BoxFit.fill,
                               image: AssetImage('images/card.png')
                           )
                       ),

                     ),
                   ),
                    InkWell(
                      onTap: (){
                        _controllerOrders.selectTypCard(id: 2);

                      },
                      child:  Container(

                        width: MediaQuery.of(context).size.width*0.40,
                        height:MediaQuery.of(context).size.height*0.20,
                        decoration: BoxDecoration(
                            color:  _controllerOrders.ordersData.cardTyp==2?ColorTheme.themeColor:Colors.white,
                            image: const  DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('images/fawry.png')
                            )
                        ),

                      ),
                    )
                    ],
                  )
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.02,),

              Opacity(
                opacity:_controllerOrders.ordersData.cardTyp ==  null ? 0.2 :0.9,
                child:   SizedBox(
                  width: MediaQuery.of(context).size.width*0.85,
                  child:    CustombButton('Next',(){
               print(_controllerOrders.typCard);
         _launchUrl();
                    //_controllerOrders.ccc();

                   // _controllerOrders.addOrders();
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