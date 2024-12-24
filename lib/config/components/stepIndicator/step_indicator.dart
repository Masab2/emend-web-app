import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class StepIndicator extends StatelessWidget {
  final String title;
  final bool isActive;
  final bool isLast;
  final Widget widget;
  final VoidCallback onRemove;

  const StepIndicator({
    super.key,
    required this.title,
    required this.isActive,
    this.isLast = false,
    required this.widget,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 20),
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Center(
                    child: Icon(
                      IconlyBold.chat,
                      color: Colors.white,
                      size: context.mh * 0.025,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isActive ? Colors.black : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: onRemove,
              child: Text(
                "Remove Message",
                style: GoogleFonts.barlow(
                  fontSize: context.mh * 0.015,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        if (!isLast)
          Row(
            children: [
              const SizedBox(width: 20),
              Container(
                width: 2,
                height: 50,
                color: isActive ? Colors.blue : Colors.grey,
                margin: const EdgeInsets.symmetric(horizontal: 15),
              ),
              widget,
            ],
          ),
      ],
    );
  }
}
