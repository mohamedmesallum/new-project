import 'package:elfardos/core/routes/namePages.dart';
import 'package:elfardos/model&widget/widget/loginWidget/bottom.dart';
import 'package:elfardos/model&widget/widget/loginWidget/dialogWidget.dart';
import 'package:elfardos/model&widget/widget/loginWidget/textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ResetPassword extends StatelessWidget {
var controllerEmail = TextEditingController();
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
        child:SingleChildScrollView(
          child:  Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: LayoutBuilder(
                builder: (context,boxConstraints){
                  return
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: boxConstraints.minWidth,
                          height: boxConstraints.minHeight*0.25,
                          child: Image.asset('images/logo.jpg'),
                        ),
                        SizedBox(height: boxConstraints.minHeight*0.02,),
                        Text('Enter the new password',style: Theme.of(context).textTheme.bodyMedium,),
                        SizedBox(height: boxConstraints.minHeight*0.05,),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          width: boxConstraints.minWidth*0.85,
                          child: Field( const Icon(Icons.visibility,color:Colors.black45,size: 22,),null ,
                            namehient:'Password',
                            controller: controllerEmail,
                            valid: (value){},

                            keyboard:TextInputType.emailAddress ,),
                        ),
                        SizedBox(height: boxConstraints.minHeight*0.02),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          width: boxConstraints.minWidth*0.85,
                          child: Field(const Icon(Icons.visibility,color:Colors.black45,size: 22,),null ,
                            namehient:'Confirm Password',
                            controller: controllerEmail,
                            valid: (value){},

                            keyboard:TextInputType.emailAddress ,),
                        ),
                        SizedBox(height: boxConstraints.minHeight*0.10),
                        Container(
                          width: boxConstraints.minWidth*0.70,
                          child: CustombButton('Save',(){
                            widgetDialog(
                                context: context,
                                nameImage: 'images/changePsw.jpg',
                                textBody:'Your Password has been Changed successfully',
                                textTitle: 'Password Changed',
                                widget: Center(
                                  child: Container(
                                    margin: const EdgeInsets.all(10),
                                      width: boxConstraints.minWidth*0.50,
                                      child: CustombButton('Ok',(){
                                      Navigator.of(context).pop();
                                       // Get.offAllNamed(pSignIn);
                                        Get.offAllNamed(pSignIn);
                                      },7)
                                  ),
                                )
                            );

                          },7),
                        )

                      ],
                    );
                }
            ),
          ),
        )
      ),
    );
  }
}

