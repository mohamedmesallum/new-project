import 'package:elfardos/controller/home/controllerProducts.dart';
import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:elfardos/core/function/statusRequest.dart';
import 'package:elfardos/model&widget/widget/productsWidget/textFieldReview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../loginWidget/bottom.dart';

class AddReviews extends StatelessWidget {
  final String idp;
  AddReviews({super.key, required this.idp});
  var   controllerName = TextEditingController();
  var   controllerComment = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child:   Container(
        decoration: BoxDecoration(
        //    boxShadow: [ BoxShadow(color: ColorTheme.themeColor, blurRadius: 0, spreadRadius: 0)],
            color: Colors.white,
            borderRadius: BorderRadius.circular(35)
        ),
        width: MediaQuery.of(context).size.width*0.90,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
                Form(
               //   key:controller.formstetReview,
                  child:GetBuilder<ControllerProduct>(
                    builder: (_controller){
                      return  Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name :'.tr,style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(height: 12,),
                          FieldReview(true,maxLinesField: 1,nameHint: 'User Name ', valid: (text){}, controller:controllerName),
                          const SizedBox(height: 12,),
                          Text('Comment :'.tr,style:Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(height: 12,),
                          SizedBox(
                            height: 150,
                            child: FieldReview(false,maxLinesField: 10,nameHint: 'Red Comment....'.tr, valid: (text){

                            }, controller:_controller.commentController),
                          ),
                          const SizedBox(height: 12,),
                          Text('Reviews'.tr,style: Theme.of(context).textTheme.bodyMedium),
                          const SizedBox(height: 7,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:  [
                              InkWell(
                                  onTap: (){
                                     _controller.goodRate();
                                  },
                                  child:
                                  Text('good'.tr,style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: ColorTheme.themeColor
                                  ))),
                              const SizedBox(width: 8,),
                              SizedBox(
                                  height: 40,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: _controller.starts.length,
                                      itemBuilder: (context , i ){
                                        return InkWell(
                                            onTap: (){
                                              _controller.changeRate(index:i,);
                                            },
                                            child:_controller.starts[i]==false?
                                             Icon(Icons.star_border,color: Colors.grey[400],size: 22,):
                                            const Icon(Icons.star,color: Colors.yellow,size: 22,)
                                        );
                                      })

                              ),
                              const SizedBox(width: 8,),
                              InkWell(
                                  onTap: (){
                                    _controller.badRate();
                                  },
                                  child:  Text('bad'.tr,style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: Colors.black54
                                  ))),
                            ],),
                          const SizedBox(height: 8,),
                          Padding(padding:const  EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                            child:  Divider(thickness: 1,height: 1,color:ColorTheme.themeColor,),),
                          const SizedBox(height: 12,),
                          Center(child:  SizedBox(
                            width: MediaQuery.of(context).size.width*0.45,
                            child:   _controller.statusRequestReview==StatusRequest.loading?
                                Center(child: CircularProgressIndicator(color:ColorTheme.themeColor,),):
                            CustombButton (
                                'add Review ',
                                    (){
                                  _controller.addReview().then((value) => print(_controller.statusRequestReview));
                                },
                                4
                            ),


                          ),)
                        ],);
                    },
                  )
                ),

        ),),);
  }
}