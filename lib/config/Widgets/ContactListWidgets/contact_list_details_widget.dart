// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'package:emend_web_app/Model/GetListModel/get_list_model.dart';
import 'package:emend_web_app/config/Color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/utils/Dialog/edit_contact_dialog.dart';
import 'package:emend_web_app/controllers/ContactListController/contact_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ContactListDetailsWidget extends StatelessWidget {
  List<Contact> contactlist;
  ContactListDetailsWidget({super.key, required this.contactlist});
  final ContactListController controller = Get.find<ContactListController>();

  @override
  Widget build(BuildContext context) {
    log(contactlist.length.toString());
    EditContactDialog editContactDialog = EditContactDialog();

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
          height: context.mh * 0.75,
          child: ListView.builder(
            itemCount: contactlist.length,
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
                            "${contactlist[index].firstName} ${contactlist[index].lastName}",
                            style: TextStyle(
                              fontSize: context.mh * 0.02,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: context.mw * 0.20,
                          child: Text(
                            contactlist[index].email ?? "",
                            style: TextStyle(
                              fontSize: context.mh * 0.02,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: context.mw * 0.07,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Icon(
                                      IconlyLight.delete,
                                      color: Colors.red,
                                      size: context.mh * 0.023,
                                    ),
                                  ),
                                ),
                                0.02.pw(context),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.editFirstNameController.text =
                                          contactlist[index].firstName ?? "";
                                      controller.editLastNameController.text =
                                          contactlist[index].lastName ?? "";
                                      controller.editEmailController.text =
                                          contactlist[index].email ?? "";
                                      controller.editPhoneController.text =
                                          contactlist[index].phone ?? "";
                                      editContactDialog.showEditContactDialog(
                                        context,
                                        controller.editFirstNameController,
                                        controller.editLastNameController,
                                        controller.editEmailController,
                                        controller.editPhoneController,
                                        () {
                                          controller.updateContactListApi(
                                            controller.contactList[index].id,
                                            controller
                                                .editFirstNameController.text,
                                            controller
                                                .editLastNameController.text,
                                            controller.editEmailController.text,
                                            controller.editPhoneController.text,
                                          );
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                    child: Icon(
                                      IconlyLight.edit_square,
                                      color: Colors.blue,
                                      size: context.mh * 0.023,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
