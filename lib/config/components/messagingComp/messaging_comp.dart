import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class MessagingComp extends StatelessWidget {
  final String text;
  final String subtext;
  const MessagingComp({super.key, required this.text, required this.subtext});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.whiteColor,
      child: Container(
        height: context.mh * 0.16,
        width: context.mw * 0.8,
        padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              children: [
                Icon(IconlyLight.edit_square),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: context.mh * 0.020,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtext,
                  style: TextStyle(
                      fontSize: context.mh * 0.018,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
