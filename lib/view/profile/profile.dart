
import 'package:elfardos/controller/home/controller_orders.dart';
import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/controller_address.dart';
import '../../core/routes/namePages.dart';
import '../../model&widget/widget/profile/profileWidget.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  ControllerOrders _orders = Get.put(ControllerOrders());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      child:LayoutBuilder(
        builder: (context,boxConstraints){
          return ListView(
            children: [
              SizedBox(
                width: boxConstraints.maxWidth,
                height: boxConstraints.maxHeight* 0.35,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                          CircleAvatar(
                            radius:boxConstraints.maxWidth*0.18 ,
                            backgroundColor: Colors.black12,
                          ),
                    SizedBox(height: boxConstraints.maxHeight*0.01,),
                    Text('user name ,',style: Theme.of(context).textTheme.bodyMedium),
                    Opacity(opacity:0.7 ,child: Chip(label: Text('Edit Profile',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,fontSize: 14
                    ),),backgroundColor: ColorTheme.themeColor,),)
                  ],
                ),

              ),
              profileWidget(
                  null,
                onTap:(){} ,
               titel: 'Personal Profile',
               icons: Icons.person ,
                context: context
              ),
              profileWidget(
                  null,
                  onTap:(){
                    _orders.getOrders().then((value) {
                      Get.toNamed(pMyOrders);
                    });
                  } ,
                  titel: 'My Orders',
                  icons: Icons.shopping_basket_sharp ,
                  context: context
              ),
              profileWidget(
                  null,
                  onTap:(){
                   Get.toNamed(pMyAddress);
                    // _controllerAddress.getAddress();
                  } ,
                  titel: 'My Address',
                  icons: Icons.home_work_sharp ,
                  context: context
              ),
              profileWidget(
                null,
                  onTap:(){} ,
                  titel: 'Messages',
                  icons: Icons.mark_email_unread_rounded ,
                  context: context
              ),
              profileWidget(
                  null,
                  onTap:(){
                    Get.toNamed(pSettings);
                  } ,
                  titel: 'Settings',
                  icons: Icons.settings ,
                  context: context
              ),
              profileWidget(
                  null,
                  onTap:(){} ,
                  titel: 'Info app',
                  icons: Icons.app_shortcut ,
                  context: context
              ),
              profileWidget(
                  null,
                  onTap:(){} ,
                  titel: 'Sign Out',
                  icons: Icons.logout ,
                  context: context
              )


            ],
          );
        },
      )
        ,),
    );
  }
}
