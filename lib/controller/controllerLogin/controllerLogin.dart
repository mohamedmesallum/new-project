import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:elfardos/core/data/login/funcationLogin.dart';
import 'package:elfardos/core/function/statusRequest.dart';
import 'package:elfardos/core/routes/namePages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/function/hindlinData.dart';
import '../../core/function/methodGPUD.dart';
import '../../model&widget/model/user.dart';
import '../../model&widget/widget/loginWidget/dialogWidget.dart';

abstract class LoginController extends GetxController{
 Future signIn();
 Future signUp();
}
class ControllerLogin extends LoginController{
  FunctionLogin functionLogin = FunctionLogin(Get.put(Method()));
 late UserData userData;
  StatusRequest? statusRequestSignIn ;
  StatusRequest? statusRequestSignUp;
  var controllerEmailSignIn = TextEditingController();
  var controllerPasswordSignIn = TextEditingController();
  var controllerEmailSignUp = TextEditingController();
  var controllerPasswordSignUp = TextEditingController();
  var controllerNameSignUp = TextEditingController();
  var controllerConfirmPassword = TextEditingController();
  GlobalKey<FormState> formSignIn=  GlobalKey<FormState>();
  GlobalKey<FormState> formSignUp=  GlobalKey<FormState>();


  @override
  Future signIn()async {
  var formData = formSignIn.currentState;
  if(formData!.validate()){
  try{
  statusRequestSignIn = StatusRequest.loading;
  update();
  var response = await  functionLogin.signIn(data: {
    'email':controllerEmailSignIn.text,
    'password':controllerPasswordSignIn.text,
  });
     statusRequestSignIn = handlingData(response);
     update();
     if(statusRequestSignIn==StatusRequest.success){
       if(response['status']==200){
         userData = UserData.fromJson(response);
         print(userData.accessToken);
         Get.offAllNamed(pBottomBar);
         print('success sign in ');
         update();
       }else {
         dialogError(
             null,
             context: Get.context!,
             title: '${response['error']}',
             dialogType: DialogType.error
         );
         update();
       }
     }else if (statusRequestSignIn == StatusRequest.internetFailure){
       dialogError(
           null,
           context: Get.context!,title: 'There is no internet connection',dialogType: DialogType.error );

           }else{
       dialogError(
           null,
           context: Get.context!,
           title: 'Something went wrong, please try again',
           dialogType: DialogType.error
       );
     }

     update();
  }catch(e){
    dialogError(
        null,
        context: Get.context!,
        title: 'Something went wrong, please try again',
        dialogType: DialogType.error
    );
print(e.toString());

  }
  }
  }

  @override
  Future signUp() async {
    var formData = formSignUp.currentState;
    if(formData!.validate()){
      try{
        statusRequestSignUp = StatusRequest.loading;
        update();
        var response = await  functionLogin.signUp(data: {
          'email':controllerEmailSignUp.text,
          'password':controllerPasswordSignUp.text,
          'name':controllerNameSignUp.text,
        });
        statusRequestSignUp = handlingData(response);
        update();
        if(statusRequestSignUp==StatusRequest.success){
          if(response['status']==200){
            userData = UserData.fromJson(response);
            Get.offAllNamed(pBottomBar);
            print(userData.accessToken);
            print('success sign in');
            update();
          }else {
            dialogError(
              null,
                context: Get.context!,
                title: '${response['error']}',
                dialogType: DialogType.error
            );
            update();
          }
        }else if (statusRequestSignIn == StatusRequest.internetFailure){
          dialogError( null,context: Get.context!,title: 'There is no internet connection',dialogType: DialogType.error );

        }else{
          dialogError(
              null,
              context: Get.context!,
              title: 'Something went wrong, please try again',
              dialogType: DialogType.error
          );
        }

        update();
      }catch(e){
        dialogError(
            null,
            context: Get.context!,
            title: 'Something went wrong, please try again',
            dialogType: DialogType.error
        );
        print(e.toString());

      }
    }
  }

}
