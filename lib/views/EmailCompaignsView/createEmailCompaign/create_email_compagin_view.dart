// ignore_for_file: deprecated_member_use

import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/components/stepIndicator/step_divider_comp.dart';
import 'package:emend_web_app/config/components/stepIndicator/step_item_comp.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:emend_web_app/config/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Controllers/createEmailController/create_email_controller.dart';

class CreateEmailCompaginView extends StatefulWidget {
  const CreateEmailCompaginView({super.key});

  @override
  State<CreateEmailCompaginView> createState() =>
      _CreateEmailCompaginViewState();
}

class _CreateEmailCompaginViewState extends State<CreateEmailCompaginView> {
  final controller = Get.put(CreateEmailController());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.viewsBackgroundColor,
      height: context.mh,
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  controller.showCreateEmailView.value = false;
                },
                child: Icon(
                  Icons.arrow_back,
                  size: context.mh * 0.020,
                ),
              ),
            ],
          ),
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
                return getselectedIndexForm(controller.currentStep.value);
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
                child: Text(
                  "Previous",
                  style: TextStyle(),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  controller.nextStep();
                },
                child: Text(
                  "Next",
                  style: TextStyle(),
                ),
              )
            ],
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
                title: 'Send To',
                active: true,
              ),
              const StepDividerComp(),
              StepItemComp(
                step: 1,
                title: 'Suject and Content',
                active: controller.currentStep.value >= 1,
              ),
              const StepDividerComp(),
              StepItemComp(
                step: 2,
                title: 'Content',
                active: controller.currentStep.value >= 2,
              ),
            ],
          ),
        ));
  }

  Widget getselectedIndexForm(int index) {
    switch (index) {
      case 0:
        return ContactListEmailWidget();
      case 1:
        return const CreateEmailFormSetupWidget();
      case 2:
        return CreateEmailSelectTemplateWidget();
      default:
        return const Text("No Form");
    }
  }
}
