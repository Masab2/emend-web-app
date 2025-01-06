import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/controllers/SMSCampaignController/sms_campaign_controller.dart';
import 'package:emend_web_app/controllers/StepController/step_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateSMSCampaignView extends StatelessWidget {
  final StepController controller = Get.put(StepController());

  CreateSMSCampaignView({super.key});

  @override
  Widget build(BuildContext context) {
    final createSmsController = Get.put(SmsCampaignController());

    return SizedBox(
      height: context.mh,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.01),
          child: Column(
            children: [
              _buildHeader(context, createSmsController),
              0.01.ph(context),
              _buildMessageList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
      BuildContext context, SmsCampaignController createSmsController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildAddMessageButton(context),
      ],
    );
  }

  Widget _buildAddMessageButton(BuildContext context) {
    return Obx(() => controller.messageCount.value < 5
        ? ElevatedButton.icon(
            onPressed: controller.incrementMessage,
            icon: const Icon(Icons.add, color: Colors.white),
            label: Text(
              'Add Message',
              style:
                  TextStyle(color: Colors.white, fontSize: context.mh * 0.018),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          )
        : const SizedBox.shrink());
  }

  Widget _buildMessageList(BuildContext context) {
    return Obx(() => Stack(
          children: [
            // Vertical Timeline
            Positioned(
              left: 30,
              top: 0,
              bottom: 0,
              child: Container(
                width: 2,
                color: Colors.grey[300],
              ),
            ),
            Column(
              children: List.generate(
                controller.messageCount.value,
                (index) => _buildMessageCardWithTimeline(index, context),
              ),
            ),
          ],
        ));
  }

  Widget _buildMessageCardWithTimeline(int index, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline Node
        Container(
          margin: const EdgeInsets.only(top: 24, left: 24, right: 16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: context.mh * 0.018,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Message Card
        Expanded(
          child: _buildMessageCard(index, context),
        ),
      ],
    );
  }

  Widget _buildMessageCard(int index, BuildContext context) {
    return Card(
      color: AppColor.whiteColor,
      margin: const EdgeInsets.only(bottom: 24, right: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCardHeader(index, context),
            const Divider(height: 16),
            _buildSendOptions(context),
            const SizedBox(height: 16),
            _buildMessageInput(context),
            const SizedBox(height: 16),
            _buildFieldChips(context),
            const SizedBox(height: 16),
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCardHeader(int index, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Message ${index + 1}',
          style: TextStyle(
            fontSize: context.mh * 0.018,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (index > 0)
          TextButton.icon(
            onPressed: controller.decrementMessage,
            icon: Icon(Icons.delete_outline,
                color: Colors.red, size: context.mh * 0.020),
            label: Text(
              'Remove',
              style: TextStyle(color: Colors.red, fontSize: context.mh * 0.016),
            ),
          ),
      ],
    );
  }

  Widget _buildSendOptions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sending Options',
          style: TextStyle(
            fontSize: context.mh * 0.016,
            fontWeight: FontWeight.w500,
          ),
        ),
        0.006.ph(context),
        Obx(() => Column(
              children: [
                RadioListTile<bool>(
                  title: Text(
                    'Send Immediately',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                    ),
                  ),
                  value: true,
                  groupValue: controller.sendImmediately.value,
                  onChanged: (value) => controller.sendImmediately.value = true,
                  contentPadding: EdgeInsets.zero,
                ),
                RadioListTile<bool>(
                  title: Text(
                    'Schedule Send',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                    ),
                  ),
                  value: false,
                  groupValue: controller.sendImmediately.value,
                  onChanged: (value) =>
                      controller.sendImmediately.value = false,
                  contentPadding: EdgeInsets.zero,
                ),
                if (!controller.sendImmediately.value)
                  _buildScheduleOptions(context),
              ],
            )),
      ],
    );
  }

  Widget _buildScheduleOptions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: Row(
        children: [
          Text(
            'Send after',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.018,
            ),
          ),
          0.006.pw(context),
          Obx(() {
            final formattedDate =
                DateFormat('yyyy-MM-dd').format(controller.selectedDate.value);
            return ElevatedButton(
              onPressed: () => controller.pickDate(context),
              child: Text(formattedDate),
            );
          }),
          0.006.pw(context),
          Obx(() {
            final formattedTime = controller.selectedTime.value.format(context);
            return ElevatedButton(
              onPressed: () => controller.pickTime(context),
              child: Text(formattedTime),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildMessageInput(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Message Content',
          style: TextStyle(
            fontSize: context.mh * 0.016,
            fontWeight: FontWeight.w500,
          ),
        ),
        0.006.ph(context),
        TextField(
          decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: context.mh * 0.016),
            hintText:
                'Hey {{first_name}}, Reply with STOP to stop receiving messages.',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: Colors.grey[50],
          ),
          maxLines: 3,
        ),
      ],
    );
  }

  Widget _buildFieldChips(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Available Fields',
          style: TextStyle(
            fontSize: context.mh * 0.016,
            fontWeight: FontWeight.w500,
          ),
        ),
        0.006.ph(context),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: controller.fields.map((field) {
            return InputChip(
              label: Text(field),
              onPressed: () {},
              backgroundColor: AppColor.primaryColor.withValues(alpha: 0.1),
              labelStyle: TextStyle(
                  color: AppColor.primaryColor, fontSize: context.mh * 0.016),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.insert_emoticon),
          onPressed: () {},
          tooltip: 'Add Emoji',
        ),
        IconButton(
          icon: const Icon(Icons.attach_file),
          onPressed: () {},
          tooltip: 'Attach File',
        ),
        Container(
          margin: const EdgeInsets.only(left: 16),
          child: ElevatedButton.icon(
            onPressed: () => _showAIAssistantDialog(context),
            icon: const Icon(Icons.chat),
            label: Text(
              'AI Assistant',
              style: TextStyle(fontSize: context.mh * 0.016),
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showAIAssistantDialog(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: context.mw * 0.6,
              maxHeight: context.mh * 0.9,
            ),
            child: Obx(() {
              return Container(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'AI Assistant',
                              style: TextStyle(
                                fontSize: context.mh * 0.022,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                        0.01.ph(context),

                        // Tone Selection
                        Text(
                          'Select Tone',
                          style: TextStyle(
                            fontSize: context.mh * 0.016,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        0.006.ph(context),
                        Obx(() {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: controller.selectedTone.value,
                                items: controller.tones.map((String tone) {
                                  return DropdownMenuItem<String>(
                                    value: tone,
                                    child: Text(tone),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  controller.updateTone(newValue!);
                                },
                              ),
                            ),
                          );
                        }),
                        0.01.ph(context),

                        // Occasion Input
                        Text(
                          'Occasion',
                          style: TextStyle(
                            fontSize: context.mh * 0.016,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        0.006.ph(context),
                        TextFormField(
                          controller: controller.occassionController.value,
                          decoration: InputDecoration(
                            hintText: 'Enter the occasion or purpose',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 16,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the occasion';
                            }
                            return null;
                          },
                        ),
                        0.01.ph(context),

                        // Additional Notes
                        Text(
                          'Additional Notes',
                          style: TextStyle(
                            fontSize: context.mh * 0.016,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        0.006.ph(context),
                        TextFormField(
                          controller:
                              controller.additionalNotesController.value,
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText:
                                'Add any additional notes or requirements',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 16,
                            ),
                          ),
                        ),
                        0.01.ph(context),

                        // Generate Button
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                controller.generateSmsMessage();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Generate Content',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                        0.01.ph(context),

                        // Generated Content
                        Text(
                          'Generated Content',
                          style: TextStyle(
                            fontSize: context.mh * 0.016,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        0.006.ph(context),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Stack(
                            children: [
                              TextFormField(
                                controller: controller.generatedText.value,
                                maxLines: 5,
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText:
                                      'Generated content will appear here',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  contentPadding: const EdgeInsets.all(16),
                                ),
                              ),
                              Positioned(
                                right: 8,
                                top: 8,
                                child: IconButton(
                                  icon: const Icon(Icons.copy),
                                  onPressed: () {
                                    Clipboard.setData(ClipboardData(
                                      text: controller.generatedText.value.text,
                                    ));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Content copied to clipboard'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  },
                                  tooltip: 'Copy to clipboard',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
