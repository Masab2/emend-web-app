import 'package:emend_web_app/config/assets/image_asset.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:flutter/material.dart';

class AuthCommonWidget extends StatelessWidget {
  final Widget formWidget;

  const AuthCommonWidget({super.key, required this.formWidget});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        // Left Section
        Container(
          width: size.width * 0.5,
          color: AppColor.primaryColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageAsset.login,
                  width: size.width * 0.3,
                ),
              ],
            ),
          ),
        ),
        // Right Section
        Container(
          width: size.width * 0.5,
          color: AppColor.pinkTea,
          child: Center(
            child: formWidget,
          ),
        ),
      ],
    );
  }
}
