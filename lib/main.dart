import 'package:emend_web_app/Bindings/bindings.dart';
import 'package:emend_web_app/config/Routes/routes.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/views/view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  usePathUrlStrategy();
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: AppColor.viewsBackgroundColor,
      ),
      initialBinding: AllBinding(),
      getPages: Routes.appRoutes(),
      initialRoute: DashboardView.route,
    );
  }
}
