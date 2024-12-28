import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/controllers/StepController/step_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactListSmsWidget extends StatelessWidget {
  final controller = Get.put(StepController());
  final focusNode = FocusNode();
  final searchController = TextEditingController();

  ContactListSmsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.mh,
      child: Column(
        children: [
          _buildHeader(),
          _buildSearchBar(context),
          Obx(() => controller.isSearchFocused.value ||
                  searchController.text.isNotEmpty
              ? Expanded(child: _buildListView())
              : const SizedBox()),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Select List to Add to Campaign',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Stack(
            children: [
              GestureDetector(
                onTap: () => controller.toggleDropdown(),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const Text('Currently in Campaign'),
                      const SizedBox(width: 4),
                      Obx(() => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                                '(${controller.selectedCampaigns.length})'),
                          )),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ),
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
                                color: Colors.grey.withValues(alpha: 0.2),
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
            final item = controller.filteredContactLists[index];
            return Container(
              decoration: BoxDecoration(
                color: index % 2 == 0 ? Colors.grey.shade100 : Colors.white,
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: ListTile(
                title: Text(item['name'] as String),
                trailing: Text(
                  '${item['contacts']} Contact${item['contacts'] != 1 ? 's' : ''}',
                  style: TextStyle(color: Colors.grey.shade600),
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
