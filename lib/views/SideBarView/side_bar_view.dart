import 'package:emend_web_app/Controllers/controller.dart';
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
      case 1:
        return const EmailCompaignsView();
      case 2:
        return const SmsCompaignView();
      case 7:
        return const ChatView();
      default:
        return const Center(child: Text('Page not found'));
    }
  }
}
