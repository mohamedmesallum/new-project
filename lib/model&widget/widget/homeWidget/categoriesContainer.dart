
import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:flutter/material.dart';

class ContainerCategories extends StatelessWidget {
  final BoxConstraints boxConstraints ;
  final String name ;
  final Function() onTap;
  final String image;
  //https://buylebanese.com/database/photos/128b.jpg
  const ContainerCategories ({Key? key, required this.boxConstraints, required this.name, required this.onTap, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      highlightColor: Colors.redAccent,
      onTap: onTap,
      child: Container(
        padding:const  EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: ColorTheme.backGroundGrey
            ,

            borderRadius: BorderRadius.circular(18)
        ),
        child:Row(
          children: [
            CircleAvatar(
              radius: boxConstraints.maxWidth*0.06,
              backgroundImage:  NetworkImage(image),
            ),
            Text(
              name
              ,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color:ColorTheme.themeColor
            ),),

          ],
        ),
      ),
    );
  }
}
