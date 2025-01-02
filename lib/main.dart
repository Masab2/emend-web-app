import 'dart:developer';

import 'package:emend_web_app/bindings/bindings.dart';
import 'package:emend_web_app/config/GlobalVarriable/global.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/keys/box_key.dart';
import 'package:emend_web_app/config/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'firebase_options.dart';

void main() async {
  log("Called");
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init().then(
    (value) {
      loadToken();
    },
  );
  usePathUrlStrategy();

  runApp(const MyApp());
}


void loadToken() {
  token.value = box.value.read(BoxKeys.authToken) ?? '';
  log("Token loaded: ${token.value}");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EMEND WEB APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: AppColor.viewsBackgroundColor,
      ),
      initialBinding: AllBinding(),
      getPages: Routes.appRoutes(),
    );
  }
}
