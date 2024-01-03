
import 'package:elfardos/controller/controllerLogin/controllerLogin.dart';
import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:elfardos/core/function/statusRequest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/routes/namePages.dart';
import '../../model&widget/widget/loginWidget/bottom.dart';
import '../../model&widget/widget/loginWidget/textField.dart';

class SignIn extends StatelessWidget {
  ControllerLogin _controller = Get.find();
  SignIn({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:   SingleChildScrollView(
     physics:const  NeverScrollableScrollPhysics(),
      child: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: LayoutBuilder(
              builder: (context,boxConstraints){
                return Column(

                  children: [
                    SizedBox(height: boxConstraints.minHeight*0.05,),
                    SizedBox(
                        width: double.infinity,
                        height: boxConstraints.minHeight*0.30,
                        child: Center(child: Image.asset('images/logo.jpg',),)
                    ),
                    SizedBox(height: boxConstraints.minHeight*0.05,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.85,
                  //    height: boxConstraints.minHeight*0.50,
                      child: Form(
                        key: _controller.formSignIn,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 3),
                              child:    Field(
                                const  Icon(Icons.email,color:  Colors.black45,size: 18),
                                null ,
                                namehient:'Email',
                                controller: _controller.controllerEmailSignIn,
                                valid: (value){
                                  if(value!.isEmpty){
                                    return 'required';
                                  }
                                },

                                keyboard:TextInputType.emailAddress ,),
                            ),
                            SizedBox(height: boxConstraints.minHeight*0.02,),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 3),
                              child:      Field(
                                const Icon(Icons.visibility,color: Colors.black45,size: 18,),
                                null ,
                                namehient:'Password',
                                controller: _controller.controllerPasswordSignIn,
                                valid: (value){
                                  if(value!.isEmpty){
                                    return 'required';
                                  }
                                },
                                keyboard:TextInputType.visiblePassword ,),
                            ),
                            SizedBox(height: boxConstraints.minHeight*0.02,),
                            InkWell(
                              onTap: (){
                                Get.toNamed(pForgotPassword);
                              },
                              child:Text('Forget Password ? ',style:  Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Colors.black87
                              ),),
                            ),
                            SizedBox(height: boxConstraints.minHeight*0.05,),
                         GetBuilder<ControllerLogin>(
                             builder: (controller){
                           return
                           controller.statusRequestSignIn==StatusRequest.loading?
                               Center(
                                 child: CircularProgressIndicator(color: ColorTheme.themeColor,),
                               ):
                             CustombButton('Login',(){
                              controller.signIn();
                          // Get.offAllNamed(pBottomBar);
                           },7);
                         }),
                            SizedBox(height: boxConstraints.minHeight*0.04,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const   Expanded(child:Divider(thickness: 1,color: Colors.black45,),),
                                Padding(padding: const EdgeInsets.symmetric(horizontal:5,),
                                  child:   Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Login using',style: Theme.of(context).textTheme.bodyMedium),
                                      SizedBox(height: boxConstraints.maxHeight*0.02,),
                                      const CircleAvatar(
                                        radius: 15,
                                        backgroundImage: AssetImage('images/logofas.webp'),
                                      )
                                    ],
                                  ),),
                                const Expanded(child: Divider(thickness: 1,color: Colors.black45,),),
                              ],
                            )
                          ],
                        ),
                      )
                    ),
                    SizedBox(height: boxConstraints.maxHeight*0.05,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("I don't have an account ! ",style: Theme.of(context).textTheme.bodySmall),
                        InkWell(
                          onTap: (){
                            Get.toNamed(pSignUp);
                          },
                          child:Text("Sign Up ",style:  Theme.of(context).textTheme.bodyMedium?.copyWith(
                           color: ColorTheme.themeColor
                               ))),
                      ],
                    )
                  ],
                );
              }
          ),
        ),
      ),
    )
    );
  }
}
