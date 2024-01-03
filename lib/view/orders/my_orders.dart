

import 'package:elfardos/model&widget/widget/orders_widget/tapBar_myOrdres.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/controller_orders.dart';
import '../../core/appTheme/colorTheme.dart';
import '../../core/function/HindlingDataView.dart';
import 'package:timeago/timeago.dart' as timeago ;

import '../../core/routes/namePages.dart';
import '../../model&widget/widget/loginWidget/bottom.dart';
import '../../model&widget/widget/productsWidget/widgetProduts.dart';


class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            HandlingDataView(statusRequest: _controller.statusRequest!,
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
                             _controller.allOrdersModel!.ordresComplete!.isNotEmpty?
                             ListView.separated(
                               padding: EdgeInsets.all(12),
                               separatorBuilder: (context,i)=>SizedBox(height: boxSize.maxHeight*0.02),
                               itemCount: _controller.allOrdersModel!.ordresComplete!.length,
                               itemBuilder: (context,i){
                                 return
                                   Card(
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(8),
                                     ),
                                     shadowColor: Colors.grey,
                                     elevation: 2,
                                     child:  Container(
                                         padding: const EdgeInsets.symmetric(horizontal: 8),
                                         decoration: BoxDecoration(
                                           color: Colors.white,
                                           borderRadius: BorderRadius.circular(8),),
                                         width:boxSize.maxWidth*0.85,


                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Row(

                                               children: [
                                                 Text('ID : ',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                   color: Colors.black,
                                                 ),),
                                                 Text(' 2667678 ',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                   color: ColorTheme.themeColor,
                                                 ),)
                                               ],
                                             ),
                                             SizedBox(height: boxSize.maxHeight*.01,),
                                             Row(
                                               crossAxisAlignment: CrossAxisAlignment.center,
                                               children:  [
                                                 Text('Order Date : ',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                   color: Colors.black,
                                                 ),),
                                                 const   SizedBox(width:4,),
                                                 Text(timeago.format(DateTime.parse(_controller.allOrdersModel!.ordresComplete![i].createdAt!)),
                                                   style:Theme.of(context).textTheme.bodySmall?.copyWith(
                                                     color: ColorTheme.themeColor,
                                                   ),
                                                 )
                                               ],
                                             ),
                                             SizedBox(height: boxSize.maxHeight*.01,),
                                             Row(

                                               children: [
                                                 Text('Total Price : ',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                   color: Colors.black,
                                                 ),),

                                                 Container(
                                                   alignment: Alignment.center,

                                                   padding: const EdgeInsets.all(8),
                                                   decoration: BoxDecoration(
                                                     borderRadius: BorderRadius.circular(12),
                                                     color: Colors.grey[200],
                                                   ),
                                                   child:     priceWidget(textSize: 14, price:_controller.allOrdersModel!.ordresComplete![i].priceOrders!),
                                                 )
                                               ],
                                             ),
                                             SizedBox(height: boxSize.maxHeight*.01,),

                                             Row(

                                               children: [
                                                 Text('Order Typ : ',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                   color: Colors.black,
                                                 ),),
                                                 _controller.allOrdersModel!.ordresComplete![i].ordersTyp==0?
                                                 Text(' Delivery',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                   color: ColorTheme.themeColor,
                                                 ),):
                                                 Text(' Pick up from store',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                   color: ColorTheme.themeColor,
                                                 ),)
                                               ],
                                             ),
                                             SizedBox(height: boxSize.maxHeight*.01,),
                                             Row(

                                               children: [
                                                 Text('Order Typ : ',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                   color: Colors.black,
                                                 ),),
                                                 _controller.allOrdersModel!.ordresComplete![i].paymentMethod==0?
                                                 Text(' Cash',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                   color: ColorTheme.themeColor,
                                                 ),):
                                                 Text(' Credit Card',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                   color: ColorTheme.themeColor,
                                                 ),)
                                               ],
                                             ),


                                             SizedBox(height: boxSize.maxHeight*.03,),
                                            //
                                             Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                               children: [
                                                 Container(
                                                   width: boxSize.maxWidth*0.40,
                                                   child:    Opacity(
                                                     opacity: 0.6,
                                                     child:   InkWell(
                                                       onTap:(){
                                                         Get.toNamed(pOrderDetails);
                                                       },
                                                       child: Container(

                                                         width: double.infinity,
                                                         padding: EdgeInsets.only(
                                                             top: 4, bottom:4),
                                                         decoration: BoxDecoration(
                                                             color: ColorTheme.themeColor,
                                                             borderRadius: BorderRadius.circular(15,),
                                                             border: Border.all(color: ColorTheme.themeColor, width: 1.5)
                                                         ),
                                                         child: Text('Order Details',textAlign: TextAlign.center,
                                                             style:TextStyle(fontWeight:FontWeight.w900,fontSize: 14,color:Colors.white,)
                                                         ),),
                                                     ),
                                                   ),
                                                 ),

                                                 Container(
                                                   width: boxSize.maxWidth*0.40,
                                                   child:   InkWell(
                                                     onTap:(){
                                                       _controller.getOneOrder(idOrder: '', idAddress: '');
                                                     },
                                                     child: Container(


                                                       padding: EdgeInsets.only(
                                                           top: 4, bottom:4),
                                                       decoration: BoxDecoration(
                                                           color: Colors.grey[400],
                                                           borderRadius: BorderRadius.circular(15,),

                                                       ),
                                                       child: Text('Tracking',textAlign: TextAlign.center,
                                                           style:TextStyle(fontWeight:FontWeight.w900,fontSize: 14,color:Colors.white,)
                                                       ),),
                                                   ),
                                                 )
                                               ],
                                             ),
                                             SizedBox(height: boxSize.maxHeight*.01,),



                                           ],
                                         )

                                     ),
                                   );



                               },
                             ):
                             SizedBox(
                               width: MediaQuery.of(context).size.width,
                               height: MediaQuery.of(context).size.height,
                               child: LayoutBuilder(
                                 builder: (context,boxConstraints){
                                   return Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       Container(
                                         width: boxConstraints.maxWidth,
                                         height: boxConstraints.maxHeight*0.10,
                                         decoration: const BoxDecoration(
                                           image: DecorationImage(
                                               fit: BoxFit.scaleDown,
                                               image: AssetImage("images/cart.png")
                                           ),
                                         ),
                                       ),
                                       SizedBox(height: boxConstraints.maxHeight*0.05),
                                       Text('You did not Order ! \n Shop now and enjoy the best products' ,
                                         textAlign:TextAlign.center,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                             color: Colors.black54
                                         ),
                                       ),
                                     ],
                                   );
                                 },
                               ),
                             ),

                             SizedBox(),
                             _controller.allOrdersModel!.ordresRejected==null?
                             SizedBox():
                             SizedBox(
                               width: MediaQuery.of(context).size.width,
                               height: MediaQuery.of(context).size.height,
                               child: LayoutBuilder(
                                 builder: (context,boxConstraints){
                                   return Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     crossAxisAlignment: CrossAxisAlignment.center,
                                     children: [
                                       Container(
                                         width: boxConstraints.maxWidth,
                                         height: boxConstraints.maxHeight*0.10,
                                         decoration: const BoxDecoration(
                                           image: DecorationImage(
                                               fit: BoxFit.scaleDown,
                                               image: AssetImage("images/cart.png")
                                           ),
                                         ),
                                       ),
                                       SizedBox(height: boxConstraints.maxHeight*0.05),
                                       Text('You did not Order ! \n Shop now and enjoy the best products' ,
                                         textAlign:TextAlign.center,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                             color: Colors.black54
                                         ),
                                       ),
                                     ],
                                   );
                                 },
                               ),
                             ),
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
