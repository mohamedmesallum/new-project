


import 'package:elfardos/controller/home/controllerCart&Favorites.dart';
import 'package:elfardos/model&widget/model/products.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../productsWidget/widgetProduts.dart';


class ContainerCart extends StatefulWidget {
  final BoxConstraints boxConstraints;
  final String image;
  final String name;
final int id ;
  final int priec;
  final String description;
 late int count ;
   ContainerCart({Key? key, required this.boxConstraints, required this.image, required this.name, required this.priec, required this.description,required this.count, required this.id  }) : super(key: key);

  @override
  State<ContainerCart> createState() => _ContainerCartState();
}

class _ContainerCartState extends State<ContainerCart> {
  ControllerCartFavorites _cartFavorites = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:widget.boxConstraints.maxHeight*0.22 ,
      child: Card(
        shadowColor: Colors.grey,
        color: Colors.white,
        elevation: 2,
        child: Row(
          children: [
            Container(
              width: widget.boxConstraints.maxWidth*0.35,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.image),
                  )
              ),
            ),
            Container(

              width: widget.boxConstraints.maxWidth*0.55,
              child: Padding(
                padding:const  EdgeInsets.symmetric(horizontal: 2,vertical: 3),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.name,style: Theme.of(context).textTheme.bodyMedium,),
                    SizedBox(
                      width: widget.boxConstraints.maxWidth*0.55,
                      child:  Text(widget.description,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.black54
                        ),maxLines: 3,overflow: TextOverflow.ellipsis,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height:widget.boxConstraints.maxHeight*0.04,
                          width: widget.boxConstraints.maxWidth*0.20,
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey[200],
                          ),
                          child:     priceWidget(textSize: 14, price: widget.priec),
                        ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          widget.count ++;
                          _cartFavorites. addMunsCount(idProducts: widget.id, countNew: widget.count);
                        });
                      },
                      child:  Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.grey[300],
                        ),
                        child:const  Icon(Icons.add,size: 18,color: Colors.black54,),
                      ),
                    ),

                    const  SizedBox(width: 8,),
                    Text('${widget.count}',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.red, fontSize: 16
                    ),),
                    const  SizedBox(width: 8,),
                    InkWell(
                      onTap: (){
                        setState(() {
                                 if(widget.count>1) {
                                   widget.count --;
                                 }
                                   _cartFavorites. addMunsCount(idProducts: widget.id, countNew: widget.count);
                        });

                      },
                      child:  Container(
                        padding: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.grey[300],
                        ),
                        child:const  Center(child: Icon(Icons.remove,size: 18,color: Colors.black54,),),
                      ),
                    )


                  ],),

                      ],
                    )
                  ],
                ),),
            )
          ],
        ),
      ),
    );
  }
}
