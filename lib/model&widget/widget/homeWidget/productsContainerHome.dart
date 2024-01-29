
import 'package:elfardos/controller/home/controllerCart&Favorites.dart';
import 'package:elfardos/controller/home/controllerProducts.dart';
import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:elfardos/model&widget/widget/productsWidget/widgetProduts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsContainerHome extends StatelessWidget {
  final BoxConstraints boxContainer;
  final String image ;
  final Function() onTap;
  final String name;
  final int price;
  final int discount;
  final Function() favorite;
  final Function() cart;
  final int idProducts;


const  ProductsContainerHome ({Key? key, required this.boxContainer, required this.image,
    required this.onTap, required this.name, required this.price, required this.discount,
    required this.favorite, required this.cart, required this.idProducts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(

            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(image)
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            height:boxContainer.maxHeight*0.70 ,
            width: boxContainer.maxWidth,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                discount != 0?
               Opacity(opacity: 0.5,child:  Container(
                 alignment: Alignment.center,
                 height: MediaQuery.of(context).size.height*0.04,
                 // width: boxContainer.maxWidth*0.25,
                 padding: const EdgeInsets.all(4),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(8),
                     color: ColorTheme.themeColor
                 ),
                 child: Text('discount',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                     color: Colors.white,fontSize: 14
                 ),),
               ),):const SizedBox(),

            GetBuilder<ControllerCartFavorites>(
                builder: (_c){
              return    InkWell(
                onTap:favorite,
                child: CircleAvatar(
                  radius: boxContainer.maxWidth*0.06,
                  backgroundColor: Colors.grey[200],
                  //:
                  child:   Icon(Icons.favorite,size: 18,color:_c.favoritesMap[idProducts]==true? ColorTheme.themeColor:Colors.black38),
                ),
              );
            })

              ],
            ),
          ),
          Padding(padding:const  EdgeInsets.symmetric(horizontal:3 ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: const EdgeInsets.symmetric(horizontal: 2),
                  child:
                  SizedBox(
                    width: boxContainer.maxWidth*0.70,
                    child:  Text(name,style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black87
                    ),overflow: TextOverflow.ellipsis,maxLines: 2,),
                  ),
                ),
            GetBuilder<ControllerCartFavorites>(
              init: ControllerCartFavorites(),
                builder: (_c){
              return     InkWell(
                onTap: cart,
                child:      CircleAvatar(
                  radius: boxContainer.maxWidth*0.06,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.shopping_basket_sharp,size: 18,color:_c.cartMap[idProducts]==true?ColorTheme.themeColor: Colors.black38,),
                ),
              );
            })
              ],
            ),
          ),
          const  Spacer(),
          Container(
            alignment: Alignment.center,
            height: boxContainer.maxHeight*0.14,
            width: boxContainer.maxWidth*0.40,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[200],
            ),
            child:     priceWidget(textSize: 14, price:price),
          )
        ],
      ),
    );
  }
}
