import 'package:elfardos/model&widget/widget/loginWidget/bottom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class VerificationSignUp extends StatelessWidget {
  const  VerificationSignUp ({Key? key}) : super(key: key);

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
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: LayoutBuilder(
                builder: (context,boxConstraints){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: boxConstraints.minWidth,
                        height: boxConstraints.minHeight*0.25,
                        child: Image.asset('images/logo.jpg'),
                      ),
                      SizedBox(height: boxConstraints.minHeight*0.02,),
                      //verification Code has been sent to
                      Text('Your email is being verified ' ,
                          style: TextStyle(fontSize: 17,color: Colors.black87,fontWeight: FontWeight.w900)),
                      SizedBox(height: boxConstraints.minHeight*0.01,),
                      Text('verification Code has been sent to ' ,
                          style: TextStyle(fontSize: 17,color: Colors.black87,fontWeight: FontWeight.w900)),
                      SizedBox(height: boxConstraints.minHeight*0.01,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('Test@gmail.com' ,style: TextStyle(fontSize: 17,color: Colors.black45,fontWeight: FontWeight.w900)),
                          InkWell(
                            onTap: (){},
                            child: Text('change',style:TextStyle(fontSize: 17,color: Colors.blueAccent,fontWeight: FontWeight.w900),),
                          )
                        ],
                      ),
                      SizedBox(height: boxConstraints.minHeight*0.10,),
                      OTPTextField(

                        outlineBorderRadius:10,
                        length: 4,
                        width: MediaQuery.of(context).size.width *0.85,
                        fieldWidth: 60,
                        contentPadding:EdgeInsets.symmetric(horizontal: 15,vertical:15),
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
                      Container(
                        width: boxConstraints.minWidth*0.70,
                        child: CustombButton('Next',(){
                          Get.toNamed('');
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
