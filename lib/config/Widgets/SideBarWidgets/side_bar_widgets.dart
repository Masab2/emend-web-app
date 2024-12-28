import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/controllers/NavigationController/navigation_controller.dart';
import 'package:emend_web_app/views/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../color/app_color.dart';

class SideBarWidgets extends StatelessWidget {
  SideBarWidgets({super.key});

  final NavigationController controller = Get.find<NavigationController>();
  @override
  Widget build(BuildContext context) {
    final menuItems = [
      {
        'icon': Icons.home,
        'title': 'DashBoard',
        'route': DashboardView.route,
      },
      {
        'icon': Icons.email_outlined,
        'title': 'E-Mail Campaigns',
        'route': EmailCampaignsView.route,
      },
      {
        'icon': Icons.dock_outlined,
        'title': 'SMS Campaigns',
        'route': SmsCampaignView.route,
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
        color: Colors.white,
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
                  : context.mw * 0.05, // Control width based on collapsed state
              height: context.mh * 0.85,
              color: Colors.white,
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  final isSelected = controller.selectedIndex.value == index;

                  return GestureDetector(
                    onTap: () {
                      controller.setSelectedIndex(index);
                      Get.toNamed(item['route'] as String); // Navigate on tap
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Card(
                        color:
                            isSelected ? AppColor.primaryColor : Colors.white,
                        elevation: 0,
                        child: controller.isSidebarVisible.value
                            ? ListTile(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                leading: Icon(
                                  item['icon'] as IconData,
                                  color: isSelected
                                      ? Colors.white
                                      : AppColor.primaryColor,
                                ),
                                title: Text(
                                  item['title'] as String,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  item['icon'] as IconData,
                                  color: isSelected
                                      ? Colors.white
                                      : AppColor.primaryColor,
                                ),
                              ),
                      ),
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
