import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/controllers/ContactListController/contact_list_controller.dart';
import 'package:emend_web_app/controllers/CreateEmailController/create_email_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactListEmailWidget extends StatelessWidget {
  final controller = Get.put(CreateEmailController());
  final searchController = TextEditingController();
  final focusNode = FocusNode();
  final contactController = Get.put(ContactListController());

  ContactListEmailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.mh,
      child: Obx(() {
        return Column(
          children: [
            Container(
              width: context.mw,
              decoration: BoxDecoration(
                color: AppColor.textFormFieldBgColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                children: [
                  _buildEmailTypeOption(
                    'Single',
                    'Single Recipient',
                    'Send email to a single email address',
                    Icons.email,
                    context,
                  ),
                  if (controller.selectedRecipentType.value == 'Single')
                    Container(
                      height: context.mh * 0.25,
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        controller: controller.singleEmailController.value,
                        maxLines: null,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Enter Email Address',
                          hintStyle: TextStyle(fontSize: context.mh * 0.020),
                          border: InputBorder.none,
                          
                        ),
                      ),
                    ),
                  _buildEmailTypeOption(
                    'multiple',
                    'Multiple Recipients',
                    'Send email to multiple contacts from a list',
                    Icons.article,
                    context,
                  ),
                  if (controller.selectedRecipentType.value == 'multiple')
                    Container(
                      height: context.mh * 0.25,
                      child: Column(
                        children: [
                          _buildHeader(),
                          _buildSearchBar(context),
                          Obx(() => controller.isDropdownOpen.value ||
                                  searchController.text.isNotEmpty
                              ? Expanded(child: _buildListView())
                              : const SizedBox()),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Select List to Add to Campaign',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      height: context.mh * 0.06,
      width: context.mw,
      decoration: BoxDecoration(
        color: AppColor.textFormFieldBgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: TextField(
        controller: searchController,
        focusNode: focusNode,
        onChanged: (value) {
          controller.filterList(value);
        },
        onTap: () {
          controller.isDropdownOpen.value = !controller.isDropdownOpen.value;
        },
        decoration: InputDecoration(
          hintText: 'Add List to Campaign',
          hintStyle: TextStyle(fontSize: context.mh * 0.020),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              searchController.clear();
              controller.filterList('');
              focusNode.unfocus();
              controller.isDropdownOpen.value = false;
            },
          ),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return Obx(() {
      final list = contactController.getListModel.value.list ?? [];
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
              title: Text(item.name ?? ""),
              trailing: Text(
                '${item.contacts?.length ?? 0} Contact${item.contacts?.length != 1 ? 's' : ''}',
                style: TextStyle(color: Colors.grey.shade600),
              ),
              onTap: () {
                searchController.text = item.name ?? "";
                controller.isDropdownOpen.value = false;
                focusNode.unfocus();
              },
            ),
          );
        },
      );
    });
  }

  Widget _buildEmailTypeOption(
    String value,
    String title,
    String description,
    IconData icon,
    BuildContext context,
  ) {
    return Obx(() => InkWell(
          onTap: () => controller.selectedRecipentType.value = value,
          child: Container(
            padding: EdgeInsets.all(context.mw * 0.015),
            decoration: BoxDecoration(
              color: controller.selectedRecipentType.value == value
                  ? AppColor.primaryColor.withOpacity(0.1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Radio<String>(
                  value: value,
                  groupValue: controller.selectedRecipentType.value,
                  onChanged: (newValue) {
                    controller.selectedRecipentType.value = newValue!;
                  },
                  activeColor: AppColor.primaryColor,
                ),
                SizedBox(width: context.mw * 0.01),
                Icon(icon, color: AppColor.primaryColor),
                SizedBox(width: context.mw * 0.02),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: context.mh * 0.018,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: context.mh * 0.014,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
