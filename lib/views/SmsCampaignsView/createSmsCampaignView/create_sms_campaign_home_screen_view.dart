import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/components/components.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/widgets/widgets.dart';
import 'package:emend_web_app/controllers/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'create_sms_campaign_view.dart';

class CreateSmsCampaignHomeScreenView extends StatelessWidget {
  final StepController controller = Get.put(StepController());
  final smsController = Get.put(SmsCampaignController());

  CreateSmsCampaignHomeScreenView({super.key});
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
                title: 'Settings',
                active: true,
              ),
              const StepDividerComp(),
              StepItemComp(
                step: 1,
                title: 'Contacts',
                active: controller.currentStep.value >= 1,
              ),
              const StepDividerComp(),
              StepItemComp(
                step: 2,
                title: 'Messages',
                active: controller.currentStep.value >= 2,
              ),
            ],
          ),
        ));
  }

  Widget _buildCurrentStep(BuildContext context) {
    return Obx(() {
      switch (controller.currentStep.value) {
        case 0:
          return _buildSettingsStep(context);
        case 1:
          return ContactListSmsWidget();
        case 2:
          return CreateSMSBulkCampaignView();
        default:
          return const SizedBox();
      }
    });
  }

  Widget _buildSettingsStep(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFormField(
          'Campaign Name',
          TextField(
            controller: smsController.campaignNameController.value,
            decoration: InputDecoration(
              hintText: 'Enter Campaign Name',
              hintStyle: TextStyle(fontSize: context.mh * 0.020),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
            onChanged: (value) => controller.campaignName.value = value,
          ),
          context,
        ),
        _buildFormField(
            'Inbox',
            DropdownButtonFormField<String>(
              value: controller.selectedInbox.value,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              items: ['Campaign 2 Test'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) => controller.selectedInbox.value = value!,
            ),
            context),
      ],
    );
  }

  Widget _buildFormField(String label, Widget field, BuildContext context) {
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
          height: context.mh * 0.06,
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
}
