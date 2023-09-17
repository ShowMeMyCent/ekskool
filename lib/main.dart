import 'package:ekskool_v1/app/modules/splash/views/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/controllers/main_controller.dart';
import 'app/routes/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(myApp());
}

class myApp extends StatelessWidget {
  final mainC = Get.put(MainController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.wait([
          Future.delayed(Duration(seconds: 1)),
          mainC.checkuser(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            bool isUserHasData = snapshot.data?[1];
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Application",
              initialRoute: (mainC.session == null)
                  ? Routes.LOGIN
                  : (isUserHasData == true)
                      ? Routes.HOME
                      : Routes.ISI_DATA_USER_PAGE,
              getPages: AppPages.routes,
            );
          }
          return SplashView();
        });
  }
}
