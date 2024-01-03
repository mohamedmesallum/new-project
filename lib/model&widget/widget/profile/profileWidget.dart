import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:flutter/material.dart';

Widget profileWidget (Widget? widget,{required Function() onTap, required String titel,required IconData icons,required BuildContext context,}){

  return  ListTile(
    onTap:onTap,
    leading: Container(
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8)
      ),
      height: 30,
      width:30,

      child: Center(child: Icon(icons,color: ColorTheme.themeColor,size: 20,),),
    ),

    title:Text(titel,style: Theme.of(context).textTheme.bodySmall,),
    trailing:  widget

  );
}
Widget customRowBottom({ required Function() onTap,required String title ,required Widget widget,required BuildContext context }){
  return  InkWell(
    onTap: onTap,
    child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[900]
          ),) ,
          const Spacer(),
          widget

        ]

    ),
  );
}
AppBar customAppBarProfile({required BuildContext context , required String title}){
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    centerTitle: true,
    title: Text(title,style: Theme.of(context).textTheme.bodyLarge,),
  );
}