// ignore_for_file: deprecated_member_use

import 'package:emend_web_app/config/GlobalVarriable/global.dart';
import 'package:emend_web_app/config/assets/image_asset.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/components/EmptyStateComponent/empty_state_component.dart';
import 'package:emend_web_app/config/components/ErrorComponent/error_component.dart';
import 'package:emend_web_app/config/components/LoadingComponent/loading_component.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/utils/helper_functions.dart';
import 'package:emend_web_app/controllers/TemplateController/template_controller.dart';
import 'package:emend_web_app/data/Response/status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class TemplateGrid extends StatelessWidget {
  TemplateGrid({super.key});

  final TemplateController controller = Get.put(TemplateController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.rxRequestStatusForAllTemplate.value) {
        case Status.loading:
          return const LoadingComponent(
            title: 'Template Loading...',
          );
        case Status.error:
          return ErrorComponent(
            title: "Unable To Load the Templates",
            ontap: () {
              controller.getAllTemplateApi();
            },
          );
        case Status.completed:
          return _buildCompletedState(context);
        default:
          return const SizedBox.shrink();
      }
    });
  }

  Widget _buildCompletedState(BuildContext context) {
    final templates = controller.templateModel.value.templates;

    if (templates == null || templates.isEmpty) {
      return const EmptyStateComponent(
        title: 'No Templates Available',
        icon: IconlyLight.document,
      );
    }

    return Padding(
      padding: EdgeInsets.all(context.mw * 0.02),
      child: SizedBox(
        height: context.mh * 0.8,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _getCrossAxisCount(context),
            childAspectRatio: 0.6,
            crossAxisSpacing: context.mw * 0.02,
            mainAxisSpacing: context.mw * 0.02,
          ),
          itemCount: templates.length,
          itemBuilder: (context, index) =>
              _buildTemplateCard(context, templates[index]),
        ),
      ),
    );
  }

  Widget _buildTemplateCard(BuildContext context, dynamic template) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: () {
            templateCode.value = template.template ?? '';
            HelperFunctions.launchInSameTab();
            // Get.toNamed(
            //   RouteNames.templateEditor,
            //   arguments: {
            //     'code': templateCode.value,
            //     'token': token.value,
            //   },
            // );
          },
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    image: DecorationImage(
                      image: AssetImage(ImageAsset.templateImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Template Info
              Container(
                padding: EdgeInsets.all(context.mw * 0.01),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          template.name ?? 'Untitled Template',
                          style: TextStyle(
                            fontSize: context.mh * 0.016,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[800],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: context.mh * 0.005),
                        Row(
                          children: [
                            _buildTag(context, 'Email Template'),
                            IconButton(
                              onPressed: () {
                                templateCode.value = template.template ?? '';
                                HelperFunctions.launchInSameTab();
                                // Get.toNamed(RouteNames.templateEditor);
                              },
                              icon: Icon(
                                Icons.edit_outlined,
                                size: context.mh * 0.022,
                                color: AppColor.primaryColor,
                              ),
                              tooltip: 'Edit Template',
                              splashRadius: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(BuildContext context, String text) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.mw * 0.008,
        vertical: context.mh * 0.004,
      ),
      decoration: BoxDecoration(
        color: AppColor.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: context.mh * 0.012,
          color: AppColor.primaryColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  int _getCrossAxisCount(BuildContext context) {
    final width = context.mw;
    if (width > 1600) return 6;
    if (width > 1200) return 5;
    if (width > 900) return 4;
    if (width > 600) return 3;
    return 2;
  }
}
