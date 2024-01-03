

import 'package:elfardos/controller/home/controller_address.dart';
import 'package:elfardos/model&widget/widget/profile/profileWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerAddress extends StatelessWidget {
final String name;
final Function() onTap;
String? notes;
String? phone;
final Widget widget;

   ContainerAddress({Key? key, required this.name,this.phone,this.notes, required this.onTap, required this.widget}) : super(key: key);
ControllerAddress _controllerAddress = Get.find();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child:  Card(
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(8),
       ),
shadowColor: Colors.grey,
  elevation: 2,
        child: Container(
            width: MediaQuery.of(context).size.width ,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child:Stack(

              alignment: Alignment.topRight,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    profileWidget(
                        null,
                        onTap:(){} ,
                        titel: name,
                        icons: Icons.home ,
                        context: context
                    ),
                    if(phone!='null')
                    profileWidget(
                        null,
                        onTap:(){} ,
                        titel: '${phone!}',
                        icons: Icons.phone ,
                        context: context
                    ),
                    if(notes!='null')
                      profileWidget(
                          null,
                          onTap:(){} ,
                          titel: '${notes!}',
                          icons: Icons.note_add ,
                          context: context
                      ),



                  ],
                ),
                widget

              ],
            )
        ),
      )
    );
  }
}
