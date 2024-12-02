import 'package:emend_web_app/config/Color/app_color.dart';
import 'package:emend_web_app/config/components/TopIconComp/top_icon_comp.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class EmailCompaginSectionOneWidget extends StatelessWidget {
  const EmailCompaginSectionOneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            0.01.ph(context),
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
                        contentPadding: EdgeInsets.symmetric(
                            vertical: context.mh * 0.01,
                            horizontal: context.mw * 0.01),
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
                      style: GoogleFonts.barlow(
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
