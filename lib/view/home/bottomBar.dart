
import 'package:elfardos/controller/controllerLogin/controllerLogin.dart';
import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:elfardos/core/data/url.dart';
import 'package:elfardos/view/home/cart.dart';
import 'package:elfardos/view/home/favorite.dart';
import 'package:elfardos/view/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../profile/profile.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  ControllerLogin _controllerLogin = Get.find();
 int currentIndex = 0;
 List<Widget> pages = [
   Home(),
   Favorite(),
   Cart(),
   Profile(),
 ];
       @override
    Widget build(BuildContext context) {
            return
              Scaffold(
                appBar:AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage('http://10.0.2.2:8000/images/73.jpg'),
                      ),
                      SizedBox(width: 7,),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text('welcome , ${_controllerLogin.userData.user!.name}' ,style: Theme.of(context).textTheme.bodySmall?.copyWith(
                         color: Colors.black45,fontSize: 14
                     ),),
                     Text('Enjoy the best products and offers' ,style: Theme.of(context).textTheme.bodySmall?.copyWith(
                         color: Colors.black45 ,fontSize: 14
                     ),)
                   ],
                 )

                    ],
                  ),
                  actions:  [
                    InkWell(
                      onTap:(){
                        // _cartFavorites.getFavorites().then((value) => print(_cartFavorites.statusRequestGetFavorites));
                      },
                      child:const   Icon(Icons.shopping_cart,color:Colors.black54,size: 22,),
                    ),
                    const  SizedBox(width: 7,),
                    InkWell(
                      onTap: (){
                        //   _cartFavorites.getCart().then((value) => print(_cartFavorites.statusRequestGetCart));
                      },
                      child: const  Icon(Icons.dehaze_rounded,color: Colors.black54,size: 22,),
                    ),
                    const  SizedBox(width: 9,),
                  ],
                ),
                bottomNavigationBar:
                SalomonBottomBar(
                  selectedColorOpacity: 0.8,
                  itemPadding:const  EdgeInsets.symmetric(horizontal: 20,vertical: 4),
                 selectedItemColor:ColorTheme.themeColor,
                  unselectedItemColor: Colors.white,
                  backgroundColor: Colors.white,
                  currentIndex:currentIndex,
                  onTap: (i){
                    setState(() {
                      currentIndex=i;
                    });
              },
                  items: [
                    SalomonBottomBarItem(
                      icon:  Icon(Icons.home,color: ColorTheme.themeColor,),
                      title:  Text("Home",style: TextStyle(color: Colors.white),),
                    ),
                    SalomonBottomBarItem(


                      icon: Icon(Icons.favorite,color:  ColorTheme.themeColor),
                      title:const  Text("Favorite",style: TextStyle(color: Colors.white),),
                    ),
                    SalomonBottomBarItem(

                      icon:  Icon(Icons.shopping_basket_sharp,color: ColorTheme.themeColor),
                      title: const Text("Cart",style: TextStyle(color: Colors.white)),
                    ),

                    SalomonBottomBarItem(
                      icon:  Icon(Icons.person,color:  ColorTheme.themeColor),
                      title:const  Text("Profile",style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),

                body:pages.elementAt(currentIndex),
              );




}
}
/*
Text('Al Fardos', style: Theme
                      .of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(
                    color: ColorTheme.themeColor,
                    fontFamily: ' Cairo',
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    shadows: [const Shadow(color:Colors.black,blurRadius: 3 ,)],
                  )),
 */