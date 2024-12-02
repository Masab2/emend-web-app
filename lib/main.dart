import 'package:emend_web_app/Bindings/bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/Routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EMEND WEB APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialBinding: AllBinding(),
      getPages: Routes.appRoutes(),
    );
  }
}