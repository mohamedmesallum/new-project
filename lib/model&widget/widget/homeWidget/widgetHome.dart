import 'package:flutter/material.dart';

Widget seeAll({required BuildContext context , required Function() onTap,required String title}){
  return  Padding(padding: const EdgeInsets.symmetric(horizontal: 4),
    child:   Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: Colors.black
        ),),
        InkWell(
          onTap: onTap,
          child:     Row(
            children: [
              Text('See All',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.red[300],fontSize: 12,
              ),),
              Icon(Icons.double_arrow_sharp,size: 16,color: Colors.red[300])
            ],
          ),
        )


      ],

    ),
  );
}