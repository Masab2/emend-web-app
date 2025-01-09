import 'package:emend_web_app/config/Color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void showLoader() {
  EasyLoading.show(
    maskType: EasyLoadingMaskType.none,
    dismissOnTap: false,
  );
}

void hideLoader() {
  EasyLoading.dismiss();
}

void configEasyLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..progressColor = AppColor.primaryColor
    ..backgroundColor = Colors.white
    ..indicatorColor = AppColor.pinkTea
    ..textColor = AppColor.chatsBackgroundColor
    ..maskColor = Colors.black.withValues(alpha: 0.5)
    ..userInteractions = false;
}
