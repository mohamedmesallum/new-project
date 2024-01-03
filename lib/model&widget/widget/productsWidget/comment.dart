import 'package:elfardos/controller/home/controllerProducts.dart';
import 'package:elfardos/model&widget/widget/productsWidget/widgetProduts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago ;

class GetReviews extends StatelessWidget {
 GetReviews({super.key});
ControllerProduct _controllerProduct = Get.find();
var x = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return
          Center(
            child:Container(
                decoration:const  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight:Radius.circular(35),topLeft:Radius.circular(35) )
                ),
                width: MediaQuery.of(context).size.width*0.92,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child:
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        // reverse:true,
                        separatorBuilder: (context,i)=>const SizedBox(height: 15,),
                        itemCount:_controllerProduct.oneProduct!.review!.length,
                        itemBuilder: (context,i){
                          return
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width*0.90,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                      Row(
                                        children: [
                                          1==2?
                                          const    CircleAvatar(
                                            radius: 25,
                                            backgroundImage: NetworkImage('',),
                                          ):
                                          CircleAvatar(
                                            radius: MediaQuery.of(context).size.width*0.04,
                                            backgroundColor: Colors.grey[400],
                                            child:const  Icon(Icons.person_outline,color: Colors.white,),
                                          ),
                                          const   SizedBox(width: 8,),
                                          Text(_controllerProduct.oneProduct!.review[i].name!,style: Theme.of(context).textTheme.bodySmall,),
                                        ],
                                      ),
                                        Row(
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                          children:  [
                                            const  Icon(Icons.timelapse,color: Colors.black87,size:12,),
                                            const   SizedBox(width:4,),
                                            Text(timeago.format(DateTime.parse(_controllerProduct.oneProduct!.review[i].createdAt!)),
                                              style:Theme.of(context).textTheme.bodySmall?.copyWith(
                                                  color: Colors.black38,fontSize: 12
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [

                                        const SizedBox(width: 5,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 8,),
                                            _controllerProduct.oneProduct!.review[i].ratings !=null?
                                            stars(rating:_controllerProduct.oneProduct!.review[i].ratings! ): const SizedBox(),
                                            _controllerProduct.oneProduct!.review[i].comment != null?
                                            Container(
                                              margin: const EdgeInsets.all(0),
                                              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                              width: MediaQuery.of(context).size.width*0.75,
                                              // color: Colors.grey[100],
                                              child: Text(_controllerProduct.oneProduct!.review[i].comment!,style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                                  color: Colors.black
                                              )),
                                            ):const SizedBox()
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                        },
                      ),

                )
            ),
          );
  }
}