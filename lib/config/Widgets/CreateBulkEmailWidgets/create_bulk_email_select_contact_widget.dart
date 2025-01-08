import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/controllers.dart';
import '../../Color/app_color.dart';

class CreateBulkEmailSelectContactWidget extends StatelessWidget {
  CreateBulkEmailSelectContactWidget({super.key});
  final searchController = TextEditingController();
  final focusNode = FocusNode();
  final contactController = Get.put(ContactListController());
  final controller = Get.put(CreateEmailController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(context),
        _buildSearchBar(context),
        Obx(() =>
            controller.isDropdownOpen.value || searchController.text.isNotEmpty
                ? Expanded(child: _buildListView())
                : const SizedBox()),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Select List to Add to Campaign',
            style: TextStyle(
              fontSize: context.mh * 0.014,
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
}
