import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/Widgets/widgets.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.viewsBackgroundColor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
            child: Row(
              children: [
                Text(
                  "Chats",
                  style: GoogleFonts.barlow(
                    fontSize: context.mh * 0.028,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
          const ChatContactListWidget(),
        ],
      ),
    );
  }
}
