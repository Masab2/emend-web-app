import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class PostImpresshionWidget extends StatelessWidget {
  const PostImpresshionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        0.05.ph(context),
        Row(
          children: [
            Container(
              height: context.mw * 0.07,
              width: context.mw * 0.07,
              decoration: const BoxDecoration(
                color: Colors.grey,
              ),
            ),
            0.02.pw(context),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ENGAGEMENT",
                  style: TextStyle(
                    fontSize: context.mh * 0.018,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                0.01.ph(context),
                Text(
                  "89.64%",
                  style: TextStyle(
                    fontSize: context.mh * 0.018,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                0.02.ph(context),
                SimpleAnimationProgressBar(
                  height: context.mh * 0.01,
                  width: context.mw * 0.1,
                  backgroundColor: Colors.grey.shade200,
                  foregrondColor: Colors.blue,
                  ratio: 0.2,
                  direction: Axis.horizontal,
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(seconds: 3),
                  borderRadius: BorderRadius.circular(20),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
