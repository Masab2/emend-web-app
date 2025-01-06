import 'package:emend_web_app/config/Widgets/createEmailFormWidget/create_email_preview_widget.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/components/components.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/widgets/widgets.dart';
import 'package:emend_web_app/controllers/CreateEmailController/create_email_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateEmailCampaignView extends StatefulWidget {
  const CreateEmailCampaignView({super.key});

  @override
  State<CreateEmailCampaignView> createState() =>
      _CreateEmailCampaignViewState();
}

class _CreateEmailCampaignViewState extends State<CreateEmailCampaignView> {
  final controller = Get.put(CreateEmailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.viewsBackgroundColor,
        height: context.mh,
        child: Row(
          children: [
            SideBarWidgets(
              key: UniqueKey(),
            ),
            Expanded(
              child: Column(
                children: [
                  _buildStepper(),
                  SingleChildScrollView(
                    child: Container(
                      height: context.mh * 0.8,
                      width: context.mw * 0.7,
                      padding: EdgeInsets.symmetric(
                        horizontal: context.mw * 0.02,
                        vertical: context.mh * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Obx(() {
                        return getSelectedIndexForm(
                            controller.currentStep.value);
                      }),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          controller.previousStep();
                        },
                        child: const Text(
                          "Previous",
                          style: TextStyle(),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (controller.currentStep.value == 0 &&
                              controller.singleEmailController.value.text
                                  .isNotEmpty) {
                            controller.nextStep();
                          } else if (controller.currentStep.value == 1) {
                            if (controller.subjectController.value.text.isNotEmpty &&
                                controller
                                    .contentController.value.text.isNotEmpty &&
                                controller.fromName.value.text.isNotEmpty &&
                                controller.fromEmail.value.text.isNotEmpty) {
                              controller.nextStep();
                            } else {
                              Get.snackbar(
                                "Validation Error",
                                "Please fill all the required fields before proceeding.",
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            }
                          }
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepper() {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const StepItemComp(
              step: 0,
              title: 'Send To',
              active: true,
            ),
            const StepDividerComp(),
            StepItemComp(
              step: 1,
              title: 'Subject and Content',
              active: controller.currentStep.value >= 1,
            ),
            const StepDividerComp(),
            StepItemComp(
              step: 2,
              title: 'Preview',
              active: controller.currentStep.value >= 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget getSelectedIndexForm(int index) {
    switch (index) {
      case 0:
        return ContactListEmailWidget();
      case 1:
        return const CreateEmailFormSetupWidget();
      case 2:
        return EmailPreviewWidget();
      default:
        return const Text("No Form");
    }
  }
}
