import 'dart:developer';

import 'package:emend_web_app/Repository/SendMessageRepo/send_message_http_repo.dart';
import 'package:emend_web_app/Repository/SendMessageRepo/send_message_repo.dart';
import 'package:emend_web_app/controllers/ContactListController/contact_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SmsCampaignController extends GetxController {
  var isDropdownOpen = false.obs;
  void toggleDropdown() {
    isDropdownOpen.value = !isDropdownOpen.value;
  }

  final contactListController = Get.put(ContactListController());

  final messageController = TextEditingController();
  final availableFields = <String>[
    'first_name',
    'last_name',
    'email',
    'phone',
  ].obs;

  final message = ''.obs;

  @override
  void onInit() {
    super.onInit();
    contactListController.getContactListApi();
    messageController.addListener(() {
      message.value = messageController.text;
    });
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }

  void updateMessage(String value) {
    message.value = value;
  }

  void insertFieldAtCursor(String field) {
    final text = messageController.text;
    final selection = messageController.selection;

    final newText = text.replaceRange(
      selection.start,
      selection.end,
      '{{$field}}',
    );

    final newCursorPosition = selection.start + field.length + 4;

    messageController.value = TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newCursorPosition),
    );

    updateMessage(newText);
  }

  final SendMessageRepo _repo = SendMessageHttpRepo();

  void sendSingleUserMessageApi() async {
    if (message.value == "") {
      Get.snackbar("Empty Fields", "Please Enter the message");
    } else {
      await _repo
          .singleSendMessageApi(
              contactListController.selectedContactController.value.text, message.value)
          .then(
        (value) {
          Get.snackbar("Success", "Message Sent Successfully");
          messageController.clear();
          message.value = "";
        },
      ).onError(
        (error, stackTrace) {},
      );
    }
  }

  var sendImmediately = true.obs;

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

  // Combine selected date and time into the desired format
  String getFormattedDateTime() {
    DateTime dateTime;

    // Combine selected date and time for scheduled sending
    dateTime = DateTime(
      selectedDate.value.year,
      selectedDate.value.month,
      selectedDate.value.day,
      selectedTime.value.hour,
      selectedTime.value.minute,
    ).toUtc();

    // Format the DateTime to "2025-01-13T18:38:00.000Z"
    return DateFormat("yyyy-MM-ddTHH:mm:ss.sss'Z'").format(dateTime);
  }

  // Bulk SMS Campaigns
  var campaignNameController = TextEditingController().obs;
  var selectListController = TextEditingController().obs;
  var textContentController = TextEditingController().obs;
  var executeAtController = TextEditingController().obs;

  void smsCampaignsApi(listid, inboxId) async {
    if (sendImmediately.value) {
      _repo
          .bulkSendMessageImmidiateApi(campaignNameController.value.text,
              listid, inboxId, textContentController.value.text)
          .then(
        (value) {
          textContentController.value.clear();
          Get.snackbar("Success", value.message.toString());
        },
      ).onError(
        (error, stackTrace) {
          Get.snackbar("Error", error.toString());
        },
      );
    } else {
      final formattedDateTime = getFormattedDateTime();
      log(formattedDateTime);
      if (campaignNameController.value.text.isEmpty &&
          selectListController.value.text.isEmpty &&
          textContentController.value.text.isEmpty) {
        Get.snackbar("Error", "All fields are required");
      } else {
        final formattedDateTime = getFormattedDateTime();
        await _repo
            .bulkSendMessageSchdueleApi(
          campaignNameController.value.text,
          listid,
          inboxId,
          textContentController.value.text,
          formattedDateTime,
        )
            .then(
          (value) {
            textContentController.value.clear();
            Get.snackbar("Success", value.message.toString());
          },
        ).onError(
          (error, stackTrace) {
            Get.snackbar("Error", error.toString());
          },
        );
      }
    }
  }
}
