import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/components/TopIconComp/top_icon_comp.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class DashBoardHeaderWidget extends StatelessWidget {
  const DashBoardHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const TopIconComp(
          color: AppColor.notificationBackgroundColor,
          icon: IconlyLight.notification,
          iconColor: AppColor.blueColor,
        ),
        0.01.pw(context),
        const TopIconComp(
          color: AppColor.notificationBackgroundColor,
          icon: IconlyLight.chat,
          iconColor: AppColor.blueColor,
        ),
        0.01.pw(context),
        const TopIconComp(
          color: AppColor.chatsBackgroundColor,
          icon: IconlyLight.setting,
          iconColor: AppColor.redColor,
        ),
        0.01.pw(context),
        Row(
          children: [
            Text(
              "Hello Masab Haider",
              style: TextStyle(
                fontSize: context.mh * 0.022,
                fontWeight: FontWeight.w600,
              ),
            ),
            0.01.pw(context),
            const CircleAvatar(
              child: Icon(
                IconlyBold.profile,
              ),
            ),
            0.01.pw(context),
          ],
        ),
      ],
    );
  }
}
