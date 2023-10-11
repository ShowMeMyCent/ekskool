import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';

import 'app/controllers/main_controller.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final mainC = Get.put(MainController(), permanent: true);
  final data = await mainC.checkuser();
  runApp(myApp(data: data));
  FlutterNativeSplash.remove();
}

class myApp extends StatelessWidget {
  final mainC = Get.find<MainController>();
  final data;

  myApp({this.data});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: (mainC.session == null)
          ? Routes.LOGIN
          : (data == true)
              ? Routes.HOME
              : Routes.ISI_DATA_USER_PAGE,
      getPages: AppPages.routes,
    );
  }
}
