import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyServices extends GetxService{
  late SharedPreferences sharedPreferences;
  Future<MyServices> initShared() async{
    sharedPreferences =   await SharedPreferences.getInstance();
    print('${sharedPreferences.getString('Lang')}');
    return this;
  }
}
