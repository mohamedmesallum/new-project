import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/services.dart';
import '../textThem/textThem.dart';

class ControllerLocal extends GetxController{
  MyServices myServices = Get.find();
  Locale? languages;
  ThemeData abbThem = themeDataEn ;

  chooseLanguages({required String CodeLocale,required Function() than }){
Locale locale = Locale(CodeLocale);
myServices.sharedPreferences.setString('Lang', CodeLocale);
abbThem = CodeLocale == 'en'?themeDataEn:themeDataAr;
Get.changeTheme(abbThem);
Get.updateLocale(locale).then((value) => than());
    print(CodeLocale);
update();

  }
@override
  void onInit() {
  String? sharedPrefLang = myServices.sharedPreferences.getString('Lang');
  if(sharedPrefLang=='ar'){
    languages=const Locale('ar');
    abbThem = themeDataAr;
  }else if(sharedPrefLang=='en'){
    languages=const Locale('en');
    abbThem = themeDataEn;
  }else{
    languages = Locale(Get.deviceLocale!.languageCode);
  }
    super.onInit();
  }
}