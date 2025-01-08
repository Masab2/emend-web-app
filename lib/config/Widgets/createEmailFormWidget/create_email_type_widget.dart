import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/controllers/CreateEmailController/create_email_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Color/app_color.dart';

class CreateEmailTypeWidget extends StatelessWidget {
  CreateEmailTypeWidget({super.key});
  final controller = Get.put(CreateEmailController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
      child: Row(
        children: [
          _buildTemplateCard(
            context,
            "Text Email",
            "Create The text email Driectly by Using AI",
            Icons.edit_document,
            'text',
          ),
          SizedBox(width: context.mw * 0.02),
          _buildTemplateCard(
            context,
            "Templates",
            "Choose from templates saved on your account or predesigned templates.",
            Icons.article_outlined,
            'template',
          ),
        ],
      ),
    );
  }

  Widget _buildTemplateCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    String type,
  ) {
    return Obx(() {
      return InkWell(
        onTap: () => controller.selectedEmailType.value = type,
        child: Container(
          height: context.mh * 0.3,
          width: context.mw * 0.25,
          padding: EdgeInsets.all(context.mw * 0.02),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: controller.selectedEmailType.value == type
                  ? AppColor.primaryColor
                  : Colors.grey[200]!,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(context.mw * 0.01),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: AppColor.primaryColor,
                  size: context.mh * 0.03,
                ),
              ),
              SizedBox(height: context.mh * 0.015),
              Text(
                title,
                style: TextStyle(
                  fontSize: context.mh * 0.018,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: context.mh * 0.01),
              Text(
                description,
                style: TextStyle(
                  fontSize: context.mh * 0.014,
                  color: Colors.grey[600],
                  height: 1.4,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      );
    });
  }
}
