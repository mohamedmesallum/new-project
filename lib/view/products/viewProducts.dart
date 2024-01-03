import 'package:elfardos/controller/home/controllerCart&Favorites.dart';
import 'package:elfardos/controller/home/controllerProducts.dart';
import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:elfardos/core/function/HindlingDataView.dart';
import 'package:elfardos/model&widget/widget/productsWidget/addReviews.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model&widget/widget/loginWidget/bottom.dart';
import '../../model&widget/widget/productsWidget/comment.dart';
import '../../model&widget/widget/productsWidget/widgetProduts.dart';

class ViewProducts extends StatelessWidget {
const  ViewProducts({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body:Container(
        padding:const  EdgeInsets.only(
          top: 10,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: LayoutBuilder(
          builder: (context,boxConstraints){
            return GetBuilder<ControllerProduct>(
                builder: (_controller){
              return HandlingDataView(
                  statusRequest: _controller.statusRequest,
                  widget:SingleChildScrollView(
                    child:  GetBuilder<ControllerProduct>(
                      builder: (_controller){
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  decoration:
                                  const BoxDecoration(
                                      image:  DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage('https://buylebanese.com/database/photos/128b.jpg')
                                      )
                                  ),
                                  width:boxConstraints.maxWidth,
                                  height: boxConstraints.maxHeight*0.45,
                                  child:  Container(
                                    padding: EdgeInsets.only(
                                        top: MediaQuery.of(context).padding.top,
                                        left: 10,
                                        right: 10
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap:()=>Get.back(),
                                          child: CircleAvatar(
                                            radius: MediaQuery.of(context).size.width*0.05,
                                            backgroundColor: Colors.white,
                                            child: const  Icon(Icons.arrow_back_sharp,size: 24,color: Colors.black,),
                                          ),
                                        ),
                                     GetBuilder<ControllerCartFavorites>
                                       (builder: (_cartFavorites){
                                       return    InkWell(
                                         onTap:(){
                                           _cartFavorites.addDeleteFavorites(idProduct: _controller.oneProduct!.products!.id!);
                                         },
                                         child: CircleAvatar(
                                           radius: MediaQuery.of(context).size.width*0.05,
                                           backgroundColor:_cartFavorites.favoritesMap[_controller.oneProduct!.products!.id!]==true?
                                           Colors.white70 : Colors.grey[200],
                                           child:Icon(Icons.favorite,size: 24,color:_cartFavorites.favoritesMap[_controller.oneProduct!.products!.id!]==true?ColorTheme.themeColor:Colors.black38,),
                                         ),
                                       );
                                     })
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Center(child:    Container(
                              padding:const  EdgeInsets.all(10),
                              width: boxConstraints.maxWidth*0.90,
                              //   height: 300,
                              decoration: BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: boxConstraints.maxWidth*0.70,
                                  child:  Text(_controller.oneProduct!.products!.name!,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: ColorTheme.themeColor
                                  ),overflow: TextOverflow.ellipsis,maxLines: 2,),
                                ),
                                SizedBox(height: boxConstraints.maxHeight*0.01,),
                                Padding(padding:const   EdgeInsets.symmetric(horizontal: 4),
                                  child:stars(rating:3)
                                ),
                                SizedBox(height: boxConstraints.maxHeight*0.01,),
                                SizedBox(
                                  width: boxConstraints.maxWidth*0.80,
                                  child:  Text(_controller.oneProduct!.products!.description!,
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          color: Colors.black87
                                      )),
                                ),
                                SizedBox(height: boxConstraints.maxHeight*0.02,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    priceWidget(textSize: 18, price: _controller.oneProduct!.products!.priec!),
                                    CountProduct(count: 1,),
                                  ],
                                ),
                                SizedBox(height: boxConstraints.maxHeight*0.02,),
                                Padding(padding:const  EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                                  child: Divider(color: ColorTheme.themeColor,thickness: 1,height: 1,),
                                ),
                                SizedBox(height: boxConstraints.maxHeight*0.03,),
                           GetBuilder<ControllerCartFavorites>(
                               builder: (_c){
                             return  Row(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 SizedBox(
                                   width: boxConstraints.maxWidth*0.55,
                                   child:   CustombButton (
                                    _c.cartMap[_controller.oneProduct!.products!.id!]==true?'delete from Cart':'add To Cart ',
                                           (){
                                      _c.addDeleteCart(idProduct: _controller.oneProduct!.products!.id!, count: 1);
                                       },
                                       4
                                   ),
                                 ),
                                 _c.cartMap[_controller.oneProduct!.products!.id!]==true?
                               IconButton(onPressed: (){
                                 _c.addDeleteCart(idProduct: _controller.oneProduct!.products!.id!, count: 1);
                               }, icon: const  Icon(Icons.minimize)):
                                       const SizedBox()
                               ],
                             );
                           })
                              ],
                            ),
                            ),
                            ),
                            SizedBox(height: boxConstraints.maxHeight*0.02),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text('Reviews'.tr,style: Theme.of(context).textTheme.bodyMedium),
                            ),
                            SizedBox(height: boxConstraints.maxHeight*0.02),
                            AddReviews(idp: '16'),
                            SizedBox(height: boxConstraints.maxHeight*0.02,),
                            if(_controller.oneProduct!.review!.isNotEmpty)
                           GetReviews(),
                            SizedBox(height: boxConstraints.maxHeight*0.02,),
                          ],
                        );
                      },
                    )
                  )
              );
            }
            );
          },
        ),
      )

    );
  }
}
