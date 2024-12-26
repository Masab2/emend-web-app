// ignore_for_file: use_key_in_widget_constructors

import 'dart:developer';

import 'package:emend_web_app/Controllers/controller.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:emend_web_app/views/TemplateView/unlayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateEmailSelectTemplateWidget extends StatelessWidget {
  final controller = Get.put(CreateEmailController());
  final focusNode = FocusNode();
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.mh,
      child: Column(
        children: [
          _buildHeader(context),
          _buildSearchBar(context),
          Obx(() => controller.isSearchFocused.value ||
                  searchController.text.isNotEmpty
              ? Expanded(child: _buildListView())
              : const SizedBox()),
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
            'Select Template or Create New Template',
            style: TextStyle(
              fontSize: context.mh * 0.020,
              fontWeight: FontWeight.w500,
            ),
          ),
          Stack(
            children: [
              Obx(
                () => controller.isDropdownOpen.value
                    ? Positioned(
                        top: 40,
                        right: 0,
                        child: Container(
                          width: 250,
                          constraints: const BoxConstraints(maxHeight: 300),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ...controller.selectedCampaigns.map(
                                  (campaign) => ListTile(
                                    title: Text(campaign['name'] as String),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.close),
                                      onPressed: () => controller
                                          .removeFromCampaign(campaign),
                                    ),
                                  ),
                                ),
                                if (controller.selectedCampaigns.isEmpty)
                                  const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Text('No campaigns selected'),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ),
            ],
          ),
          MaterialButton(
            minWidth: context.mw * 0.13,
            color: AppColor.primaryColor,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            height: context.mh * 0.06,
            onPressed: () {
              Get.toNamed(
                UnLayerEditor.route,
              );
            },
            child: Row(
              children: [
                Icon(
                  Icons.add,
                  size: context.mh * 0.020,
                ),
                Text(
                  'Create New Template',
                  style: TextStyle(
                    fontSize: context.mh * 0.020,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
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
        color: AppColor.textFormFeildBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: TextField(
        controller: searchController,
        focusNode: focusNode,
        onChanged: (value) {
          controller.filterContacts(value);
        },
        onTap: () {
          controller.isSearchFocused.value = true;
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
              controller.filterContacts('');
              focusNode.unfocus();
              controller.isSearchFocused.value = false;
            },
          ),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return Obx(() => ListView.builder(
          itemCount: controller.filteredContactLists.length,
          itemBuilder: (context, index) {
            log('Index: $index   Length: ${controller.filteredContactLists.length}');
            final item = controller.filteredContactLists[index];
            return Container(
              decoration: BoxDecoration(
                color: index % 2 == 0 ? Colors.grey.shade100 : Colors.white,
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: ListTile(
                title: Text(
                  item['name'] as String,
                  style: TextStyle(
                    fontSize: context.mh * 0.020,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  searchController.text = item['name'] as String;
                  controller.isSearchFocused.value = false;
                  focusNode.unfocus();
                },
              ),
            );
          },
        ));
  }
}
