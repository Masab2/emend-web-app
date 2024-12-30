// ignore_for_file: prefer_is_empty

import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/controllers/ContactListController/contact_list_controller.dart';
import 'package:emend_web_app/data/Response/status.dart';
import 'package:emend_web_app/views/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ContactListViewWidget extends StatelessWidget {
  const ContactListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactListController controller = Get.put(ContactListController());
    return Obx(() {
      return controller.showContactListInList.value == true
          ? const ContactDetailsList()
          : Column(
              children: [
                Container(
                  height: context.mh * 0.06,
                  width: context.mw,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 220, 220, 223),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: context.mw * 0.01),
                  margin: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
                  child: Row(
                    children: [
                      SizedBox(
                        width: context.mw * 0.03,
                        child: Text(
                          "ID",
                          style: TextStyle(
                            fontSize: context.mh * 0.02,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.20,
                        child: Text(
                          "Name",
                          style: TextStyle(
                            fontSize: context.mh * 0.02,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.20,
                        child: Text(
                          "Total Contacts",
                          style: TextStyle(
                            fontSize: context.mh * 0.02,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.06,
                        child: Center(
                          child: Text(
                            "Actions",
                            style: TextStyle(
                              fontSize: context.mh * 0.02,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.mh * 0.85,
                  child: Obx(() {
                    switch (controller.rxRequestStatus.value) {
                      case Status.loading:
                        return SizedBox(
                            height: context.mw * 0.10,
                            width: context.mw * 0.10,
                            child: const CircularProgressIndicator());
                      case Status.completed:
                        return ListView.builder(
                          itemCount: controller.getListModel.value.list?.length,
                          itemBuilder: (context, index) {
                            var data =
                                controller.getListModel.value.list?[index];
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: context.mw * 0.02),
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.mw * 0.01),
                              child: Column(
                                spacing: context.mh * 0.02,
                                children: [
                                  0.01.ph(context),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: context.mw * 0.03,
                                        child: Text(
                                          "${index + 1}",
                                          style: TextStyle(
                                            fontSize: context.mh * 0.02,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: context.mw * 0.20,
                                        child: Text(
                                          data?.name ?? "",
                                          style: TextStyle(
                                            fontSize: context.mh * 0.02,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          controller.showContactListUi(
                                              true, data?.contacts ?? []);
                                        },
                                        child: SizedBox(
                                          width: context.mw * 0.20,
                                          child: Text(
                                            "${data?.contacts?.length} Contacts",
                                            style: TextStyle(
                                              fontSize: context.mh * 0.02,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: context.mw * 0.06,
                                        child: Center(
                                          child: GestureDetector(
                                            onTap: () {
                                              if (data?.contacts?.length == 0) {
                                                controller.createContactInList(
                                                    data?.name ?? "");
                                              }
                                            },
                                            child: Icon(
                                              IconlyLight.add_user,
                                              size: context.mh * 0.028,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      case Status.error:
                        return const Text("Some Thing Went Wrong");
                      default:
                        return const SizedBox();
                    }
                  }),
                ),
              ],
            );
    });
  }
}
