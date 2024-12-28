import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/components/stepIndicator/step_divider_comp.dart';
import 'package:emend_web_app/config/components/stepIndicator/step_item_comp.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/widgets/CreateEmailFormWidget/create_email_form_setup_widget.dart';
import 'package:emend_web_app/config/widgets/CreateEmailFormWidget/create_email_template_widget.dart';
import 'package:emend_web_app/config/widgets/EmailCampaignWidgets/contact_list_email_widget.dart';
import 'package:emend_web_app/controllers/create_email_controller.dart';
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
                return getSelectedIndexForm(controller.currentStep.value);
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
                  controller.nextStep();
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
                title: 'Subject and Content',
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

  Widget getSelectedIndexForm(int index) {
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
