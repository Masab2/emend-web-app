import 'package:emend_web_app/Model/DummyContactModel/dummyContactModel.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/controllers/ContactListController/contact_list_controller.dart';
import 'package:emend_web_app/controllers/CreateEmailController/create_email_controller.dart';
import 'package:emend_web_app/data/Response/status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactListEmailWidget extends StatelessWidget {
  final controller = Get.put(CreateEmailController());
  final contactController = Get.put(ContactListController());
  final searchController = TextEditingController();
  final focusNode = FocusNode();

  ContactListEmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.mh,
      child: Column(
        children: [
          _buildHeader(context),
          _buildSearchBar(context),
          Obx(() {
            if (controller.isDropdownOpen.value ||
                searchController.text.isNotEmpty) {
              return Expanded(child: _buildListView(context));
            }
            return const SizedBox();
          }),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Pick The Email',
            style: TextStyle(
              fontSize: context.mh * 0.024,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Obx(() {
      return Container(
        height: context.mh * 0.06,
        width: context.mw,
        decoration: BoxDecoration(
          color: AppColor.textFormFieldBgColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: TextField(
          controller: controller.singleEmailController.value,
          focusNode: focusNode,
          onChanged: (value) {
            controller.selectedEmails.clear();
            final emails = value
                .split(',')
                .map((email) => email.trim())
                .where((email) => email.isNotEmpty);
            for (var email in emails) {
              controller.selectedEmails.add({'email': email});
            }
          },
          onTap: () {
            controller.isDropdownOpen.value = true;
          },
          decoration: InputDecoration(
            hintText: 'Select or Enter Email Address',
            hintStyle: TextStyle(fontSize: context.mh * 0.020),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                controller.selectedEmails.clear();
                controller.singleEmailController.value.clear();
                focusNode.unfocus();
                controller.isDropdownOpen.value = false;
              },
            ),
          ),
        ),
      );
    });
  }

  Widget _buildListView(BuildContext context) {
    return Obx(() {
      final list = dummyContacts;
      switch (contactController.rxRequestStatusForAllContact.value) {
        case Status.loading:
          return SizedBox(
            height: context.mw * 0.10,
            width: context.mw * 0.10,
            child: const CircularProgressIndicator(),
          );
        case Status.completed:
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];
              return Container(
                decoration: BoxDecoration(
                  color: index % 2 == 0 ? Colors.grey.shade100 : Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: ListTile(
                  title: Text(item.firstName),
                  subtitle: Text(item.email),
                  onTap: () {
                    if (!controller.selectedEmails
                        .any((email) => email['email'] == item.email)) {
                      controller.selectedEmails
                          .add({'name': item.firstName, 'email': item.email});
                    }
                    controller.singleEmailController.value.text = controller
                        .selectedEmails
                        .map((email) => email['email'])
                        .join(', ');
                    controller.isDropdownOpen.value = false;
                    focusNode.unfocus();
                  },
                ),
              );
            },
          );

        case Status.error:
          return const Text("No Data");
        default:
          return const SizedBox();
      }
    });
  }
}
