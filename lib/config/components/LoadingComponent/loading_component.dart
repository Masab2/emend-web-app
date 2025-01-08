import 'package:emend_web_app/config/Color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';

class LoadingComponent extends StatelessWidget {
  final String title;
  const LoadingComponent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColor.primaryColor),
          ),
          SizedBox(height: context.mh * 0.02),
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: context.mh * 0.016,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
