// ignore_for_file: prefer_is_empty

import 'package:emend_web_app/config/Routes/route_names.dart';
import 'package:emend_web_app/config/components/EmptyStateComponent/empty_state_component.dart';
import 'package:emend_web_app/config/components/ErrorComponent/error_component.dart';
import 'package:emend_web_app/config/components/LoadingComponent/loading_component.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/utils/Dialog/add_single_contact_in_list_dialog.dart';
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
                        width: context.mw * 0.15, // Increased width for actions
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
                        return const LoadingComponent(title: "List Loading...");
                      case Status.completed:
                        final list = controller.getListModel.value.list;
                        if (list == null || list.isEmpty) {
                          return const EmptyStateComponent(
                            title: "No List Available",
                            icon: IconlyLight.user,
                          );
                        }
                        return ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            var data = list[index];
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: context.mw * 0.02),
                              padding: EdgeInsets.symmetric(
                                  horizontal: context.mw * 0.01),
                              child: Column(
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
                                          data.name ?? "",
                                          style: TextStyle(
                                            fontSize: context.mh * 0.02,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(RouteNames
                                              .contactListDetailsScreen);
                                        },
                                        child: SizedBox(
                                          width: context.mw * 0.20,
                                          child: Text(
                                            "${data.contacts?.length ?? 0} Contacts",
                                            style: TextStyle(
                                              fontSize: context.mh * 0.02,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: context.mw * 0.15,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                AddSingleContactInListDialog
                                                    .showAddContactDialog(
                                                  context,
                                                  firstNameController: controller
                                                      .singleFirstNameController
                                                      .value,
                                                  lastNameController: controller
                                                      .singleLastNameController
                                                      .value,
                                                  emailController: controller
                                                      .singleEmailController
                                                      .value,
                                                  phoneController: controller
                                                      .singlePhoneController
                                                      .value,
                                                  onAdd: () {
                                                    controller
                                                        .addSingleContactInList(
                                                      controller
                                                          .singleFirstNameController
                                                          .value
                                                          .text,
                                                      controller
                                                          .singleLastNameController
                                                          .value
                                                          .text,
                                                      controller
                                                          .singlePhoneController
                                                          .value
                                                          .text,
                                                      controller
                                                          .singleEmailController
                                                          .value
                                                          .text,
                                                      data.name ?? "",
                                                    );
                                                  },
                                                );
                                              },
                                              icon: Icon(
                                                IconlyLight.add_user,
                                                size: context.mh * 0.026,
                                                color: Colors.blue,
                                              ),
                                              tooltip: 'Add Contact',
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                if (data.contacts?.length ==
                                                    0) {
                                                  controller
                                                      .createContactInList(
                                                          data.name ?? "");
                                                }
                                              },
                                              icon: Icon(
                                                Icons.upload_file,
                                                size: context.mh * 0.026,
                                                color: Colors.green,
                                              ),
                                              tooltip: 'Upload CSV',
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                IconlyLight.edit,
                                                size: context.mh * 0.026,
                                                color: Colors.orange,
                                              ),
                                              tooltip: 'Edit',
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                    title: const Text(
                                                        'Delete List'),
                                                    content: const Text(
                                                        'Are you sure you want to delete this list?'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        child: const Text(
                                                            'Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
                                                          'Delete',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                              icon: Icon(
                                                IconlyLight.delete,
                                                size: context.mh * 0.026,
                                                color: Colors.red,
                                              ),
                                              tooltip: 'Delete',
                                            ),
                                          ],
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
                        return const ErrorComponent(
                          title: 'Unable to Load The List',
                        );
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
