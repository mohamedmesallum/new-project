

import 'package:elfardos/controller/controllerMaps/controller_tracking.dart';
import 'package:elfardos/model&widget/widget/orders_widget/tapBar_myOrdres.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/controller_orders.dart';
import '../../core/appTheme/colorTheme.dart';
import '../../core/function/HindlingDataView.dart';
import 'package:timeago/timeago.dart' as timeago ;

import '../../core/routes/namePages.dart';
import '../../model&widget/widget/loginWidget/bottom.dart';
import '../../model&widget/widget/orders_widget/container_get_order.dart';
import '../../model&widget/widget/productsWidget/widgetProduts.dart';



class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  ControllerOrders _controllerOrders = Get.put(ControllerOrders());
  @override
  void initState() {
   _controllerOrders.getOrders();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('My Orders', style: Theme
            .of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(
          color: Colors.black,
          fontFamily: ' Cairo',
          fontWeight: FontWeight.w800,
          fontSize:18,

        )),
        actions: [

          Icon(Icons.shopping_basket_rounded,color: ColorTheme.themeColor,size: 27,),
          const SizedBox(width: 9,),
        ],
      ),
      body:
      GetBuilder<ControllerOrders>(
          builder: (_controller) {
            return
              HandlingDataView(
                statusRequest: _controller.statusRequest!,
                widget: SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  child: LayoutBuilder(
                    builder: (context, boxSize) {
                      return DefaultTabController(
                        length: 3,
                        child: Scaffold(
                          backgroundColor: Colors.white,
                          body: ListView(
                            children: [
                              TabBarOrders(boxSize: boxSize,),
                              Container(
                                // width: boxSize.maxWidth*0.90,
                                height: boxSize.maxHeight*0.88,
                                child: TabBarView(
                                  children: [
                                    ContainerGetOrder(boxSize: boxSize,listOrders: _controller.allOrdersModel!.ordresWitaing!,
                                      nameButton: 'Tracking',
                                      onTpa: (){
                                        Get.toNamed(pTracking);

                                      },
                                    ),
                                    ContainerGetOrder(boxSize: boxSize,listOrders: _controller.allOrdersModel!.ordresComplete!,
                                      nameButton: 'Review', onTpa: () {  },),
                                    ContainerGetOrder(boxSize: boxSize,listOrders: _controller.allOrdersModel!.ordresRejected!,
                                      nameButton: 'Contact us', onTpa: () {  },),

                                  ],
                                ),
                              )


                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
          }),
    );
  }
}



