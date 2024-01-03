
import 'package:elfardos/controller/home/controller_orders.dart';
import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectDetails extends StatelessWidget {
  final int id;
  final String title;
 final Function() onTap;
 final Color containerColor;
 final Color titleColor ;
  const SelectDetails({super.key, required this.id, required this.title, required this.onTap, required this.containerColor, required this.titleColor});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerOrders>(
        init: ControllerOrders(),
        builder: (c){
          return InkWell(
            onTap: onTap,
            child:    Container(
                width: 300,
                padding:const  EdgeInsets.all(6),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color:  containerColor,
                    border: Border.all(color: Colors.black12,width: 1.5),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow:const   [BoxShadow(color: Colors.grey,blurRadius: 1.2,spreadRadius: 0.2)]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(title,style: TextStyle(fontWeight: FontWeight.w700,color:titleColor,fontSize: 16),),
                  ],
                )
            ),
          );
        });
  }
}
