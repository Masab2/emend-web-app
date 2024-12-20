import 'package:emend_web_app/Bindings/bindings.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:emend_web_app/config/Template/email_template_one.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'config/routes/routes.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      // home: const EmailTemplateOne(),
    );
  }
}
