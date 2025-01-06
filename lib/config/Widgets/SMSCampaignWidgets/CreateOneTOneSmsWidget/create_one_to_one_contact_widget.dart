import 'package:emend_web_app/config/Color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/controllers/controllers.dart';
import 'package:emend_web_app/data/Response/status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateOneToOneContactWidget extends StatefulWidget {
  const CreateOneToOneContactWidget({super.key});

  @override
  State<CreateOneToOneContactWidget> createState() =>
      _CreateOneToOneContactWidgetState();
}

class _CreateOneToOneContactWidgetState
    extends State<CreateOneToOneContactWidget> {
  final controller = Get.put(SmsCampaignController());
  final contactController = Get.put(ContactListController());
  final searchController = TextEditingController();
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.mh,
      child: Column(
        children: [
          _buildHeader(),
          _buildSearchBar(context),
          Obx(() {
            if (controller.isDropdownOpen.value ||
                searchController.text.isNotEmpty) {
              return Expanded(child: _buildListView());
            }
            return const SizedBox();
          }),
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
          Text(
            'Pick The Contact',
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
          controller: contactController.selectedContactController.value,
          focusNode: focusNode,
          onChanged: (value) {
            contactController.filterList(value);
          },
          onTap: () {
            controller.isDropdownOpen.value = !controller.isDropdownOpen.value;
          },
          decoration: InputDecoration(
            hintText: 'Select Contact',
            hintStyle: TextStyle(fontSize: context.mh * 0.020),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                contactController.selectedContactController.value.clear();
                contactController.filterList('');
                focusNode.unfocus();
                controller.isDropdownOpen.value = false;
              },
            ),
          ),
        ),
      );
    });
  }

  Widget _buildListView() {
    return Obx(() {
      final list = contactController.getallContact.value.data;
      switch (contactController.rxRequestStatusForAllContact.value) {
        case Status.loading:
          return SizedBox(
              height: context.mw * 0.10,
              width: context.mw * 0.10,
              child: const CircularProgressIndicator());
        case Status.completed:
          return ListView.builder(
            itemCount: list?.length,
            itemBuilder: (context, index) {
              final item = list?[index];
              return Container(
                decoration: BoxDecoration(
                  color: index % 2 == 0 ? Colors.grey.shade100 : Colors.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: ListTile(
                  title: Text(item?.firstName ?? ""),
                  subtitle: Text(item?.phone ?? ""),
                  onTap: () {
                    contactController.selectedContactController.value.text =
                        item?.phone ?? "";
                    controller.toggleDropdown();
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
