import 'package:emend_web_app/Controllers/StepController/step_controller.dart';
import 'package:emend_web_app/Controllers/controller.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:emend_web_app/config/widgets/widgets.dart';
import 'package:emend_web_app/views/SmsCompaignsView/createSmsCompaignView/create_sms_compaign_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateSmsCampaignHomeScreenView extends StatelessWidget {
  final StepController controller = Get.put(StepController());
  final smscontroller = Get.put(SmsCompaignController());
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
                  smscontroller.showsmsCompaignView.value = false;
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
                child: Text(
                  "Previous",
                  style: GoogleFonts.barlow(),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  controller.nextStep();
                },
                child: Text(
                  "Next",
                  style: GoogleFonts.barlow(),
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
              _stepItem('Settings', 0, true),
              _stepDivider(),
              _stepItem('Contacts', 1, controller.currentStep.value >= 1),
              _stepDivider(),
              _stepItem('Messages', 2, controller.currentStep.value >= 2),
            ],
          ),
        ));
  }

  Widget _stepItem(String title, int step, bool active) {
    return Row(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: active ? Colors.black : Colors.grey[300],
          child: Text(
            '${step + 1}',
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            color: active ? Colors.black : Colors.grey,
            fontWeight: active ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _stepDivider() {
    return Container(
      width: 40,
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: Colors.grey[300],
    );
  }

  Widget _buildCurrentStep(BuildContext context) {
    return Obx(() {
      switch (controller.currentStep.value) {
        case 0:
          return _buildSettingsStep(context);
        case 1:
          return ContactListSmsWidget();
        case 2:
          return CreateSmsCompaignView();
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
              decoration: InputDecoration(
                hintText: 'Enter Campaign Name',
                hintStyle: TextStyle(fontSize: context.mh * 0.020),
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
              onChanged: (value) => controller.campaignName.value = value,
            ),
            context),
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
        _buildFormField(
          'Tags',
          TextField(
            decoration: InputDecoration(
              hintText: 'Add Tag',
              hintStyle: TextStyle(fontSize: context.mh * 0.020),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
          context,
        ),
        _buildFormField(
          'Timezone',
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            items: const [],
            onChanged: (value) => controller.selectedTimezone.value = value!,
          ),
          context,
        ),
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
            color: AppColor.textFormFeildBackgroundColor,
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
