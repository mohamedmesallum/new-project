import 'package:flutter/material.dart';

Future  widgetDialog({required BuildContext context,required String nameImage,required String textBody,
  required String textTitle,required Widget widget}){
  return
    showDialog(barrierColor: Colors.black54,context: context,builder:(context){
      return
        AlertDialog(
          titlePadding:const EdgeInsets.only(top: 10,left: 5,right: 5),
          elevation:100,
          title:SizedBox(
            height: MediaQuery.of(context).size.height *0.60,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(child: Image.asset(nameImage,fit: BoxFit.cover,)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(textTitle,style: const TextStyle(fontWeight: FontWeight.w900,fontSize: 20,color: Colors.black87),textAlign: TextAlign.center,),
                      const SizedBox(height: 30,),
                      Text(textBody,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 18,color: Colors.black38),textAlign: TextAlign.center,),
                      const SizedBox(height: 20,),
                      widget,
                    ],
                  ),
                ),


              ],
            ),
          ),
        );
    });
}