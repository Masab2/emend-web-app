import 'package:emend_web_app/Controllers/controller.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:emend_web_app/views/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideBarWidgets extends StatelessWidget {
  const SideBarWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.find<NavigationController>();

    final menuItems = [
      {
        'icon': Icons.home,
        'title': 'DashBoard',
        'route': DashboardView.route,
      },
      {
        'icon': Icons.email_outlined,
        'title': 'E-Mail Campaigns',
        'route': EmailCompaignsView.route,
      },
      {
        'icon': Icons.dock_outlined,
        'title': 'SMS Campaigns',
        'route': SmsCompaignView.route,
      },
      {
        'icon': Icons.add_chart,
        'title': 'Reports',
        'route': ReportsView.route,
      },
      {
        'icon': Icons.edit,
        'title': 'Templates',
        'route': TemplateView.route,
      },
      {
        'icon': Icons.message,
        'title': 'Chats',
        'route': ChatView.route,
      },
      {
        'icon': Icons.contact_page_outlined,
        'title': 'Contact List',
        'route': ContactListView.route,
      },
    ];

    return Obx(() {
      return Container(
        color: AppColor.whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Toggle Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.mw * 0.005),
              child: IconButton(
                onPressed: () {
                  controller.toggleSidebarVisibility();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Sidebar with animation
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: controller.isSidebarVisible.value
                  ? context.mw * 0.17
                  : context.mw * 0.043,
              height: context.mh * 0.85,
              color: AppColor.whiteColor,
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  final isSelected = controller.selectedIndex.value == index;
                  return Card(
                    color: isSelected
                        ? AppColor.primaryColor
                        : AppColor.whiteColor,
                    elevation: 0,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      leading: Icon(
                        item['icon'] as IconData,
                        color: isSelected
                            ? AppColor.whiteColor
                            : AppColor.primaryColor,
                      ),
                      title: controller.isSidebarVisible.value
                          ? Text(
                              item['title'] as String,
                              style: TextStyle(
                                color: isSelected
                                    ? AppColor.whiteColor
                                    : Colors.black,
                              ),
                            )
                          : null,
                      onTap: () {
                        controller.setSelectedIndex(index);
                        Get.toNamed(item['route'] as String);
                      },
                      selected: isSelected,
                      selectedColor: AppColor.whiteColor,
                      selectedTileColor: AppColor.primaryColor,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
