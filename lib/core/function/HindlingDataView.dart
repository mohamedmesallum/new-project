
import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:elfardos/core/function/statusRequest.dart';
import 'package:flutter/material.dart';




class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView({super.key, required this.statusRequest ,required this.widget});

  @override
  Widget build(BuildContext context) {
    return
      statusRequest==StatusRequest.loading?
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child:CircularProgressIndicator(color: ColorTheme.themeColor,),),
          ],
        ),
      ) :
      statusRequest==StatusRequest.serverFailure?
    const  Center(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error,size: 70,color: Colors.red,),
            Text('Server Connection Failed',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.red),),
        ],
      ),):
      statusRequest==StatusRequest.internetFailure?
     const  Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
         Icon(Icons.wifi_off_rounded,size:70,color: Colors.blueGrey,),
           Text('There is no internet connection !',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:Colors.blueAccent),),
        ],
      ),):
      statusRequest==StatusRequest.offLienFailure?
      const  Center(child:    Text('Data not available ?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.red),)):
      statusRequest==StatusRequest.failure?
      const Center(child: Text('Something went wrong, please try again !',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.red),)):
      widget;


  }
}