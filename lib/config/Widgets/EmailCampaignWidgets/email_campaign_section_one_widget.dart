import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/components/components.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class EmailCampaignHeaderWidget extends StatelessWidget {
  const EmailCampaignHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                0.01.pw(context),
                Expanded(
                  child: Container(
                    height: context.mh * 0.06,
                    padding:
                        EdgeInsets.symmetric(horizontal: context.mw * 0.01),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          fontSize: context.mh * 0.020,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: context.mh * 0.01,
                          horizontal: context.mw * 0.01,
                        ),
                        suffixIcon: const Icon(IconlyLight.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                0.01.pw(context),
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
            ),
            0.02.ph(context),
          ],
        ),
      ],
    );
  }
}
