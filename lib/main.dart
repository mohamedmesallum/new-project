import 'package:elfardos/core/languages/controllerLocale.dart';
import 'package:elfardos/core/languages/locale.dart';
import 'package:elfardos/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/routes/namePages.dart';
import 'core/routes/pages.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp( MyApp());
}
Future initServices()async{
  await Get.putAsync(() => MyServices().initShared(),permanent: true);
}
class MyApp extends StatelessWidget {
 MyApp({super.key});
  final ControllerLocal controllerLocal = Get.put(ControllerLocal());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'الفردوس',
      translations: MyLocale(),
      locale: controllerLocal.languages,
      theme: controllerLocal.abbThem,
     getPages:routes ,
  initialRoute: pSignIn//pBottomBar
    );
  }
}

