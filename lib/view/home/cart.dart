
import 'package:elfardos/core/function/statusRequest.dart';
import 'package:elfardos/model&widget/widget/loginWidget/textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/controllerCart&Favorites.dart';
import '../../core/appTheme/colorTheme.dart';
import '../../core/function/HindlingDataView.dart';
import '../../core/routes/namePages.dart';
import '../../model&widget/widget/cartFavoriteWidget/containerCart.dart';
import '../../model&widget/widget/loginWidget/bottom.dart';
import '../../model&widget/widget/productsWidget/widgetProduts.dart';


class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    ControllerCartFavorites _c = Get.find();
    _c.getCart();
    super.initState();
  }
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //   floatingActionButton: FloatingActionButton.extended(
      //         backgroundColor: ColorTheme.themeColor,
      //         onPressed: () {  }, label: Text(
      //         'Order now ',style: Theme.of(context).textTheme.bodySmall?.copyWith(
      //         color: Colors.white,
      //       ),
      //       ),
      //
      //       ),
      backgroundColor: Colors.white,
      body:GetBuilder<ControllerCartFavorites>(
        builder: (_cartFavorites){
               return
           //1==1?

          HandlingDataView(
            //_cartFavorites.statusRequestGetCart
              statusRequest: StatusRequest.success,
              widget:
              _cartFavorites.cartMap.isNotEmpty?
              SizedBox(
                width: double.infinity,
                height:MediaQuery.of(context).size.height,
                child: LayoutBuilder(
                  builder: (context,boxSize){
                    return Column(
                      children: [
                        SizedBox(height:boxSize.maxHeight*0.02,),
                   Expanded(child: SingleChildScrollView(
                     child:  Container(
                       padding:const  EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                       height: boxSize.maxHeight*0.60,
                       width:  boxSize.maxWidth,
                       child:  ListView.separated(
                           separatorBuilder: (context,i)=>SizedBox(height: boxSize.maxHeight*0.01,),
                           itemCount:_cartFavorites.cart!.data!.length,
                           itemBuilder:(context,i){
                             return
                               ContainerCart(
                                 id: _cartFavorites.cart!.data![i].idProducts!,
                                 boxConstraints: boxSize,
                                 name:_cartFavorites.cart!.data![i].name! ,
                                 image:'https://buylebanese.com/database/photos/128b.jpg' ,
                                 priec:_cartFavorites.cart!.data![i].price! ,

                                 description: '_cartFavorites.cart!.data![i].description! _cartFavorites.cart!.data![i].description! _cartFavorites.cart!.data![i].description!',
                                 count:_cartFavorites.cart!.data![i].count!,
                               );

                           }
                       ),


                     ),
                   ),),
                        Center(child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                        //  height: boxSize.maxHeight*0.38,
                          width:  boxSize.maxWidth*0.95,
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(child:  Field(
                                      null,
                                          null,
                                          namehient: 'Coupon',
                                          keyboard: TextInputType.number,
                                          valid: (valid){},
                                          controller: controller), ),
                                      SizedBox(width: boxSize.maxWidth*0.02,),
                                      Padding(padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                                        child:  Text('Apply',style: Theme.of(context).textTheme.headlineMedium?.
                                        copyWith(color: Colors.blue),textAlign:TextAlign.center,),),
                                    ],
                                  )


                                ],
                              ),
                              SizedBox(height: boxSize.maxHeight*0.02,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Discount',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                      color: Colors.black54
                                  ),),
                                  Text('0',style: Theme.of(context).textTheme.headlineMedium,),
                                ],
                              ),
                              SizedBox(height: boxSize.maxHeight*0.02,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Sup total',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                      color: Colors.black
                                  ),),
                                  Text(' \$ ${_cartFavorites.totalPriceCart.toStringAsFixed(2)}  ',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.black87
                                  ),),
                                ],
                              ),
                              SizedBox(height: boxSize.maxHeight*0.02,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Items',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                      color: Colors.black
                                  ),),
                                  Text('${_cartFavorites.cart!.data!.length}',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.black87
                                  ),),
                                ],
                              ),
                              SizedBox(height: boxSize.maxHeight*0.02,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Items count',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                      color: Colors.black
                                  ),),
                                  Text('${_cartFavorites.itemsCount}',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.black87
                                  ),),
                                ],
                              ),
                              SizedBox(height: boxSize.maxHeight*0.01,),
                              const  Divider(thickness: 2,color: Colors.black38,),
                              SizedBox(height: boxSize.maxHeight*0.01,),
                              Center(
                                child:    CustombButton(
                                    'Orders ',
                                        () {
                                      Get.toNamed(pAllOrders);
                                    // _cartFavorites.FItemsCount();
                                        },
                                    8),
                              ),
                              SizedBox(height: boxSize.maxHeight*0.03,),



                            ],

                          ),
                        ),),

                      ],
                    );
                  },
                ),
              ): SizedBox(
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
                          height: boxConstraints.maxHeight*0.20,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.scaleDown,
                                image: AssetImage("images/cart.png")
                            ),
                          ),
                        ),
                        SizedBox(height: boxConstraints.maxHeight*0.05),
                        Text('You did not add products to your Cart ! \n Shop now and enjoy the best products' ,
                          textAlign:TextAlign.center,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.black54
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
          );

        },
      )
    );
  }
}
