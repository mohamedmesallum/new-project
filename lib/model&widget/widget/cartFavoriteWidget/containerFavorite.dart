
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../../core/appTheme/colorTheme.dart';
import '../productsWidget/widgetProduts.dart';

class FavoriteContainer extends StatelessWidget {
  final BoxConstraints boxConstraints;
 final String image;
 final int  price;
 final String description;
 final String name ;
 final Function() onTap;
 final Function() favorite;
 final int discount;
 final int id ;
 final Function(DismissDirection)? onDismiss;
  const FavoriteContainer({Key? key, required this.boxConstraints, required this.image,
    required this.price, required this.description, required this.name, required this.onTap,
    required this.favorite, required this.discount, required this.id, this.onDismiss}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Dismissible(
        direction: DismissDirection.endToStart,
        background:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment:Alignment.centerRight ,
            color:ColorTheme.themeColor,
            child:const  Icon(Icons.delete_forever_rounded,size: 33,color: Colors.white,),
          ),
        ),

          onDismissed:onDismiss,

       // onDismissed:onDismissed,
         key:Key('${id}'),
         child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 8),
          height: boxConstraints.maxHeight*0.20,
          width: boxConstraints.maxWidth,

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),

          ),
          child:Card(
            shadowColor: Colors.grey,
            elevation: 2,
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: boxConstraints.maxWidth*0.35,
                  decoration:BoxDecoration(
                      image:  DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(image)
                      )
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin:const  EdgeInsets.symmetric(horizontal:3),
                      width: boxConstraints.maxWidth*0.45,
                      child:  Text(name,style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black
                      ),overflow: TextOverflow.ellipsis,maxLines: 1,),),
                    SizedBox(
                      width: boxConstraints.maxWidth*0.45,
                      child:  Text(description,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.black54
                        ),maxLines: 4,overflow: TextOverflow.ellipsis,),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: boxConstraints.maxHeight*0.04,
                      width: boxConstraints.maxWidth*0.20,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[200],
                      ),
                      child:     priceWidget(textSize: 14, price:price),
                    ),
                  ],
                ),


               Padding(padding:const EdgeInsets.symmetric(horizontal: 3),
                 child: InkWell(
                   onTap: favorite,
                   child:  CircleAvatar(
                     backgroundColor: Colors.grey[200],
                     child:  Icon(Icons.favorite,color: ColorTheme.themeColor,),
                   ),
                 )),
              ],
            ),
          )
      ),
      ),
    );
  }
}
