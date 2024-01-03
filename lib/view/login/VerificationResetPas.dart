
import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:elfardos/core/routes/namePages.dart';
import 'package:elfardos/model&widget/widget/loginWidget/bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class VerificationResetPas extends StatelessWidget {
  const VerificationResetPas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: LayoutBuilder(
              builder: (context,boxConstraints){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: boxConstraints.minWidth,
                      height: boxConstraints.minHeight*0.25,
                      child: Image.asset('images/logo.jpg'),
                    ),
                    SizedBox(height: boxConstraints.minHeight*0.02,),
                    //verification Code has been sent to
                    Text('Your email is being verified ' ,
                        style: Theme.of(context).textTheme.bodyMedium),
                    SizedBox(height: boxConstraints.minHeight*0.01,),
                    Text('verification Code has been sent to ' ,
                        style: Theme.of(context).textTheme.bodyMedium),
                    SizedBox(height: boxConstraints.minHeight*0.01,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Test@gmail.com' ,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.lightBlue
                        )),
                             InkWell(
                               onTap: (){},
                               child: Text('Resend',style:Theme.of(context).textTheme.bodyMedium?.copyWith(
                                 color: ColorTheme.themeColor
                               ),),
                             )
                      ],
                    ),
                    SizedBox(height: boxConstraints.minHeight*0.10,),
                    OTPTextField(

                      outlineBorderRadius:10,
                      length: 4,
                      width: MediaQuery.of(context).size.width *0.85,
                      fieldWidth: 60,
                      contentPadding:const EdgeInsets.symmetric(horizontal: 15,vertical:15),
                      style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 25
                      ),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      onCompleted: (pin) async{

                        print("Completed:  + $pin");
                        print("Completed: " + pin);
                      },onChanged: (text){
                      print('$text ===========================');
                    },
                    ),
                    SizedBox(height: boxConstraints.minHeight*0.10,),
                    SizedBox(
                      width: boxConstraints.minWidth*0.70,
                      child: CustombButton('Next',(){
                        Get.toNamed(pResetPassword);
                      },7),
                    )





                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
