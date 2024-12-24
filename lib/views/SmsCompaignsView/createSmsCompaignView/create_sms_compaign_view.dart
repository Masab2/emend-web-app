// ignore_for_file: use_key_in_widget_constructors

import 'package:emend_web_app/Controllers/StepController/step_controller.dart';
import 'package:emend_web_app/Controllers/smsCompaignController/sms_compaign_controller.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CreateSmsCompaignView extends StatelessWidget {
  final StepController controller = Get.put(StepController());

  @override
  Widget build(BuildContext context) {
    final createSmsController = Get.put(SmsCompaignController());

    return Container(
      color: AppColor.viewsBackgroundColor,
      height: context.mh,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildHeader(context, createSmsController),
              const SizedBox(height: 24),
              _buildMessageList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(
      BuildContext context, SmsCompaignController createSmsController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () => createSmsController.showCreateEmailUi(false),
              icon: Icon(Icons.arrow_back, size: context.mh * 0.020),
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
        _buildAddMessageButton(),
      ],
    );
  }

  Widget _buildAddMessageButton() {
    return Obx(() => controller.messageCount.value < 5
        ? ElevatedButton.icon(
            onPressed: controller.incrementMessage,
            icon: const Icon(Icons.add, color: Colors.white),
            label: const Text(
              'Add Message',
              style: TextStyle(color: Colors.white),
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
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
            _buildCardHeader(index),
            const Divider(height: 24),
            _buildSendOptions(context),
            const SizedBox(height: 16),
            _buildMessageInput(),
            const SizedBox(height: 16),
            _buildFieldChips(),
            const SizedBox(height: 16),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardHeader(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Message ${index + 1}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (index > 0)
          TextButton.icon(
            onPressed: controller.decrementMessage,
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            label: const Text(
              'Remove',
              style: TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }

  Widget _buildSendOptions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sending Options',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Obx(() => Column(
              children: [
                RadioListTile<bool>(
                  title: const Text('Send Immediately'),
                  value: true,
                  groupValue: controller.sendImmediately.value,
                  onChanged: (value) => controller.sendImmediately.value = true,
                  contentPadding: EdgeInsets.zero,
                ),
                RadioListTile<bool>(
                  title: const Text('Schedule Send'),
                  value: false,
                  groupValue: controller.sendImmediately.value,
                  onChanged: (value) =>
                      controller.sendImmediately.value = false,
                  contentPadding: EdgeInsets.zero,
                ),
                if (!controller.sendImmediately.value) _buildScheduleOptions(context),
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
          const Text('Send after'),
          const SizedBox(width: 8),
          Obx(() {
            final formattedDate = DateFormat('yyyy-MM-dd').format(controller.selectedDate.value);
            return ElevatedButton(
              onPressed: () => controller.pickDate(context),
              child: Text(formattedDate),
            );
          }),
          const SizedBox(width: 8),
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

  Widget _buildMessageInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Message Content',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
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

  Widget _buildFieldChips() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Available Fields',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: controller.fields.map((field) {
            return InputChip(
              label: Text(field),
              onPressed: () {},
              backgroundColor: AppColor.primaryColor.withOpacity(0.1),
              labelStyle: const TextStyle(color: AppColor.primaryColor),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
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
      ],
    );
  }
}
