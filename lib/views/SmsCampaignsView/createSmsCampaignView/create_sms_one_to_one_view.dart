import 'package:emend_web_app/config/Color/app_color.dart';
import 'package:emend_web_app/config/Widgets/SMSCampaignWidgets/CreateOneTOneSmsWidget/create_one_to_one_contact_widget.dart';
import 'package:emend_web_app/config/Widgets/SMSCampaignWidgets/CreateOneTOneSmsWidget/create_one_to_one_message_widget.dart';
import 'package:emend_web_app/config/Widgets/SideBarWidgets/side_bar_widgets.dart';
import 'package:emend_web_app/config/components/stepIndicator/step_divider_comp.dart';
import 'package:emend_web_app/config/components/stepIndicator/step_item_comp.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/controllers.dart';

class CreateSmsOneToOneView extends StatefulWidget {
  const CreateSmsOneToOneView({super.key});

  @override
  State<CreateSmsOneToOneView> createState() => _CreateSmsOneToOneViewState();
}

class _CreateSmsOneToOneViewState extends State<CreateSmsOneToOneView> {
  final StepController controller = Get.put(StepController());
  final smsController = Get.put(SmsCampaignController());
  final contactController = Get.put(ContactListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBarWidgets(
            key: UniqueKey(),
          ),
          Expanded(
            child: Container(
              color: AppColor.viewsBackgroundColor,
              height: context.mh,
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
                      child: _buildCurrentStep(context),
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
                          if (contactController.selectedContactController.value
                              .text.isNotEmpty) {
                            controller.nextStep();
                          } else {
                            Get.snackbar(
                              "Validation Error",
                              "Please Select the Contact Phone No",
                            );
                          }
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepper() {
    return Obx(() => Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const StepItemComp(
                step: 0,
                title: 'Contacts',
                active: true,
              ),
              const StepDividerComp(),
              StepItemComp(
                step: 1,
                title: 'Messages',
                active: controller.currentStep.value >= 1,
              ),
            ],
          ),
        ));
  }

  Widget _buildCurrentStep(BuildContext context) {
    return Obx(() {
      switch (controller.currentStep.value) {
        case 0:
          return const CreateOneToOneContactWidget();
        case 1:
          return const CreateOneToOneMessageWidget();
        default:
          return const SizedBox();
      }
    });
  }
}
