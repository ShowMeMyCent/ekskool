import 'package:ekskool_v1/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app/controllers/main_controller.dart';
import 'firebase_options.dart';

import 'app/routes/app_pages.dart';

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
    return StreamBuilder(
        stream: mainC.streamAuthStatus,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            return GetMaterialApp(
              title: "Application",
              debugShowCheckedModeBanner: false,
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
            );
          }
          return LoginView();
        });
  }
}
