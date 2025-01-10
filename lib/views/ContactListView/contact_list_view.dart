// ignore_for_file: unused_local_variable, avoid_web_libraries_in_flutter

import 'dart:html' as html;
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/utils/Dialog/create_list_dialog_box.dart';
import 'package:emend_web_app/config/widgets/widgets.dart';
import 'package:emend_web_app/controllers/ContactListController/contact_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactListView extends StatefulWidget {
  static const String route = '/contactListView';
  const ContactListView({super.key});

  @override
  State<ContactListView> createState() => _ContactListViewState();
}

class _ContactListViewState extends State<ContactListView> {
  final ContactListController controller = Get.put(ContactListController());

  /// Method to trigger download of the demo CSV file
  void downloadDemoCsv() {
    const demoCsvPath = 'assets/csv/demo.csv';
    const fileName = 'demo.csv';

    // Create an anchor element and trigger the download
    html.AnchorElement anchorElement = html.AnchorElement(href: demoCsvPath)
      ..setAttribute('download', fileName)
      ..click();
  }

  @override
  void initState() {
    // controller.getContactListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBarWidgets(
            key: UniqueKey(),
          ),
          Expanded(
            child: Container(
              color: AppColor.viewsBackgroundColor,
              child: Column(
                children: [
                  0.02.ph(context),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.mw * 0.02),
                    child: Row(
                      children: [
                        Text(
                          "Lists",
                          style: TextStyle(
                              fontSize: context.mh * 0.020,
                              fontWeight: FontWeight.w600,
                              color: AppColor.primaryColor,
                              letterSpacing: 0.3),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.mw * 0.03),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        0.01.ph(context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MaterialButton(
                              minWidth: context.mw * 0.10,
                              color: AppColor.primaryColor,
                              height: context.mh * 0.06,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onPressed: () async {
                                CreateListDialogBox.showCreateListDialog(
                                  context,
                                  controller.nameController,
                                  () {
                                    controller.createList();
                                    Navigator.pop(context);
                                  },
                                  true,
                                );
                              },
                              child: Text(
                                "Create List",
                                style: TextStyle(
                                  fontSize: context.mh * 0.013,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            ),
                            0.01.pw(context),
                            MaterialButton(
                              minWidth: context.mw * 0.10,
                              color: AppColor.secondaryColor,
                              height: context.mh * 0.06,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onPressed: downloadDemoCsv,
                              child: Text(
                                "Download Demo CSV",
                                style: TextStyle(
                                  fontSize: context.mh * 0.013,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  0.01.ph(context),
                  const ContactListViewWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
