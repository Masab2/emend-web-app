import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepController extends GetxController {
  // Observable for message count
  var messageCount = 1.obs;
  var sendImmediately = true.obs;
  final selectedDays = 0.obs;
  var isSearchFocused = false.obs;
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

  var currentStep = 0.obs;
  var campaignName = ''.obs;
  var selectedInbox = 'Campaign 2 Test'.obs;
  var selectedTags = <String>[].obs;
  var selectedTimezone = ''.obs;

  void nextStep() {
    if (currentStep.value < 2) currentStep.value++;
  }

  void previousStep() {
    if (currentStep.value > 0) currentStep.value--;
  }

  var selectedContacts = <String>[].obs;
  var contactLists = [
    {'name': 'Test List', 'contacts': 4},
    {'name': 'test', 'contacts': 0},
    {'name': 'List created on 2024-12-24 00:01:20', 'contacts': 1},
    {'name': 'Emend Health Care 1', 'contacts': 139},
    {'name': 'Emend Health Care 2', 'contacts': 133},
  ].obs;

  var filteredContactLists = [].obs;

  @override
  void onInit() {
    super.onInit();
    filteredContactLists.value = contactLists;
  }

  void filterContacts(String query) {
    if (query.isEmpty) {
      filteredContactLists.value = contactLists;
    } else {
      filteredContactLists.value = contactLists
          .where((list) => list['name']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    }
  }

  var selectedCampaigns = <Map<String, dynamic>>[].obs;
  var isDropdownOpen = false.obs;

  void toggleDropdown() {
    isDropdownOpen.value = !isDropdownOpen.value;
  }

  void addToCampaign(Map<String, dynamic> campaign) {
    if (!selectedCampaigns.contains(campaign)) {
      selectedCampaigns.add(campaign);
    }
  }

  void removeFromCampaign(Map<String, dynamic> campaign) {
    selectedCampaigns.remove(campaign);
  }
}
