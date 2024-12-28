import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/controllers/ContactListController/contact_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ContactListDetailsWidget extends StatelessWidget {
  const ContactListDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactListController controller = Get.put(ContactListController());
    return Column(
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
                  "Email",
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
            return ListView.builder(
              itemCount: controller.contactList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
                  padding: EdgeInsets.symmetric(horizontal: context.mw * 0.01),
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
                              "${controller.contactList[index].firstName} ${controller.contactList[index].lastName}",
                              style: TextStyle(
                                fontSize: context.mh * 0.02,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.mw * 0.20,
                            child: Text(
                              controller.contactList[index].email,
                              style: TextStyle(
                                fontSize: context.mh * 0.02,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.mw * 0.06,
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  controller.deleteContactList(
                                      controller.contactList[index]);
                                },
                                child: Icon(
                                  IconlyLight.delete,
                                  color: Colors.red,
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
          }),
        ),
      ],
    );
  }
}
