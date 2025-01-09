import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';

class EmptyStateComponent extends StatelessWidget {
  final String title;
  final IconData icon;
  const EmptyStateComponent(
      {super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: context.mh * 0.06,
            color: Colors.grey[400],
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
        ],
      ),
    );
  }
}
