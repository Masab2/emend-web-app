import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:emend_web_app/config/widgets/DashBoardWidgets/post_impresshion_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostImmpresshionCardWidget extends StatelessWidget {
  const PostImmpresshionCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.whiteColor,
      child: Container(
        height: context.mh * 0.4,
        width: context.mw * 0.6,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.mw * 0.02,
            vertical: context.mh * 0.01,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Best Performing Posts",
                style: GoogleFonts.barlow(
                  fontSize: context.mh * 0.024,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Quickly see which 4 posts have the best engagement from March 26 - April 26",
                style: GoogleFonts.barlow(
                  fontSize: context.mh * 0.017,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              0.02.ph(context),
              const Row(
                children: [
                  PostImpresshionWidget(),
                  PostImpresshionWidget(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
