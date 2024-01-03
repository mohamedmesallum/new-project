import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:flutter/material.dart';

class TabBarOrders extends StatelessWidget {
  final BoxConstraints boxSize;
  const TabBarOrders({Key? key, required this.boxSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return

      SizedBox(
        height: boxSize.maxHeight*0.08,
        width: boxSize.maxWidth*0.50,
        child: TabBar(
          physics:const  ClampingScrollPhysics(),
          indicatorSize: TabBarIndicatorSize.label,
          padding: const EdgeInsets.all(10),
          indicator: BoxDecoration(
            boxShadow:const  [BoxShadow(color:Colors.grey,spreadRadius: 0.6,blurRadius: 7)],
              color: Colors.grey[400],
              border: Border.all(color: ColorTheme.backGroundGrey,width: 1.5),
              // border: Border.all(color: Colors.white,width: 0),
              borderRadius: BorderRadius.circular(25)
          ),
          labelStyle:Theme.of(context).textTheme.headlineMedium,
          labelColor: Colors.white,
          unselectedLabelColor:  Colors.black,
          isScrollable: true,
          unselectedLabelStyle:Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 14,fontWeight: FontWeight.w800
          ),
          tabs: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black12,
              ),
              alignment: Alignment.center,
           //   width: boxSize.maxWidth*0.20,
              child: const Text('Waiting'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(30),
                color: Colors.black12,
              ),
              alignment: Alignment.center,
          //    width: boxSize.maxWidth*0.40,
              child: const Text('Complete'),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black12,
              ),
              alignment: Alignment.center,
           //   width: boxSize.maxWidth*0.40,
              child: const Text('Rejected'),
            ),

          ],
        ),
      );
  }
}