import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/utils/Dialog/create_list_dialog_box.dart';
import 'package:emend_web_app/config/widgets/widgets.dart';
import 'package:emend_web_app/controllers/ContactListController/contact_list_controller.dart';
import 'package:emend_web_app/views/views.dart';
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
    @override
  void initState() {
    controller.getContactListApi();
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
            child: Obx(
              () {
                return controller.showCreateContactView.value == true
                    ? const CreateContactView()
                    : Container(
                        color: AppColor.viewsBackgroundColor,
                        child: Column(
                          children: [
                            0.01.ph(context),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.mw * 0.03),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller
                                              .showContactListUi(false, []);
                                        },
                                        child: Icon(
                                          Icons.arrow_back,
                                          size: context.mh * 0.024,
                                        ),
                                      ),
                                      0.02.pw(context),
                                      Text(
                                        "Contact List",
                                        style: TextStyle(
                                          fontSize: context.mh * 0.027,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  0.01.ph(context),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      MaterialButton(
                                        minWidth: context.mw * 0.15,
                                        color: AppColor.blueColor,
                                        height: context.mh * 0.06,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        onPressed: () async {
                                          CreateListDialogBox
                                              .showCreateListDialog(
                                            context,
                                            controller.nameController,
                                            () {
                                              controller.createList();
                                              Navigator.pop(context);
                                            },
                                          );
                                        },
                                        child: Text(
                                          "Create List",
                                          style: TextStyle(
                                            fontSize: context.mh * 0.02,
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.whiteColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            0.01.ph(context),
                            const ContactListViewWidget(),
                          ],
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
