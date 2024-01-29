

import 'package:elfardos/controller/home/controller_orders.dart';
import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:elfardos/core/function/HindlingDataView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago ;

import '../../model&widget/widget/cartFavoriteWidget/containerCart.dart';
import '../../model&widget/widget/productsWidget/widgetProduts.dart';


class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
       // centerTitle: true,
        title: Text('Order Details',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.black
        ),),
      ),
    body: GetBuilder<ControllerOrders>(
      builder: (_controller){
        return HandlingDataView(
          statusRequest:_controller.statusRequestOrderDetails ,
          widget: Container(
          padding:const  EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: LayoutBuilder(
            builder: (context,boxSize){
              return Padding(padding:const  EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Row(
                      children: [
                        Text('Order Details',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ColorTheme.themeColor
                        ),),
                        const  Spacer(),
                        TextButton.icon(onPressed: (){},icon:Icon(Icons.download,size: 22,color: ColorTheme.themeColor,) ,
                          label: Text('Invoice',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: ColorTheme.themeColor
                          ),),)
                      ],
                    ),



                    Row(
                      children: [
                        CircleAvatar(
                          radius: boxSize.maxHeight*0.04,
                          backgroundImage: AssetImage('images/logo.jpg',),
                        ),
                        SizedBox(width: boxSize.maxWidth*0.02,),
                        Text('Al Fadrdos',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black
                        ),),
                        const  Spacer(),
                        CircleAvatar(
                          radius: boxSize.maxWidth*0.05,
                          backgroundColor:Colors.grey[400],
                          child: Icon(Icons.sms,color:Colors.white ,size: 18,),

                        )
                      ],
                    ),


               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(height: boxSize.maxHeight*0.01,),
               if(_controller.detailsOrderModel!.dataOrdre![0].ordersTyp==1)
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Divider(thickness: 1.5,height: boxSize.maxHeight*0.01,color: Colors.black38,),
                   Text('Typ Order',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                       color: Colors.black
                   ),),
                   SizedBox(height: boxSize.maxHeight*0.01,),
                   Row(
                     children: [
                       Container(
                         padding: EdgeInsets.all(8),
                         decoration: BoxDecoration(
                           color: Colors.grey[200],
                           borderRadius: BorderRadius.circular(8),
                         ),
                         child: Icon(Icons.store,size: 24,color: ColorTheme.themeColor,),
                       ),
                       SizedBox(width: boxSize.maxWidth*0.04,),

                       Row(
                         children: [

                           SizedBox(height: boxSize.maxHeight*0.01,),
                           Text('Pick up from store',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                               color: Colors.black38
                           ),),
                         ],
                       ),

                     ],
                   ),
                 ],
               ),
                   if(_controller.detailsOrderModel!.dataaddres!.isNotEmpty)
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,

                     children: [
                       Divider(thickness: 1.5,height: boxSize.maxHeight*0.01,color: Colors.black38,),
                       Text('Delivery Address',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                           color: Colors.black
                       ),),
                       SizedBox(height: boxSize.maxHeight*0.01,),
                       Row(
                         children: [
                           Container(
                             padding: EdgeInsets.all(8),
                             decoration: BoxDecoration(
                               color: Colors.grey[200],
                               borderRadius: BorderRadius.circular(8),
                             ),
                             child: Icon(Icons.home,size: 24,color: ColorTheme.themeColor,),
                           ),
                           SizedBox(width: boxSize.maxWidth*0.04,),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [

                               Text('${_controller.detailsOrderModel!.dataaddres![0].name}',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                   color: Colors.black
                               ),),
                               SizedBox(height: boxSize.maxHeight*0.01,),
                               _controller.detailsOrderModel!.dataaddres![0].phoneAddres!=null?
                               Text('${_controller.detailsOrderModel!.dataaddres![0].phoneAddres}',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                   color: Colors.black
                               ),):  SizedBox(height: boxSize.maxHeight*0.01,),
                               SizedBox(height: boxSize.maxHeight*0.01,),
                               _controller.detailsOrderModel!.dataaddres![0].notsAddres!=null?
                               Text('${_controller.detailsOrderModel!.dataaddres![0].notsAddres}',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                   color: Colors.black38
                               ),):  SizedBox(height: boxSize.maxHeight*0.01,),
                             ],)
                         ],
                       ),
                       // SizedBox(height: boxSize.maxHeight*0.02,),
                       Divider(thickness: 1.5,height: boxSize.maxHeight*0.01,color: Colors.black38,),
                       Text('Delivery Service',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                           color: Colors.black
                       ),),
                       SizedBox(height: boxSize.maxHeight*0.01,),
                       Row(
                         children: [
                           Container(
                             padding: EdgeInsets.all(8),
                             decoration: BoxDecoration(
                               color: Colors.grey[200],
                               borderRadius: BorderRadius.circular(8),
                             ),
                             child: Icon(Icons.delivery_dining,size: 24,color: ColorTheme.themeColor,),
                           ),
                           SizedBox(width: boxSize.maxWidth*0.04,),
                           Column(
                             children: [

                               Text('Super',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                   color: Colors.black
                               ),),
                               SizedBox(height: boxSize.maxHeight*0.01,),
                               Text('17,5 Km ',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                   color: Colors.black38
                               ),),



                             ],),
                           Spacer(),
                           priceWidget(textSize: 14, price:10),
                         ],
                       ),
                     ],
                   ),

                   // SizedBox(height: boxSize.maxHeight*
                   Divider(thickness: 1.5,height: boxSize.maxHeight*0.01,color: Colors.black38,),
                   Text('Phone',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                       color: Colors.black
                   ),),
                   SizedBox(height: boxSize.maxHeight*0.01,),
                   Row(
                     children: [
                       Container(
                         padding: EdgeInsets.all(8),
                         decoration: BoxDecoration(
                           color: Colors.grey[200],
                           borderRadius: BorderRadius.circular(8),
                         ),
                         child: Icon(Icons.phone,size: 24,color: ColorTheme.themeColor,),
                       ),
                       SizedBox(width: boxSize.maxWidth*0.04,),



                           Text('${_controller.detailsOrderModel!.dataOrdre![0].phone}',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                             color: Colors.black,
                           ),),








                     ],
                   ),
                 ],
               ),
                    Divider(thickness: 1.5,height: boxSize.maxHeight*0.01,color: Colors.black38,),
                    Text('Payment Method',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.black
                    ),),
                    SizedBox(height: boxSize.maxHeight*0.01,),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.credit_card,size: 24,color: ColorTheme.themeColor,),
                        ),
                        SizedBox(width: boxSize.maxWidth*0.04,),
                        Column(
                          children: [

                           _controller.detailsOrderModel!.dataOrdre![0].paymentMethod==0?
                            Text(' Cash',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.black,
                            ),):
                            Text(' Credit Card',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.black,
                            ),),
                            SizedBox(height: boxSize.maxHeight*0.01,),




                          ],),
                        Spacer(),
                        priceWidget(textSize: 14, price:728),
                      ],
                    ),
                    //  SizedBox(height: boxSize.maxHeight*0.02,),
                    Divider(thickness: 1.5,height: boxSize.maxHeight*0.01,color: Colors.black38,),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  [
                        Text('Order Date : ',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black45,
                        ),),
                        const   SizedBox(width:4,),
              Text(timeago.format(DateTime.parse('${_controller.detailsOrderModel!.dataOrdre![0].createdAt}')),
              style:Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Colors.black,
              ),),

                      ],
                    ),
                    SizedBox(height: boxSize.maxHeight*0.01,),
                    Row(
                      children: [
                        Text('Total Items :',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black45
                        ),),
                        Text(' ${_controller.detailsOrderModel!.data!.length}',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black
                        ),)
                      ],
                    ),
                    SizedBox(height: boxSize.maxHeight*0.02,),
                    SingleChildScrollView(
                        child:  Container(
                          //    padding:const  EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                          height: boxSize.maxHeight*0.60,

                          child:  ListView.separated(
                              physics:const  BouncingScrollPhysics(),
                              separatorBuilder: (context,i)=>SizedBox(height: boxSize.maxHeight*0.02,),
                              itemCount:_controller.detailsOrderModel!.data!.length,
                              itemBuilder:(context,i){
                                return
                                  Container(
                                    //  margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
                                      height: boxSize.maxHeight*0.15,

                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),

                                      ),
                                      child:Card(
                                        shadowColor: ColorTheme.themeColor,
                                        elevation: 2,
                                        child:  Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: boxSize.maxWidth*0.30,
                                              decoration:BoxDecoration(
                                                  image:  DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage('https://buylebanese.com/database/photos/128b.jpg')
                                                  )
                                              ),
                                            ),

                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                  margin:const  EdgeInsets.symmetric(horizontal:3),
                                                  width: boxSize.maxWidth*0.45,
                                                  child:  Text('${_controller.detailsOrderModel!.data![i].name}',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                      color: Colors.black
                                                  ),overflow: TextOverflow.ellipsis,maxLines: 1,),),
                                                SizedBox(
                                                  width: boxSize.maxWidth*0.45,
                                                  child:  Text('${_controller.detailsOrderModel!.data![i].description}',
                                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                        color: Colors.black54
                                                    ),maxLines: 4,overflow: TextOverflow.ellipsis,),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  height: boxSize.maxHeight*0.04,
                                                  width: boxSize.maxWidth*0.20,
                                                  padding: const EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(12),
                                                    color: Colors.grey[200],
                                                  ),
                                                  child:     priceWidget(textSize: 14, price:126),
                                                ),
                                              ],
                                            ),


                                            Padding(padding:const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                                                child: Text('${_controller.detailsOrderModel!.data![i].count} x',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                                    color: ColorTheme.themeColor
                                                ),)),
                                          ],
                                        ),
                                      )
                                  );


                              }
                          ),)),



                  ],
                ),
              );
            },
          ),
        ),);
      },
    )

    );
  }
}
