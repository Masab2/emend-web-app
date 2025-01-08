// ignore_for_file: deprecated_member_use

import 'package:emend_web_app/config/routes/route_names.dart';
import 'package:emend_web_app/controllers/NavigationController/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../color/app_color.dart';

class SideBarWidgets extends StatelessWidget {
  SideBarWidgets({super.key});

  final NavigationController controller = Get.find<NavigationController>();

  // Grouped menu items for better organization
  final List<Map<String, dynamic>> menuSections = [
    {
      'section': 'Main',
      'items': [
        {
          'icon': Icons.dashboard_outlined,
          'title': 'Dashboard',
          'route': RouteNames.dashboard,
        },
      ]
    },
    {
      'section': 'Campaigns',
      'items': [
        {
          'icon': Icons.mark_email_unread_outlined,
          'title': 'Email Campaigns',
          'route': RouteNames.emailCampaigns,
        },
        {
          'icon': Icons.message_outlined,
          'title': 'SMS Campaigns',
          'route': RouteNames.smsCampaigns,
        },
      ]
    },
    {
      'section': 'Analytics & Content',
      'items': [
        {
          'icon': Icons.analytics_outlined,
          'title': 'Reports',
          'route': RouteNames.reports,
        },
        {
          'icon': Icons.article_outlined,
          'title': 'Templates',
          'route': RouteNames.templates,
        },
        {
          'icon': Icons.people_outline,
          'title': 'Contact List',
          'route': RouteNames.contactList,
        },
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isSidebarVisible = controller.isSidebarVisible.value;

      return AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutCubic,
        width: isSidebarVisible ? context.width * 0.17 : context.width * 0.06,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // Sidebar Header with Logo
            Container(
              height: context.height * 0.08,
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.012),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade100,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: isSidebarVisible
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.center,
                children: [
                  if (isSidebarVisible)
                    Text(
                      'Emend Health Care',
                      style: TextStyle(
                        fontSize: context.height * 0.020,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryColor,
                        letterSpacing: 0.3,
                      ),
                    ),
                  IconButton(
                    onPressed: controller.toggleSidebarVisibility,
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        isSidebarVisible
                            ? Icons.chevron_left
                            : Icons.chevron_right,
                        key: ValueKey<bool>(isSidebarVisible),
                        size: context.height * 0.022, // Slightly reduced size
                        color: AppColor.primaryColor,
                      ),
                    ),
                    splashRadius: 20,
                  ),
                ],
              ),
            ),

            // Menu Items
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: context.height * 0.016),
                itemCount: menuSections.length,
                itemBuilder: (context, sectionIndex) {
                  final section = menuSections[sectionIndex];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isSidebarVisible)
                        Padding(
                          padding: EdgeInsets.only(
                            left: context.width * 0.012,
                            bottom: context.height * 0.008,
                            top: context.height * 0.016,
                          ),
                          child: Text(
                            section['section'],
                            style: TextStyle(
                              fontSize: context.height * 0.016, // Reduced size
                              fontWeight: FontWeight.w600,
                              color: Colors.grey.shade600,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ...List.generate(
                        (section['items'] as List)
                            .length, // Type-safe length access
                        (itemIndex) {
                          final item = section['items'][itemIndex];
                          final isSelected = controller.selectedIndex.value ==
                              _getGlobalIndex(sectionIndex, itemIndex);

                          return MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                controller.setSelectedIndex(
                                    _getGlobalIndex(sectionIndex, itemIndex));
                                Get.toNamed(item['route']);
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: context.width * 0.008,
                                  vertical: context.height * 0.003,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.width * 0.01,
                                  vertical: context.height * 0.01,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColor.primaryColor.withOpacity(0.08)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  mainAxisAlignment: isSidebarVisible
                                      ? MainAxisAlignment.start
                                      : MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      item['icon'],
                                      size: context.height *
                                          0.022, // Reduced size
                                      color: isSelected
                                          ? AppColor.primaryColor
                                          : Colors.grey.shade600,
                                    ),
                                    if (isSidebarVisible) ...[
                                      SizedBox(width: context.width * 0.008),
                                      Expanded(
                                        child: Text(
                                          item['title'],
                                          style: TextStyle(
                                            fontSize: context.height *
                                                0.016, // Reduced size
                                            fontWeight: isSelected
                                                ? FontWeight.w500
                                                : FontWeight.w400,
                                            color: isSelected
                                                ? AppColor.primaryColor
                                                : Colors.grey.shade700,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  int _getGlobalIndex(int sectionIndex, int itemIndex) {
    int globalIndex = 0;
    for (int i = 0; i < sectionIndex; i++) {
      // Fixed the type error by directly accessing length as int
      globalIndex += (menuSections[i]['items'] as List).length;
    }
    return globalIndex + itemIndex;
  }
}
