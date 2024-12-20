import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailCompainsBox extends StatelessWidget {
  final String count;
  final String heading;
  const EmailCompainsBox(
      {super.key, required this.count, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.whiteColor,
      child: Container(
        height: context.mh * 0.16,
        width: context.mw * 0.19,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.report),
            Text(
              count,
              style: GoogleFonts.barlow(
                fontSize: context.mh * 0.022,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            Text(
              heading,
              style: GoogleFonts.barlow(
                fontSize: context.mh * 0.022,
                fontWeight: FontWeight.w600,
                color: AppColor.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
