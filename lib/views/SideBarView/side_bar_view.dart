import 'package:emend_web_app/Controllers/controller.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/widgets/widgets.dart';
import 'package:emend_web_app/views/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideBarView extends StatefulWidget {
  const SideBarView({super.key});

  @override
  State<SideBarView> createState() => _SideBarViewState();
}

class _SideBarViewState extends State<SideBarView> {
  final sidebarController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Obx(() {
        return Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  const SideBarWidgets(),
                  Expanded(
                    child: _getSelectedWidget(
                        sidebarController.selectedIndex.value),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _getSelectedWidget(int index) {
    switch (index) {
      case 0:
        return const DashboardView();
      case 1:
        return const EmailCompaignsView();
      case 2:
        return const SmsCompaignView();
      case 3:
        return const ReportsView();
      case 5:
        return const SocialCalendarView();
      case 6:
        return const ChatView();
      default:
        return const Center(child: Text('Page not found'));
    }
  }
}
