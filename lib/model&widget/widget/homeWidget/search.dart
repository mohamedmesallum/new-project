import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController controllerText ;
  final String? Function(String?) valid;
  final String nameHint;
  final double width;
  const SearchWidget({Key? key, required this.controllerText, required this.valid, required this.nameHint, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      elevation: 3,
      shadowColor: Colors.grey,
      child:    Container(
        alignment: Alignment.center,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1,color: Colors.white),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Container(
            alignment: Alignment.center,
            // height: 65,

            padding: const EdgeInsets.only(left: 5,bottom:5,right:5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
            ),
            child:Center(
              child:  TextFormField(

                //  key: Key(nameHint),
                  controller: controllerText,
                  validator: valid,
                  keyboardType:TextInputType.name,
                  style:const TextStyle(
                    fontSize: 18,color: Colors.black,fontWeight: FontWeight.w900,
                  ),
                  decoration: InputDecoration(

                      errorStyle: TextStyle(fontSize: 17,color: Colors.red,fontWeight: FontWeight.w800,),
                      enabledBorder:InputBorder.none,
                      disabledBorder:InputBorder.none,
                      // errorBorder:InputBorder.none,
                      focusedBorder:InputBorder.none,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Icon(Icons.search_rounded)
                      ),
                      //Icon(,size:28,color: Colors.black38,),
                      hintText:nameHint,
                      hintStyle: TextStyle(fontWeight: FontWeight.w800,fontSize: 16,color: Color(0xffb6b7b7),)

                  )

              ),
            )
        ),
      ),
    );
  }
}