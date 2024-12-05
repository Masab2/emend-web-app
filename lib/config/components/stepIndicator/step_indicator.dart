import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StepIndicator extends StatelessWidget {
  final String title;
  final bool isActive;
  final bool isLast;

  const StepIndicator({
    required this.title,
    required this.isActive,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            0.01.pw(context),
            Container(
              width: context.mw * 0.02,
              height: context.mw * 0.02,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isActive ? AppColor.primaryColor : Colors.grey,
              ),
              child: Center(
                child: Icon(
                  isActive ? Icons.check : Icons.radio_button_unchecked,
                  color: Colors.white,
                ),
              ),
            ),
            0.005.pw(context),
            Container(
              height: context.mw * 0.02,
              child: Center(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.barlow(
                    color: isActive ? Colors.black : Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: context.mh * 0.020,
                  ),
                ),
              ),
            ),
          ],
        ),
        if (!isLast)
          Column(
            children: [
              0.023.ph(context),
              Row(
                children: [
                  // 0.03.pw(context),
                  Container(
                    width: 70,
                    height: 2,
                    color: isActive ? AppColor.primaryColor : Colors.grey,
                    margin:  EdgeInsets.symmetric(horizontal: context.mw * 0.01),
                  ),
                ],
              ),
            ],
          ),
      ],
    );
  }
}
