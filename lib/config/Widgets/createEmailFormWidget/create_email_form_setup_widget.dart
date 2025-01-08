import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/utils/Dialog/email_generation_dialog.dart';
import 'package:emend_web_app/controllers/CreateEmailController/create_email_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
class CreateEmailFormSetupWidget extends StatefulWidget {
  const CreateEmailFormSetupWidget({super.key});

  @override
  State<CreateEmailFormSetupWidget> createState() =>
      _CreateEmailFormSetupWidgetState();
}

class _CreateEmailFormSetupWidgetState
    extends State<CreateEmailFormSetupWidget> {
  final controller = Get.put(CreateEmailController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
        child: Column(
          children: [
            // Heading Widget
            _buildHeading(context),
            0.02.ph(context),
            Row(
              children: [
                Expanded(
                  child: _buildFormField(
                    "From Name",
                    TextField(
                      controller: controller.fromName.value,
                      decoration: InputDecoration(
                        hintText: 'Enter Campaign Name',
                        hintStyle: TextStyle(fontSize: context.mh * 0.020),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                      ),
                    ),
                    context,
                    context.mh * 0.06,
                  ),
                ),
                0.01.pw(context),
                Expanded(
                  child: _buildFormField(
                    "From Email",
                    TextField(
                      controller: controller.fromEmail.value,
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                        hintStyle: TextStyle(fontSize: context.mh * 0.020),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                      ),
                    ),
                    context,
                    context.mh * 0.06,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                Text(
                  "Use a different reply-to email address",
                  style: GoogleFonts.outfit(
                    fontSize: context.mh * 0.018,
                  ),
                ),
              ],
            ),
            0.02.ph(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildGenerateEmailButton(context),
              ],
            ),
            _buildFormField(
              "Subject",
              TextField(
                controller: controller.subjectController.value,
                decoration: InputDecoration(
                  hintText: 'Enter Subject',
                  hintStyle: TextStyle(fontSize: context.mh * 0.020),
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
              ),
              context,
              context.mh * 0.06,
            ),
            // Content Selection Area
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Content",
                  style: GoogleFonts.outfit(
                    fontWeight: FontWeight.bold,
                    fontSize: context.mh * 0.018,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: context.mw,
                  decoration: BoxDecoration(
                    color: AppColor.textFormFieldBgColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Container(
                    height: context.mh * 0.25,
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      controller: controller.contentController.value,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Enter Content',
                        hintStyle: TextStyle(fontSize: context.mh * 0.020),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget _buildFormField(
      String label, Widget field, BuildContext context, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            fontSize: context.mh * 0.018,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: height,
          width: context.mw,
          decoration: BoxDecoration(
            color: AppColor.textFormFieldBgColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: field,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildHeading(BuildContext context) {
    return Row(
      children: [
        Text(
          "Subject & Content",
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
    );
  }

  Widget _buildGenerateEmailButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.dialog(
          EmailGenerationDialog(),
          barrierDismissible: false,
        );
      },
      child: Container(
        width: context.mw * 0.15,
        height: context.mh * 0.06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.auto_awesome,
              size: context.mh * 0.025,
              color: Colors.white,
            ),
            0.01.pw(context),
            Text(
              'Generate Email',
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: context.mh * 0.020,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
