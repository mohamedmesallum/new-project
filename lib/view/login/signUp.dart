
import 'package:elfardos/controller/controllerLogin/controllerLogin.dart';
import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:elfardos/core/routes/namePages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/function/statusRequest.dart';
import '../../model&widget/widget/loginWidget/bottom.dart';
import '../../model&widget/widget/loginWidget/textField.dart';

class SignUp extends StatelessWidget {
  ControllerLogin _controller  = Get.find();
  SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body:  Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: LayoutBuilder(
             builder: (context,boxConstraints){
               return SingleChildScrollView(
                 child: Column(
                   children: [

                     SizedBox(
                       width: double.infinity,
                       height: boxConstraints.minHeight*0.23,
                       child:  Image.asset('images/logo.jpg',),
                     ),
                     SizedBox(height: boxConstraints.minHeight*0.03,),

                       Form(
                         key: _controller.formSignUp,
                         child: Column(
                         children: [
                           Container(
                               padding:  const EdgeInsets.symmetric(horizontal: 3),
                               width: boxConstraints.minWidth*0.85,
                               child:
                               Field(
                                 const Icon(Icons.person,size: 18,),
                                 null,
                                 namehient:'Name',
                                 controller: _controller.controllerNameSignUp,
                                 valid: (value){},
                                 keyboard:TextInputType.emailAddress ,)

                           ),
                           SizedBox(height: boxConstraints.minHeight*0.02,),
                           Container(
                               padding:  const EdgeInsets.symmetric(horizontal: 3),
                               width: boxConstraints.minWidth*0.85,
                               child:
                               Field(
                                 const Icon(Icons.email,size: 18,),
                                 null,
                                 namehient:'Email',
                                 controller: _controller.controllerEmailSignUp,
                                 valid: (value){},
                                 keyboard:TextInputType.emailAddress ,)

                           ),


                           SizedBox(height: boxConstraints.minHeight*0.02,),
                          Container(
                            padding:  const EdgeInsets.symmetric(horizontal: 3),
                             width: boxConstraints.minWidth*0.85,
                             child:
                             Field(
                               const Icon(Icons.visibility,size: 18,),
                               null,
                               namehient:'Password',
                               controller: _controller.controllerPasswordSignUp,
                               valid: (value){},
                               keyboard:TextInputType.emailAddress ,),
                           ),
                           SizedBox(height: boxConstraints.minHeight*0.02,),
                         Container(
                           padding:  const EdgeInsets.symmetric(horizontal: 3),
                             width: boxConstraints.minWidth*0.85,
                             child:
                             Field(
                               const Icon(Icons.visibility,size: 18,),
                               null,
                               namehient:'Confirm Password',
                               controller: _controller.controllerConfirmPassword,
                               valid: (value){},
                               keyboard:TextInputType.emailAddress ,),
                           ),
                           SizedBox(height: boxConstraints.minHeight*0.02,),
                           Padding(padding:const  EdgeInsets.symmetric(horizontal: 10,),
                             child:     Row(
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 Radio(value: 'value', groupValue:' groupValue', onChanged: (String? value){}),
                                 Text("I agree to the terms and conditions ",style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                     color: Colors.blueGrey)),
                               ],
                             ),
                           ),
                           SizedBox(height: boxConstraints.minHeight*0.01,),
                           SizedBox(
                             width: boxConstraints.minWidth*0.80,
                             child: GetBuilder<ControllerLogin>(
                               builder: (_controller){
                                 return
                                   _controller.statusRequestSignUp==StatusRequest.loading?
                                       Center(
                                         child: CircularProgressIndicator(color: ColorTheme.themeColor,),
                                       ):
                                   CustombButton('Login',(){
                                   _controller.signUp();
                                   //.then((value) => Get.toNamed(pVerificationSignUp)
                                 },7);
                               },
                             )
                           )

                         ],
                       ),),


                     SizedBox(height: boxConstraints.maxHeight*0.07,),
                      Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                         Text('Already have an account ! ',style:  Theme.of(context).textTheme.bodySmall,),
                        const SizedBox(width: 4,),
                       InkWell(
                         onTap:(){
                           Get.back();
                         } ,
                         child:   Text('Sign in',style:  Theme.of(context).textTheme.bodyMedium?.copyWith(
                             color: ColorTheme.themeColor
                         ),),
                       )
                       ],
                     ),



                   ],
                 ),
               );
    },
        ),
      ),

    );
  }
}
