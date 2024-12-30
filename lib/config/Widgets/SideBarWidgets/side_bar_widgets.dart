import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/routes/route_names.dart';
import 'package:emend_web_app/controllers/NavigationController/navigation_controller.dart';
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
        'route': RouteNames.dashboard,
      },
      {
        'icon': Icons.email_outlined,
        'title': 'E-Mail Campaigns',
        'route': RouteNames.emailCampaigns,
      },
      {
        'icon': Icons.dock_outlined,
        'title': 'SMS Campaigns',
        'route': RouteNames.smsCampaigns,
      },
      {
        'icon': Icons.add_chart,
        'title': 'Reports',
        'route': RouteNames.reports,
      },
      {
        'icon': Icons.edit,
        'title': 'Templates',
        'route': RouteNames.templates,
      },
      {
        'icon': Icons.message,
        'title': 'Chats',
        'route': RouteNames.chats,
      },
      {
        'icon': Icons.contact_page_outlined,
        'title': 'Contact List',
        'route': RouteNames.contactList,
      },
    ];

    return Obx(() {
      final isSidebarVisible = controller.isSidebarVisible.value;

      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        color: Colors.white,
        width: isSidebarVisible ? context.mw * 0.17 : context.mw * 0.05,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Toggle Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.mw * 0.01),
              child: IconButton(
                onPressed: () {
                  controller.toggleSidebarVisibility();
                },
                icon: const Icon(
                  Icons.menu,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Sidebar Menu
            Expanded(
              child: ListView.builder(
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  final isSelected = controller.selectedIndex.value == index;

                  return GestureDetector(
                    onTap: () {
                      controller.setSelectedIndex(index);
                      Get.toNamed(item['route'] as String);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      height: context.mh * 0.07,
                      decoration: BoxDecoration(
                        color:
                            isSelected ? AppColor.primaryColor : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: context.mw * 0.003,
                        vertical: context.mh * 0.01,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: context.mw * 0.01),
                      child: Row(
                        mainAxisAlignment: isSidebarVisible
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.center,
                        children: [
                          Icon(
                            item['icon'] as IconData,
                            color: isSelected
                                ? Colors.white
                                : AppColor.primaryColor,
                            size: context.mh * 0.028,    
                          ),
                          if (isSidebarVisible) ...[
                            const SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                item['title'] as String,
                                style: TextStyle(
                                  fontSize: context.mh * 0.020,
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ],
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
