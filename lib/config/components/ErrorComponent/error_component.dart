import 'package:emend_web_app/config/Color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';

class ErrorComponent extends StatelessWidget {
  final String title;
  const ErrorComponent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: context.mh * 0.06,
            color: Colors.red[400],
          ),
          SizedBox(height: context.mh * 0.02),
          Text(
            title,
            style: TextStyle(
              fontSize: context.mh * 0.018,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: context.mh * 0.01),
          TextButton.icon(
            onPressed: () {
            },
            icon: const Icon(Icons.refresh_rounded),
            label: const Text('Retry'),
            style: TextButton.styleFrom(
              foregroundColor: AppColor.primaryColor,
              padding: EdgeInsets.symmetric(
                horizontal: context.mw * 0.02,
                vertical: context.mh * 0.01,
              ),
            ),
          ),
        ],
      ),
    );
  }
}