import 'package:flutter/material.dart';

class Field extends StatelessWidget {
  final String namehient;
  Widget? prefixIcons;
  final TextInputType  keyboard;
  Widget? suffixIcons;
  final String? Function(String?) valid;
  final TextEditingController controller;


  Field(this.suffixIcons,this.prefixIcons,{required this.namehient,required this.keyboard,
    required this.valid,required this.controller});
  @override
  Widget build(BuildContext context) {
    return  Container(
      alignment: Alignment.center,
      // height: 65,

      padding: const EdgeInsets.only(left: 4,right: 4),
      decoration: BoxDecoration(
          color: Colors.grey[100],

          borderRadius: BorderRadius.circular(20)
      ),
      child: TextFormField(
          controller: controller,
          validator: valid,
          keyboardType:keyboard,


          style:Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.black,fontSize: 17
          ),
          decoration: InputDecoration(
            errorMaxLines: 2,

            filled: true,

              errorStyle:Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.red
              ),
              enabledBorder:InputBorder.none,
              disabledBorder:InputBorder.none,
              // errorBorder:InputBorder.none,
              focusedBorder:InputBorder.none,
              prefixIcon:prefixIcons,
              //Icon(,size:28,color: Colors.black38,),

              suffixIcon:suffixIcons,
              hintText:namehient,
              hintStyle:  Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.black38
              )

          )

      ),
    );

  }
}