

import 'package:elfardos/controller/controllerLogin/controllerLogin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model&widget/widget/loginWidget/bottom.dart';
import '../../model&widget/widget/loginWidget/textField.dart';
import '../../model&widget/widget/profile/profileWidget.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);
  ControllerLogin _controllerLogin =Get.find();
  var controllerEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBarProfile(
          context: context,
          title: 'Edit Profile'
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: LayoutBuilder(
          builder: (context,boxSize){
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    child: Column(children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius:boxSize.maxHeight*0.14,
                            backgroundColor: Colors.grey[400],
                          ),
                          CircleAvatar(
                            radius:boxSize.maxHeight*0.02,
                            backgroundColor: Colors.grey[300],
                            child: const Icon(Icons.camera_alt,color: Colors.black,size: 20,),
                          ),
                        ],
                      ),
                      SizedBox(height: boxSize.maxHeight*0.01,),
                      Text('${_controllerLogin.userData.user!.name}',style: Theme.of(context).textTheme.headlineLarge,),
                      SizedBox(height: boxSize.maxHeight*0.02,),
                    ],),
                  ),

                  SizedBox(
                    width: boxSize.minWidth*0.90,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('User Name',style:Theme.of(context).textTheme.bodySmall),
                        SizedBox(height: boxSize.maxHeight*0.01,),
                        Field(null,
                            null,
                            namehient:'${_controllerLogin.userData.user!.name}',
                            keyboard:TextInputType.name ,
                            valid: (v){},
                            controller: controllerEmail),

                        SizedBox(height: boxSize.maxHeight*0.02,),
                        Text('Email',style:Theme.of(context).textTheme.bodySmall),
                        SizedBox(height: boxSize.maxHeight*0.01,),
                        Field(null,
                            null,
                            namehient: '${_controllerLogin.userData.user!.email}',
                            keyboard:TextInputType.name ,
                            valid: (v){},
                            controller: controllerEmail),

                      ],
                    ),
                  ),

                  SizedBox(height: boxSize.maxHeight*0.05,),
            Container(
              width: boxSize.maxWidth*0.85,
              child:       Center(
                child:    CustombButton(
                    'Save ',
                        () {
                      // Get.toNamed(pAllOrders);
                      // _cartFavorites.FItemsCount();
                    },
                    2),
              ),
            ),
                  Container(
                    height: boxSize.maxHeight*0.20,
                    padding:const  EdgeInsets.symmetric(horizontal: 20),
                    child:   Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customRowBottom(title: 'Add Account',
                            widget:Icon( Icons.arrow_forward_ios,color: Colors.grey[900],size: 18,),
                            context: context, onTap: () {  }),
                        SizedBox(height: boxSize.maxHeight*0.01,),
                        customRowBottom(title: 'Change Password',
                            widget:Icon( Icons.arrow_forward_ios,color: Colors.grey[900],size: 18,),
                            context: context, onTap: () {  }),
                      ],
                    ),
                  )

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
