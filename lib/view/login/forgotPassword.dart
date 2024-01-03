
import 'package:elfardos/core/routes/namePages.dart';
import 'package:elfardos/model&widget/widget/loginWidget/bottom.dart';
import 'package:elfardos/model&widget/widget/loginWidget/dialogWidget.dart';
import 'package:elfardos/model&widget/widget/loginWidget/textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
 var controllerEmail = TextEditingController();

  ForgotPassword({super.key});
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
          physics: const NeverScrollableScrollPhysics(),
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
                    height: boxConstraints.minHeight*0.30,
                    child: Image.asset('images/logo.jpg'),
                  )  ,
                    SizedBox(height: boxConstraints.minHeight*0.05,),
                    Text('Enter Your Email to Reset Password',style: Theme.of(context).textTheme.bodyMedium,),
                    SizedBox(height: boxConstraints.minHeight*0.05,),
                   Container(
                     padding: const EdgeInsets.symmetric(horizontal: 3),
                      width: boxConstraints.minWidth*0.85,
                      child: Field(const Icon(Icons.email,color:Colors.black45,size: 22,),null ,
                namehient:'Email',
                controller: controllerEmail,
                valid: (value){},

                keyboard:TextInputType.emailAddress ,),
                ),
                    SizedBox(height: boxConstraints.minHeight*0.05,),
                    Container(
                      width: boxConstraints.minWidth*0.70,
                      child: CustombButton('Next',(){
                        widgetDialog(
                            context: context,
                            nameImage: 'images/sendemail.jpg',
                            textBody:'please check your email and follow the  instruction to reset your password',
                            textTitle: 'Confirmation Email Sent',
                            widget: Center(
                              child: Container(
                                  margin: const EdgeInsets.all(10),
                                width: boxConstraints.minWidth*0.50,
                                  child: CustombButton('Ok',(){
                                    Navigator.of(context).pop();
                                    Get.toNamed(pVerificationResetPas);
                                  },7)
                              ),
                            )
                        );
                      },7),
                    )

                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
