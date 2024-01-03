import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



Widget priceWidget({required double textSize,required int price}){
  return       Row(
    crossAxisAlignment: CrossAxisAlignment.end,
    mainAxisAlignment: MainAxisAlignment.start,
    children:  [
    const  SizedBox(width: 8,),
      Text('\$',style: TextStyle(fontWeight: FontWeight.w900,
          fontSize: textSize,color: Colors.red),),
    const  SizedBox(width: 1,),
      Text(price.toString(),style: TextStyle(fontWeight: FontWeight.w900,
          fontSize: textSize,color: Colors.red),),
    ],
  );
}
class CountProduct extends StatefulWidget {
  late final int count;
 CountProduct({Key? key,required this.count, }) : super(key: key);

  @override
  State<CountProduct> createState() => _CountProductState();
}

class _CountProductState extends State<CountProduct> {
  int value = 1 ;
@override
  void initState() {
    value = widget.count;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: (){
          setState(() {
          value++;
          widget.count =value;
          });
          },
          child:  Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.grey[300],
            ),
            child:const  Icon(Icons.add,size: 18,color: Colors.black54,),
          ),
        ),

        const  SizedBox(width: 8,),
        Text('${widget.count!}',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.red, fontSize: 16
        ),),
        const  SizedBox(width: 8,),
        InkWell(
          onTap: (){
            setState(() {
              value--;
              widget.count = value;
            });
          },
          child:  Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.grey[300],
            ),
            child:const  Center(child: Icon(Icons.remove,size: 18,color: Colors.black54,),),
          ),
        )


      ],);
  }
}





 Widget stars({required int rating}){
return
rating ==5?
  const Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children:  [
      Icon(Icons.star,color: Colors.yellow,size: 18,),
      Icon(Icons.star,color: Colors.yellow,size: 18,),
      Icon(Icons.star,color: Colors.yellow,size: 18,),
      Icon(Icons.star,color: Colors.yellow,size: 18,),
      Icon(Icons.star,color: Colors.yellow,size: 18,),

    ],):
rating ==4?
const Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children:  [
    Icon(Icons.star,color: Colors.yellow,size: 18,),
    Icon(Icons.star,color: Colors.yellow,size: 18,),
    Icon(Icons.star,color: Colors.yellow,size: 18,),
    Icon(Icons.star,color: Colors.yellow,size: 18,),
    Icon(Icons.star,color: Colors.grey,size: 18,),

  ],):
rating ==3?
const Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children:  [
    Icon(Icons.star,color: Colors.yellow,size: 18,),
    Icon(Icons.star,color: Colors.yellow,size: 18,),
    Icon(Icons.star,color: Colors.yellow,size: 18,),
    Icon(Icons.star,color: Colors.grey,size: 18,),
    Icon(Icons.star,color: Colors.grey,size: 18,),

  ],):
rating ==2?
const Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children:  [
    Icon(Icons.star,color: Colors.yellow,size: 18,),
    Icon(Icons.star,color: Colors.yellow,size: 18,),
    Icon(Icons.star,color: Colors.grey,size: 18,),
    Icon(Icons.star,color: Colors.grey,size: 18,),
    Icon(Icons.star,color: Colors.grey,size: 18,),

  ],):
rating ==1?
const Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children:  [
    Icon(Icons.star,color: Colors.yellow,size: 18,),
    Icon(Icons.star,color: Colors.grey,size: 18,),
    Icon(Icons.star,color: Colors.grey,size: 18,),
    Icon(Icons.star,color: Colors.grey,size: 18,),
    Icon(Icons.star,color: Colors.grey,size: 18,),

  ],):

rating ==0 ?
const Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children:  [
    Icon(Icons.star,color: Colors.grey,size: 18,),
    Icon(Icons.star,color: Colors.grey,size: 18,),
    Icon(Icons.star,color: Colors.grey,size: 18,),
    Icon(Icons.star,color: Colors.grey,size: 18,),
    Icon(Icons.star,color: Colors.grey,size: 18,),

  ],):
    rating==null?
       const  SizedBox():
      const   SizedBox();









}