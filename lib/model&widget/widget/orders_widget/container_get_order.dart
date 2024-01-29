
import 'package:elfardos/controller/home/controller_orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/appTheme/colorTheme.dart';
import '../../../core/routes/namePages.dart';
import '../../model/ordersModel.dart';
import 'package:timeago/timeago.dart' as timeago ;

import '../productsWidget/widgetProduts.dart';


class ContainerGetOrder extends StatelessWidget {
  final BoxConstraints boxSize;
  final List<Orders> listOrders;
  final String nameButton ;
  final Function() onTpa;
   ContainerGetOrder({Key? key, required this.boxSize, required this.listOrders, required this.nameButton, required this.onTpa}) : super(key: key);
ControllerOrders _controllerOrders = Get.find();
  @override
  Widget build(BuildContext context) {
    return
      listOrders.isNotEmpty?

      ListView.separated(
      padding: EdgeInsets.all(12),
      separatorBuilder: (context,i)=>SizedBox(height: boxSize.maxHeight*0.02),
      itemCount: listOrders.length,
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
                          color: Colors.black45,
                        ),),
                        Text('${listOrders[i].idOrders}',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                        ),)
                      ],
                    ),
                    SizedBox(height: boxSize.maxHeight*.01,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:  [
                        Text('Order Date : ',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black45,
                        ),),
                        const   SizedBox(width:4,),
                        Text(timeago.format(DateTime.parse('${listOrders[i].createdAt}')),
                          style:Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: boxSize.maxHeight*.01,),
                    Row(

                      children: [
                        Text('Total Price : ',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black45,
                        ),),

                        Container(
                          alignment: Alignment.center,

                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey[200],
                          ),
                          child:     priceWidget(textSize: 14, price:listOrders[i].priceOrders!),
                        )
                      ],
                    ),
                    SizedBox(height: boxSize.maxHeight*.01,),

                    Row(

                      children: [
                        Text('Order Typ : ',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black45,
                        ),),
                        listOrders[i].ordersTyp==0?
                        Text(' Delivery',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                        ),):
                        Text(' Pick up from store',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                        ),)
                      ],
                    ),
                    SizedBox(height: boxSize.maxHeight*.01,),
                    Row(

                      children: [
                        Text('Order Typ : ',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black45,
                        ),),
                       listOrders[i].paymentMethod==0?
                        Text(' Cash',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
                        ),):
                        Text(' Credit Card',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black,
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
                            opacity: 0.9,
                            child:   InkWell(
                              onTap:(){
                                _controllerOrders.getOneOrder(
                                    idOrder: '${listOrders[i].idOrders}',
                                  idAddress:listOrders[i].idAddress!=null? '${listOrders[i].idAddress!}':'',
                                );
                                Get.toNamed(pOrderDetails);
                              },
                              child: Container(

                                width: double.infinity,
                                padding:const  EdgeInsets.only(
                                    top: 2, bottom:2),
                                decoration: BoxDecoration(
                                    color: ColorTheme.themeColor,
                                    borderRadius: BorderRadius.circular(15,),
                                    border: Border.all(color: ColorTheme.themeColor, width: 1.5)
                                ),
                                child:const  Text('Order Details',textAlign: TextAlign.center,
                                    style:TextStyle(fontWeight:FontWeight.w900,fontSize: 14,color:Colors.white,)
                                ),),
                            ),
                          ),
                        ),

                        Container(
                          width: boxSize.maxWidth*0.40,
                          child:   InkWell(
                            onTap:onTpa,
                            child: Container(


                              padding: const EdgeInsets.only(
                                  top: 2, bottom:2),
                              decoration: BoxDecoration(
                                color: Colors.grey[500],
                                borderRadius: BorderRadius.circular(15,),

                              ),
                              child: Text(nameButton,textAlign: TextAlign.center,
                                  style:const TextStyle(fontWeight:FontWeight.w900,fontSize: 14,color:Colors.white,)
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
      );
  }
}
