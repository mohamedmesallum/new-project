
import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:flutter/material.dart';

class CustombButton extends StatelessWidget {
  final String name ;
  final Function() onTap;
  final double padding;




  CustombButton(this.name,this.onTap, this.padding,);
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:onTap,
      child: Container(

        width: double.infinity,
        padding: EdgeInsets.only(
            top: padding, bottom:padding),
        decoration: BoxDecoration(
          color: ColorTheme.themeColor,
          borderRadius: BorderRadius.circular(30,),
          // border: Border.all(color: Colors., width: 3)
        ),
        child: Text(name,textAlign: TextAlign.center,
            style:TextStyle(fontWeight:FontWeight.w800,fontSize: 16,color:Colors.white,)
        ),),
    );
  }
}