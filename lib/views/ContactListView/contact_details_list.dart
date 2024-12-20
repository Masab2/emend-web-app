import 'package:emend_web_app/config/Widgets/widgets.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';

class ContactDetailsList extends StatelessWidget {
  const ContactDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.viewsBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: context.mw * 0.05),
      child: const Column(
        children: [
          ContactListDetailsWidget(),
        ],
      ),
    );
  }
}
