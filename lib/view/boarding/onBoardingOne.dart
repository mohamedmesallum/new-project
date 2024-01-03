
import 'package:flutter/material.dart';

class OnBoardingOne extends StatelessWidget {
  const OnBoardingOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: LayoutBuilder(
          builder: (context,boxConstraints){
            return 
                Column(
                  children: [
                  Container(
                    height: boxConstraints.minHeight*0.35,
                    width:boxConstraints.minWidth,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(''),
                      )
                    ),
                  ),
                    SizedBox(height: boxConstraints.minHeight*0.3,),

                  ],
                );
          },
        ),
      ),
    );
  }
}
