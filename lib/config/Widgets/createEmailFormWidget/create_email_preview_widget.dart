import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/controllers/CreateEmailController/create_email_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailPreviewWidget extends StatelessWidget {
  EmailPreviewWidget({super.key});

  final controller = Get.find<CreateEmailController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Text(
                "Email Preview",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.bold,
                  fontSize: context.mh * 0.025,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios,
                size: context.mh * 0.020,
              ),
            ],
          ),
          0.02.ph(context),

          // Preview Container
          Container(
            width: context.mw,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey[300]!),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                // Email Header
                Container(
                  padding: EdgeInsets.all(context.mw * 0.02),
                  decoration: const BoxDecoration(
                    color: AppColor.textFormFieldBgColor,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColor.primaryColor.withOpacity(0.1),
                        child: Icon(
                          Icons.email_outlined,
                          color: AppColor.primaryColor,
                          size: context.mh * 0.025,
                        ),
                      ),
                      SizedBox(width: context.mw * 0.02),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() => Row(
                                  children: [
                                    Text(
                                      "From: ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: context.mh * 0.016,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Text(
                                      "${controller.fromName.value.text} <${controller.fromEmail.value.text}>",
                                      style: TextStyle(
                                        fontSize: context.mh * 0.016,
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(height: context.mh * 0.01),
                            Obx(() => Text(
                                  "Subject: ${controller.subjectController.value.text}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: context.mh * 0.016,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Email Content
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(context.mw * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Content based on email type
                      Obx(() => controller.selectedEmailType.value == 'template'
                          ? _buildTemplatePreview(context)
                          : _buildTextPreview(context)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          0.02.ph(context),

          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildActionButton(
                context,
                "Send Test Email",
                Icons.send_outlined,
                () {
                  controller.sendEmailApi("HTML");
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextPreview(BuildContext context) {
    return Obx(() => Text(
          controller.contentController.value.text,
          style: TextStyle(
            fontSize: context.mh * 0.016,
            height: 1.5,
          ),
        ));
  }

  Widget _buildTemplatePreview(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.mw * 0.02),
      decoration: BoxDecoration(
        color: AppColor.textFormFieldBgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Selected Template:",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: context.mh * 0.016,
            ),
          ),
          SizedBox(height: context.mh * 0.01),
          // Replace with actual template preview
          Container(
            height: context.mh * 0.3,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Center(
              child: Text(
                "Template Preview",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: context.mh * 0.016,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String label,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.mw * 0.015,
          vertical: context.mh * 0.012,
        ),
        decoration: BoxDecoration(
          color: AppColor.primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: context.mh * 0.02,
              color: AppColor.primaryColor,
            ),
            SizedBox(width: context.mw * 0.01),
            Text(
              label,
              style: TextStyle(
                color: AppColor.primaryColor,
                fontSize: context.mh * 0.016,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
