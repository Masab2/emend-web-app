import 'package:emend_web_app/Model/StepModel/step_model.dart';
import 'package:emend_web_app/config/widgets/smsCompaginWidgets/createSmsCompaignWidget/schedule_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepController extends GetxController {
  // List of steps, initialized with one step
  var steps = <StepData>[].obs;

  @override
  void onInit() {
    steps.add(StepData(
      title: "Message 1",
      isActive: true,
      widget: const ScheduleMessageUI(),
    ));
    super.onInit();
  }

  // Method to add a new step
  void addStep() {
    steps.add(StepData(
      title: "Message ${steps.length + 1}",
      isActive: true,
      widget: const ScheduleMessageUI(),
    ));
  }

  void removeStep(int index) {
    steps.removeAt(index);
  }

  // Observable for visibility
  var isWrapVisible = false.obs;

  // Method to toggle visibility
  void toggleWrapVisibility() {
    isWrapVisible.value = !isWrapVisible.value;
  }

  // Remove the Stepper from the follwing index
  void removeStepFromIndex(int index) {
    steps.removeAt
    (index);
  }


  // Observable for message count
  var messageCount = 1.obs;
  var sendImmediately = true.obs;
  final selectedDays = 0.obs;
  final fields = [
    'First Name',
    'Last Name',
    'Phone Number',
    'Email',
    'Contact Owner',
    'Custom Field #7',
    'Custom Field #8',
    'Custom Field #9',
    'Custom Field #10',
    'Street Address',
    'City',
    'State',
    'Zip Code'
  ];

  void incrementMessage() => messageCount++;
  void decrementMessage() {
    if (messageCount > 1) messageCount--;
  }

  void toggleSendImmediately(bool value) => sendImmediately.value = value;


  var selectedDate = DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;

  void pickDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      selectedDate.value = pickedDate;
    }
  }

  void pickTime(BuildContext context) async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );

    if (pickedTime != null) {
      selectedTime.value = pickedTime;
    }
  }
}
