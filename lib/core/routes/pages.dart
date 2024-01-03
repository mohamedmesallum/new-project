import 'package:elfardos/view/home/bottomBar.dart';
import 'package:elfardos/view/login/VerificationResetPas.dart';
import 'package:elfardos/view/login/forgotPassword.dart';
import 'package:elfardos/view/login/resetPassword.dart';
import 'package:elfardos/view/login/sign.dart';
import 'package:elfardos/view/login/signUp.dart';
import 'package:elfardos/view/login/verificationCodeSignUp.dart';
import 'package:elfardos/view/orders/all_orders.dart';
import 'package:elfardos/view/products/viewProducts.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';


import '../../model&widget/model/ordersModel.dart';
import '../../view/address/add_new_addres.dart';
import '../../view/address/my_address.dart';
import '../../view/home/viewCategories.dart';
import '../../view/orders/my_orders.dart';
import '../../view/orders/order_details.dart';
import '../../view/profile/profile.dart';
import '../../view/profile/settings.dart';
import '../biding/biding.dart';
import 'namePages.dart';

List<GetPage> routes=[
  GetPage(name:  pSignIn, page:()=> SignIn(),binding: BidingControllerLogin() ),
  GetPage(name:  pSignUp, page:()=> SignUp(), ),
  GetPage(name:  pForgotPassword, page:()=> ForgotPassword(), ),
  GetPage(name:  pResetPassword , page:()=> ResetPassword(), ),
  GetPage(name:  pVerificationResetPas, page:()=> const VerificationResetPas(), ),
  GetPage(name:  pVerificationSignUp , page:()=>const  VerificationSignUp(), ),
  GetPage(name:  pBottomBar , page:()=>const BottomBar(),binding: BidingControllerHome()),
  GetPage(name: pViewProducts, page: ()=>const ViewProducts(),binding: BidingControllerViewProduct()),
  GetPage(name: pCategoriesView, page: ()=> CategoriesView(),binding: BidingControllerCategories()),
  GetPage(name: pProfile , page:()=>Profile()),
  GetPage(name: pSettings, page: ()=>Settings()),
  GetPage(name: pAllOrders ,page: ()=>AllOrders()),
  GetPage(name: pOrderDetails ,page: ()=>OrderDetails()),
  GetPage(name: pMyAddress, page: ()=>MyAddress()),
GetPage(name: pAddNewAddress, page: ()=>AddNewAddress()),
  GetPage(name: pMyOrders, page: ()=>MyOrders()),
//
];