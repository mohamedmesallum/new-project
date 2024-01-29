import 'package:elfardos/controller/home/controller_address.dart';
import 'package:elfardos/controller/home/controller_orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/controllerMaps/controller_maps.dart';
import '../../../core/appTheme/colorTheme.dart';
import '../../../core/function/statusRequest.dart';
import '../../../core/routes/namePages.dart';
import '../loginWidget/bottom.dart';
import '../loginWidget/textField.dart';
import '../profile/profileWidget.dart';
import 'chose_orders_details.dart';

class AddPhoneOrder extends StatelessWidget {

  AddPhoneOrder ({Key? key}) : super(key: key);

//  ControllerOrders _controller = Get.find();

  GlobalKey<FormState> formPhone=  GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerOrders>(
      init: ControllerOrders(),
        builder: (_controllerOrders){
          return  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Enter Your Phone  ! ",style:
                    Theme.of(context).textTheme.bodyMedium, ),
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
                    child: Form(
                      key: formPhone,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width*0.85,
                            child:    Field(
                              const  Icon(Icons.phone,color:  Colors.black45,size: 18),
                              null ,
                              namehient:'Phone ',
                              controller:_controllerOrders.controllerPhone,
                              valid: (value){
                                if(value!.isEmpty){
                                  return 'Please enter your phone number so we can contact you';
                                }
                              },

                              keyboard:TextInputType.phone ,),
                          ),


                        ],
                      ),
                    )
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                Opacity(
                  opacity:_controllerOrders.ordersData.phone == null ? 0.2 :0.9,
                  child:   SizedBox(
                    width:MediaQuery.of(context).size.width*0.85,
                    child:    CustombButton('Next',(){
                      var formData = formPhone.currentState;
                      if(formData!.validate()){
                        _controllerOrders.ordersData.phone=_controllerOrders.controllerPhone.text;
                        if( _controllerOrders.ordersData.phone!= null){
                          _controllerOrders.currentPage++;
                          _controllerOrders.update();
                        }

                      }
                     // _
                   //   _controllerOrders.update();
                      //      controller.signIn();
                      //  Get.offAllNamed(pBottomBar);
                    },4),
                  ),),
              ],
            ),
          );
        });
  }
}