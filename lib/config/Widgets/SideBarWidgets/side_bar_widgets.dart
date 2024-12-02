import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/DashboardSideBar/dashboard_side_bar_comp.dart';
import 'package:emend_web_app/Controllers/controller.dart';

class SideBarWidgets extends StatelessWidget {
  const SideBarWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final sidebarController = Get.put(DashboardController());

    return Obx(() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Menu Row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.mw * 0.003),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    sidebarController.toggleSidebarVisibility();
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          // Sidebar Container
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: sidebarController.isSidebarVisible.value
                ? context.mw * 0.17
                : context.mw * 0.043,
            height: context.mh * 0.85,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DashboardSideBarComp(
                          icon: Icons.home,
                          title: sidebarController.isSidebarVisible.value
                              ? 'DashBoard'
                              : null,
                          index: sidebarController.selectedIndex.value == 0,
                          ontap: () {
                            sidebarController.setSelectedIndex(0, "Dashboard");
                          },
                        ),
                        DashboardSideBarComp(
                          icon: Icons.email_outlined,
                          title: sidebarController.isSidebarVisible.value
                              ? 'E-Mail Campaigns'
                              : null,
                          index: sidebarController.selectedIndex.value == 1,
                          ontap: () {
                            sidebarController.setSelectedIndex(1, "E-Mail Campaigns");
                          },
                        ),
                        DashboardSideBarComp(
                          icon: Icons.dock_outlined,
                          title: sidebarController.isSidebarVisible.value
                              ? 'SMS Campaigns'
                              : null,
                          index: sidebarController.selectedIndex.value == 2,
                          ontap: () {
                            sidebarController.setSelectedIndex(2, "SMS Campaigns");
                          },
                        ),
                        DashboardSideBarComp(
                          icon: Icons.person_2_outlined,
                          title: sidebarController.isSidebarVisible.value
                              ? 'Social media Campaign'
                              : null,
                          index: sidebarController.selectedIndex.value == 3,
                          ontap: () {
                            sidebarController.setSelectedIndex(3, "Social media Campaign");
                          },
                        ),
                        DashboardSideBarComp(
                          icon: Icons.add_chart,
                          title: sidebarController.isSidebarVisible.value
                              ? 'Reports'
                              : null,
                          index: sidebarController.selectedIndex.value == 4,
                          ontap: () {
                            sidebarController.setSelectedIndex(4, "Reports");
                          },
                        ),
                        DashboardSideBarComp(
                          icon: Icons.edit,
                          title: sidebarController.isSidebarVisible.value
                              ? 'Templates'
                              : null,
                          index: sidebarController.selectedIndex.value == 5,
                          ontap: () {
                            sidebarController.setSelectedIndex(5, "Templates");
                          },
                        ),
                        DashboardSideBarComp(
                          icon: Icons.calendar_month_outlined,
                          title: sidebarController.isSidebarVisible.value
                              ? 'Social Calendar'
                              : null,
                          index: sidebarController.selectedIndex.value == 6,
                          ontap: () {
                            sidebarController.setSelectedIndex(6, "Social Calendar");
                          },
                        ),
                        DashboardSideBarComp(
                          icon: Icons.message,
                          title: sidebarController.isSidebarVisible.value
                              ? 'Chats'
                              : null,
                          index: sidebarController.selectedIndex.value == 7,
                          ontap: () {
                            sidebarController.setSelectedIndex(7, "Chats");
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
