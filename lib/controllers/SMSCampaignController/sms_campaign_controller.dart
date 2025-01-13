import 'package:emend_web_app/Repository/SendMessageRepo/send_message_http_repo.dart';
import 'package:emend_web_app/Repository/SendMessageRepo/send_message_repo.dart';
import 'package:emend_web_app/controllers/ContactListController/contact_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  void createSMSCampaignView() {}
}
