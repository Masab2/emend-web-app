import 'package:emend_web_app/Model/GetListModel/get_list_model.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactDetailsList extends StatelessWidget {
  const ContactDetailsList({super.key});

  @override
  Widget build(BuildContext context) {
    final contactList = Get.arguments as List<Contact>;
    return Scaffold(
      body: Row(
        children: [
          SideBarWidgets(
            key: UniqueKey(),
          ),
          Expanded(
            child: Container(
              width: context.mw,
              color: AppColor.viewsBackgroundColor,
              padding: EdgeInsets.symmetric(horizontal: context.mw * 0.05),
              child: Column(
                children: [
                  0.02.ph(context),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.mw * 0.02),
                    child: Row(
                      children: [
                        Text(
                          "Contacts",
                          style: TextStyle(
                              fontSize: context.mh * 0.020,
                              fontWeight: FontWeight.w600,
                              color: AppColor.primaryColor,
                              letterSpacing: 0.3),
                        )
                      ],
                    ),
                  ),
                  ContactListDetailsWidget(
                    contactList: contactList,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
