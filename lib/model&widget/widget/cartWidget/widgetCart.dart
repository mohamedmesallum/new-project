
import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:flutter/material.dart';

class  FloatingActionCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
            2==2?
            Stack(
              alignment: Alignment.topRight,
              children: [
            FloatingActionButton(onPressed:(){
                //  Get.toNamed(pageCart);
                },
                    backgroundColor:Colors.white, child:
                Icon(Icons.badge,color: ColorTheme.themeColor,)
                ),
             CircleAvatar(
                    radius: 10,
                    backgroundColor:  ColorTheme.themeColor,
                    child:   const Text('1',style: TextStyle(fontWeight: FontWeight.w900,color: Colors.white,fontSize: 16),)
                )
              ],
            ): const SizedBox();

    ;
  }
}