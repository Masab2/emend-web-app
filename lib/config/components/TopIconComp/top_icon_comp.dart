import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';

class TopIconComp extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Color iconColor;
  const TopIconComp(
      {super.key,
      required this.color,
      required this.icon,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.mw * 0.03,
      width: context.mw * 0.03,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
