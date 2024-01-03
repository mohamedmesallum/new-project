import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:flutter/material.dart';

import '../../model&widget/widget/profile/profileWidget.dart';



class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar:customAppBarProfile(
          context: context,
          title: 'Settings'
        ),
        body: Container(
          padding:const  EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const  SizedBox(height: 25),
              customRowBottom(title: 'Language',
                  widget:Icon( Icons.arrow_forward_ios,color: Colors.grey[900],size: 18,),
                  context: context, onTap: () {  }),
              const  SizedBox(height: 25,),
              customRowBottom(title: 'payment',
                  widget:Icon( Icons.arrow_forward_ios,color: Colors.grey[900],size: 18,),
                  context: context, onTap: () {  }),
              const  SizedBox(height: 25,),
              customRowBottom(title: 'Notifications',
                  widget:Switch(value: true, onChanged:(value){},
                    activeColor: Colors.white,activeTrackColor: ColorTheme.themeColor,),
                  context: context, onTap: () {  }),
              const  SizedBox(height: 50,),
              Center(
                child:  Text("Log out",style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.grey[700]
                ),),
              )


            ],
          ),
        )
    );
  }
}