import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class StepIndicator extends StatelessWidget {
  final String title;
  final bool isActive;
  final bool isLast;
  final Widget widget;
  final VoidCallback onRemove; // Callback to remove the step

  const StepIndicator({
    super.key,
    required this.title,
    required this.isActive,
    this.isLast = false,
    required this.widget,
    required this.onRemove, // Required remove callback
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
                0.03.pw(context),
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.primaryColor,
                  ),
                  child: Center(
                    child: Icon(
                      IconlyBold.chat,
                      color: Colors.white,
                      size: context.mh * 0.040,
                    ),
                  ),
                ),
                0.03.pw(context),
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
            Padding(
              padding: EdgeInsets.only(right: context.mw * 0.02),
              child: TextButton(
                onPressed: onRemove, // Trigger the remove callback
                child: Text(
                  "Remove Message",
                  style: GoogleFonts.barlow(
                    fontSize: context.mh * 0.020,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        if (!isLast)
          Row(
            children: [
              0.03.pw(context),
              Row(
                children: [
                  Container(
                    width: 2,
                    height: context.mh * 0.5,
                    color: isActive ? AppColor.primaryColor : Colors.grey,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                  ),
                  widget,
                ],
              ),
            ],
          ),
      ],
    );
  }
}
