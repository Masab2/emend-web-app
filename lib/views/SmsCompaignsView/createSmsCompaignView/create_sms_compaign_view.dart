import 'package:emend_web_app/Controllers/StepController/step_controller.dart';
import 'package:emend_web_app/Controllers/smsCompaignController/sms_compaign_controller.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/components/stepIndicator/step_indicator.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateSmsCompaignView extends StatelessWidget {
  const CreateSmsCompaignView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the StepController
    final StepController stepController = Get.put(StepController());
    final createSmsController = Get.put(SmsCompaignController());

    return Container(
      color: AppColor.viewsBackgroundColor,
      height: context.mh,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    createSmsController.showCreateEmailUi(false);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: context.mh * 0.020,
                  ),
                ),
                Text(
                  "Create SMS Campaign",
                  style: GoogleFonts.barlow(
                    fontSize: context.mh * 0.028,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            // Steps Section
            Container(
              height: context.mh * 0.8,
              width: context.mw,
              child: Obx(
                () => SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Steps Map: Display steps dynamically
                      ...stepController.steps.map((step) {
                        final int index = stepController.steps.indexOf(step);
                        return StepIndicator(
                          title: step.title,
                          isActive: step.isActive,
                          isLast: index == stepController.steps.length - 1,
                          widget: step.widget,
                          onRemove: () {
                            stepController.removeStep(index);
                          },
                        );
                      }),

                      const SizedBox(height: 20),
                      // Add Step Button
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.mw * 0.03,
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                stepController.addStep();
                              },
                              child: const CircleAvatar(
                                backgroundColor: AppColor.blueColor,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
