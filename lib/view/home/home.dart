

import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:elfardos/core/routes/namePages.dart';
import 'package:elfardos/model&widget/widget/homeWidget/categoriesContainer.dart';
import 'package:elfardos/model&widget/widget/homeWidget/productsContainerHome.dart';
import 'package:elfardos/model&widget/widget/homeWidget/widgetHome.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/controllerCart&Favorites.dart';
import '../../controller/home/controllerHome.dart';
import '../../core/data/url.dart';
import '../../core/function/HindlingDataView.dart';

class Home extends StatelessWidget {

 Home({Key? key}) : super(key: key);
 ControllerCartFavorites _cartFavorites = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
          body: Container(
            padding:const  EdgeInsets.symmetric(horizontal: 6),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: LayoutBuilder(
              builder: (context,boxConstraints){
                return GetBuilder<ControllerHome>(
                    builder: (_controller){
                  return HandlingDataView(
                    statusRequest: _controller.statusRequest!,
                    widget: GetBuilder<ControllerHome>(
                      builder: (_controller){
                        return ListView(
                          physics:const  BouncingScrollPhysics(),
                          children: [
                          SizedBox(height: boxConstraints.maxHeight*0.02,),
                            Card(
                              shadowColor: ColorTheme.themeColor,
                              elevation: 2,
                              child: Container(
                                width: boxConstraints.maxHeight,
                                height: boxConstraints.maxHeight*0.25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image:  DecorationImage(
                                      fit: BoxFit.cover,
//http://10.0.2.2:8000/images/userImage.jpg
                                        //$pathUrl/images/${_controller.homeModel!.banner![i].image}
                                        image: NetworkImage('https://buylebanese.com/database/photos/128b.jpg')
                                        //\cors\fierst\storage\app/public
//\cors\fierst\public\user/carts.png  //$pathUrl/storage/app/images/user/carts.png

                                    )
                                ),
                              ),
                            ),

                            SizedBox(height: boxConstraints.maxHeight*0.03,),
                            Container(
                              width: boxConstraints.maxHeight,
                              height: boxConstraints.maxHeight*0.07,
                              alignment: Alignment.center,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder:(context,i)=>SizedBox(width: boxConstraints.maxWidth*0.03,),
                                  itemCount: _controller.homeModel!.categories!.length,
                                  itemBuilder:(context,i){
                                    return
                                      ContainerCategories(
                                        name:_controller.homeModel!.categories![i].name! ,
                                        onTap:(){
                                          Get.toNamed(pCategoriesView,parameters: {
                                            'idCategories':'${_controller.homeModel!.categories![i].id!}',
                                            'name':'${_controller.homeModel!.categories![i].name}',
                                          'nameAr':'${_controller.homeModel!.categories![i].nameAr}',
                                          });
                                        } ,
                                        image: 'https://buylebanese.com/database/photos/128b.jpg',
                                        boxConstraints: boxConstraints,);
                                  }
                              ),
                            ),
                            SizedBox(height: boxConstraints.maxHeight*0.02,),
                            seeAll(context: context, onTap: (){}, title:'Popular' ),
                            SizedBox(height: boxConstraints.maxHeight*0.02,),
                            SizedBox(
                              width: boxConstraints.maxWidth*0.95,
                              height: boxConstraints.maxHeight*0.30,
                              child:ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context,i)=>SizedBox(width: boxConstraints.maxWidth*0.04,),
                                  itemCount: _controller.homeModel!.popular!.length,
                                  itemBuilder:(context,i){
                                    return Container(
                                      height: boxConstraints.maxHeight*0.30,
                                      width: boxConstraints.maxWidth*0.60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.grey[300],
                                      ),
                                      child: LayoutBuilder(
                                          builder: (context,boxContainer){
                                            return
                                              ProductsContainerHome(
                                                  boxContainer: boxContainer,
                                                  image:'https://buylebanese.com/database/photos/128b.jpg' ,
                                                  onTap: (){
                                                    Get.toNamed(pViewProducts,parameters: {
                                                      'idProducts': '${_controller.homeModel!.popular![i].id!}'
                                                    });
                                                  },
                                                  name: _controller.homeModel!.popular![i].name!,
                                                  price:_controller.homeModel!.popular![i].priec!,
                                                  discount: _controller.homeModel!.popular![i].discount!,
                                                idProducts:_controller.homeModel!.popular![i].id! ,
                                                  favorite: (){
                                                    _cartFavorites.addDeleteFavorites(idProduct: _controller.homeModel!.popular![i].id!);
                                                  },
                                                  cart: (){
                                                       _cartFavorites.addDeleteCart(idProduct: _controller.homeModel!.popular![i].id!, count: 1);
                                                  },
                                              );
                                          }
                                      ),
                                    );
                                  }
                              ),
                            ),
                            SizedBox(height: boxConstraints.maxHeight*0.02,),

                            seeAll(context: context, onTap: (){}, title:'Best Choice' ),

                            SizedBox(height: boxConstraints.maxHeight*0.02,),
                            SizedBox(
                              width: boxConstraints.maxWidth*0.95,
                              height: boxConstraints.maxHeight*0.30,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context,i)=>SizedBox(width: boxConstraints.maxWidth*0.04,),
                                  itemCount: _controller.homeModel!.bestChoice!.length,
                                  itemBuilder:(context,i){
                                    return Container(
                                      height: boxConstraints.maxHeight*0.30,
                                      width: boxConstraints.maxWidth*0.60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.grey[300],
                                      ),
                                      child: LayoutBuilder(
                                          builder: (context,boxContainer){
                                            return    ProductsContainerHome(
                                                boxContainer: boxContainer,
                                                image:'https://buylebanese.com/database/photos/128b.jpg' ,
                                                onTap: (){

                                                  Get.toNamed(pViewProducts,parameters: {
                                                    'idProducts': '${_controller.homeModel!.bestChoice![i].id!}'
                                                  });
                                                },
                                                name: _controller.homeModel!.bestChoice![i].name!,
                                                price:_controller.homeModel!.bestChoice![i].priec!,
                                                discount: _controller.homeModel!.bestChoice![i].discount!,
                                              idProducts:  _controller.homeModel!.bestChoice![i].id!,
                                                favorite: (){
                                                  _cartFavorites.addDeleteFavorites(idProduct: _controller.homeModel!.bestChoice![i].id!);
                                                },
                                                cart: (){
                                                  _cartFavorites.addDeleteCart(idProduct: _controller.homeModel!.bestChoice![i].id!, count: 1);
                                                },
                                            );
                                          }
                                      ),
                                    );
                                  }
                              ),
                            ),
                            SizedBox(height: boxConstraints.maxHeight*0.02,),

                            seeAll(context: context, onTap: (){}, title:'Offers' ),

                            SizedBox(height: boxConstraints.maxHeight*0.02,),
                            Container(
                                color: Colors.white70,
                                width: double.infinity,
                                child: GridView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 15,
                                    crossAxisSpacing:15,
                                    childAspectRatio:1.4/2.0,),
                                  itemCount:_controller.homeModel!.discount!.length,
                                  itemBuilder: (ctx,i){
                                    return
                                      Container(
                                        height: boxConstraints.maxHeight*0.25,
                                        width: boxConstraints.maxWidth*0.40,
                                        decoration: BoxDecoration(
                                          boxShadow:const  [BoxShadow(color: Colors.grey,spreadRadius: 0,blurRadius: 2)],
                                          borderRadius: BorderRadius.circular(12),
                                          color: Colors.grey[300],
                                        ),
                                        child: LayoutBuilder(
                                            builder: (context,boxContainer){
                                              return
                                                ProductsContainerHome(
                                                    boxContainer: boxContainer,
                                                    image:'https://buylebanese.com/database/photos/128b.jpg' ,
                                                    onTap: (){
                                                      Get.toNamed(pViewProducts,parameters: {
                                                        'idProducts': '${_controller.homeModel!.discount![i].id!}'
                                                      });
                                                    },
                                                    name: _controller.homeModel!.discount![i].name!,
                                                    price:_controller.homeModel!.discount![i].priec!,
                                                    discount: _controller.homeModel!.discount![i].discount!,
                                                    idProducts: _controller.homeModel!.discount![i].id!,
                                                    favorite: (){
                                                     _cartFavorites.addDeleteFavorites(idProduct: _controller.homeModel!.discount![i].id!,);
                                                    },
                                                    cart: (){
                                                      _cartFavorites.addDeleteCart(idProduct: _controller.homeModel!.discount![i].id!, count:1);
                                                    },

                                                );

                                            }
                                        ),
                                      );
                                  },
                                )
                            ),

                          ],
                        );
                      },
                    )
                  );
                });
              },
            ),
          ),
    )
    );
  }
}
