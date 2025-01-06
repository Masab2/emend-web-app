import 'package:emend_web_app/config/Color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailGenerationDialog extends StatelessWidget {
  final CreateEmailController controller = Get.put(CreateEmailController());

  EmailGenerationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: context.mw * 0.6,
        height: context.mh * 0.6,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Generate Email',
                  style: TextStyle(
                    fontSize: context.mh * 0.025,
                    fontWeight: FontWeight.w600,
                    color: AppColor.primaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Tone',
                      style: TextStyle(
                        fontSize: context.mh * 0.017,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    0.01.ph(context),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Obx(() => DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: controller.selectedTone.value,
                              isExpanded: false,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              borderRadius: BorderRadius.circular(10),
                              items: controller.tones.map((String tone) {
                                return DropdownMenuItem<String>(
                                  value: tone,
                                  child: Text(
                                    tone,
                                    style: TextStyle(
                                      fontSize: context.mh * 0.018,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: controller.setTone,
                            ),
                          )),
                    ),
                  ],
                ),
                0.04.pw(context),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Subject Field
                      Text(
                        'Subject Line',
                        style: TextStyle(
                          fontSize: context.mh * 0.017,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      0.01.ph(context),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: TextField(
                          onChanged: controller.setSubject,
                          decoration: InputDecoration(
                            hintText: 'Enter subject line',
                            hintStyle: GoogleFonts.outfit(
                              color: Colors.grey[400],
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Tone Selection

            0.02.ph(context),

            Text(
              'Call to Action',
              style: TextStyle(
                fontSize: context.mh * 0.017,
                fontWeight: FontWeight.w600,
              ),
            ),
            0.01.ph(context),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: TextField(
                onChanged: controller.setCallToAction,
                decoration: InputDecoration(
                  hintText: 'Enter call to action',
                  hintStyle: GoogleFonts.outfit(
                    color: Colors.grey[400],
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
            ),
            0.03.ph(context),

            // Generate Button
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColor.primaryColor),
                        padding: EdgeInsets.symmetric(
                          horizontal: context.mw * 0.02,
                          vertical: context.mh * 0.018,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: context.mh * 0.017,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    0.01.pw(context),
                    ElevatedButton(
                      onPressed: () {
                        controller.generateEmailApi();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: context.mw * 0.02,
                          vertical: context.mh * 0.018,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.auto_awesome,
                              size: 20, color: AppColor.whiteColor),
                          0.01.pw(context),
                          Text(
                            'Generate',
                            style: TextStyle(
                              fontSize: context.mh * 0.018,
                              fontWeight: FontWeight.w600,
                              color: AppColor.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
