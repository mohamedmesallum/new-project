
import 'package:elfardos/controller/home/controllerCart&Favorites.dart';
import 'package:elfardos/core/function/HindlingDataView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../core/appTheme/colorTheme.dart';
import '../../core/routes/namePages.dart';
import '../../model&widget/widget/cartFavoriteWidget/containerFavorite.dart';





class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  void initState() {
    ControllerCartFavorites _c = Get.find();
    _c.getFavorites();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<ControllerCartFavorites>(
          builder: (_cartFavorites){
            return _cartFavorites.favoritesMap.isNotEmpty?

              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: LayoutBuilder(
                  builder: (context,boxConstraints){
                    return
                      ListView.builder(
                        physics:const  BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: _cartFavorites.favorites!.data!.length!,
                        itemBuilder: (context,i){
                          return
                            FavoriteContainer(
                                onDismiss: (p){
                                  //  _cartFavorites.addDeleteFavorites(idProduct: _cartFavorites.favorites!.data![i].id!).then((value) => {

                                  //  _cartFavorites.favorites!.data!.remove( _cartFavorites.favorites!.data![i]),


                                  //   });
                                },

                                boxConstraints: boxConstraints,
                                image: 'https://buylebanese.com/database/photos/128b.jpg',
                                price: _cartFavorites.favorites!.data![i].priec!,
                                description: _cartFavorites.favorites!.data![i].description!,
                                name: _cartFavorites.favorites!.data![i].name!,
                                onTap: (){
                                  Get.toNamed(pViewProducts,parameters: {
                                    'idProducts': '${_cartFavorites.favorites!.data![i].id!}'
                                  });
                                },
                                favorite: (){
                                  _cartFavorites.addDeleteFavorites(idProduct: _cartFavorites.favorites!.data![i].id!).then((value) => {
                                    _cartFavorites.favorites!.data!.remove( _cartFavorites.favorites!.data![i])
                                  });
                                } ,
                                discount: 0,
                                id: i);
                        },
                      );
                  //    HandlingDataView(
                    //                         statusRequest: _cartFavorites.statusRequestGetFavorites,
                    //                         widget:
                    //                       );
                  },),
              ):  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.20,
                    child: Lottie.asset('images/lott/animation_lmfguf1z.json'),
                  ),
                  Text('You did not add products to your favorites ! \n Shop now and enjoy the best products' ,
                    textAlign:TextAlign.center,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black54
                    ), ),
                ],
              );
          },
        )
    );
  }
}


/*
   return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: boxConstraints.maxWidth,
                    height: boxConstraints.maxHeight*0.20,
                    child: Lottie.asset('images/lott/animation_lmfguf1z.json'),
                  ),
                  Text('You did not add products to your favorites ! \n Shop now and enjoy the best products' ,
                    textAlign:TextAlign.center,style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.black54
                    ), ),
                ],
              )
 */
