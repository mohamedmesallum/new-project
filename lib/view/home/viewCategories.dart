
import 'package:elfardos/controller/home/controllerCategories.dart';
import 'package:elfardos/core/appTheme/colorTheme.dart';
import 'package:elfardos/core/function/HindlingDataView.dart';
import 'package:elfardos/core/routes/namePages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home/controllerCart&Favorites.dart';
import '../../model&widget/widget/homeWidget/productsContainerHome.dart';
import '../../model&widget/widget/homeWidget/search.dart';

class CategoriesView extends StatelessWidget {
   CategoriesView({Key? key}) : super(key: key);
  ControllerCartFavorites _cartFavorites = Get.find();
  var controllerSearch = TextEditingController();
  String val  = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('Al Fardos', style: Theme
            .of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(
          color: ColorTheme.themeColor,
          fontFamily: ' Cairo',
          fontWeight: FontWeight.w700,
          fontSize:18,
          shadows: [const Shadow(color:Colors.black,blurRadius: 3 ,)],
        )),
        actions: [

          Icon(Icons.shopping_basket_rounded,color: ColorTheme.themeColor,size: 27,),
         const SizedBox(width: 9,),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: LayoutBuilder(
          builder: (context,boxConstraints){
            return GetBuilder<ControllerCategories>(
                builder: (_controller){
              return HandlingDataView(
                  statusRequest: _controller.statusRequest,
                  widget: GetBuilder<ControllerCategories>(
                    builder: (_controller){
                      return ListView(
                        // physics: NeverScrollableScrollPhysics(),
                        children: [
                         SizedBox(height: boxConstraints.maxHeight*0.01,),
                          Container(
                           margin: const EdgeInsets.symmetric(horizontal: 8),
                            height: boxConstraints.maxHeight*0.07,

                            child: Row(
                              children: [
                                SearchWidget(controllerText:controllerSearch,nameHint:'serach',width: boxConstraints.maxWidth*0.80,valid: (v){},)
                                ,Card(
                                  color: Colors.grey[100],
                                  elevation: 3,
                                  shadowColor: Colors.grey,
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    height: 40,
                                    width: boxConstraints.minWidth*0.11,
                                    decoration: BoxDecoration(

                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child:const  Icon(Icons.mic,size: 30,),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: boxConstraints.maxHeight*0.01,),
                          SizedBox(
                            child:  Padding(padding: const EdgeInsets.symmetric(horizontal: 8),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text('${Get.parameters['name']} : ',style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                          color: Colors.black
                                      ),),
                                      Text('${_controller.oneCategoriesModel!.data!.length} Items',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                          color: Colors.black38
                                      ),)
                                    ],
                                  ),
                                      Container(
                                        height: boxConstraints.maxHeight*0.06,

                                        child: Card(
                                          shadowColor: Colors.black,
                                          elevation: 2,
                                          child:    DropdownButton(
                                            alignment: Alignment.center,
                                            hint: Text('Ranking',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black54),),

                                            isExpanded:false,
                                            icon: Icon(Icons.format_align_right_outlined,),
                                            iconSize: 24,
                                            padding: EdgeInsets.all(0),

                                            elevation: 8,
                                            items:['الاحدث','الاعلي سعر','اقل سعر','اعلي تقييم','الاكثر شعبيه'].map((e) => DropdownMenuItem(child: Text('${e}',style: Theme.of(context).textTheme.bodySmall,),value: e!,), ).toList(), onChanged: (String? value) {
                                            val = value!;
                                            print(val);
                                            _cartFavorites.update();

                                          },
                                          ),

                                        ),
                                      ),
                                ],
                              ),
                            ),),
                          SizedBox(height: boxConstraints.maxHeight*0.01,),
                          SingleChildScrollView(
                            child:  Container(
                                padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                                color: Colors.white70,
                                height: boxConstraints.maxHeight*0.90,
                                //  width: double.infinity,
                                child: GridView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 15,
                                    crossAxisSpacing:15,
                                    childAspectRatio:1.4/2.0,),
                                  itemCount:_controller.oneCategoriesModel!.data!.length,
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
                                                        'idProducts': '${_controller.oneCategoriesModel!.data![i].id!}'
                                                      });
                                                    },
                                                    name: _controller.oneCategoriesModel!.data![i].name!,
                                                    price:_controller.oneCategoriesModel!.data![i].priec!,
                                                    discount: _controller.oneCategoriesModel!.data![i].discount!,
                                                    favorite: (){
                                                     _cartFavorites.addDeleteFavorites(idProduct:_controller.oneCategoriesModel!.data![i].id! ) ;
                                                    },
                                                    cart: (){
                                                      _cartFavorites.addDeleteCart(idProduct: _controller.oneCategoriesModel!.data![i].id!, count: 1);
                                                    },
                                                  idProducts: _controller.oneCategoriesModel!.data![i].id!,
                                                );
                                            }
                                        ),
                                      );
                                  },
                                )),
                          )
                        ],
                      );
                    },
                  ));
            });
          },
        ),
      ),
    );
  }
}
/*
      Center(child: Container(
                        height: 40,
                          alignment: Alignment.center,
                          width:boxConstraints.maxWidth*0.75,
                          child: Field(null,Icon(Icons.search_rounded,color: Colors.black87,),namehient: 'Search....',
                            valid: (String ) {  }, keyboard:TextInputType.text,
                            controller: controllerSearch,

                          )
                      ),),
 */