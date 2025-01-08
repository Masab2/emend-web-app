import 'dart:developer';

import 'package:emend_web_app/Repository/GenerateEmailRepo/generate_email_http_repo.dart';
import 'package:emend_web_app/Repository/GenerateEmailRepo/generate_email_repo.dart';
import 'package:emend_web_app/Repository/SendEmailRepo/send_email_http_repo.dart';
import 'package:emend_web_app/Repository/SendEmailRepo/send_email_repo.dart';
import 'package:emend_web_app/controllers/ContactListController/contact_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateEmailController extends GetxController {
  RxBool showCreateEmailView = false.obs;
  var showEmailTypeSelection = true.obs;
  var selectedEmailType = ''.obs;
  var selectedRecipentType = 'Single'.obs;

  final selectedTemplateType = 'saved'.obs;
  final singleEmailController = TextEditingController().obs;
  void showCreateEmailUi(bool visibility) {
    showCreateEmailView.value = visibility;
  }

  final RxList<Map<String, String>> selectedEmails =
      <Map<String, String>>[].obs;

  var currentStep = 0.obs;

  void nextStep() {
    if (currentStep.value < 2) currentStep.value++;
  }

  void previousStep() {
    if (currentStep.value > 0) currentStep.value--;
  }

  var selectedContacts = <String>[].obs;
  var isSearchFocused = false.obs;

  final controller = Get.put(ContactListController());
  // Filter List of Contacts
  void filterList(String value) {
    if (value.isEmpty) {
      controller.getContactListApi();
    } else {
      controller.getListModel.value.list = controller.getListModel.value.list!
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
  }

  @override
  void onInit() {
    super.onInit();
    controller.getContactListApi();
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

  final RxString selectedTone = 'Professional'.obs;
  final RxString subject = ''.obs;
  final RxString callToAction = ''.obs;

  var subjectController = TextEditingController().obs;
  var contentController = TextEditingController().obs;
  var fromName = TextEditingController().obs;
  var fromEmail = TextEditingController().obs;

  // List of available tones
  final List<String> tones = [
    'Professional',
    'Friendly',
    'Casual',
    'Formal',
    'Persuasive',
    'Enthusiastic',
    'Urgent',
    'Informative'
  ];

  void setTone(String? value) {
    if (value != null) {
      selectedTone.value = value;
    }
  }

  void setSubject(String value) {
    subject.value = value;
  }

  void setCallToAction(String value) {
    callToAction.value = value;
  }

  final GenerateEmailRepo _generateEmailRepo = GenerateEmailHttpRepo();

  void generateEmailApi() async {
    await _generateEmailRepo
        .generateEmailApi(selectedTone.value, subject.value, callToAction.value)
        .then(
      (value) {
        subjectController.value.text = value.email?.emailContent?.subject ?? '';
        contentController.value.text = value.email?.emailContent?.body ?? '';
        log(value.email?.emailContent?.subject ?? '');
        Get.back();
      },
    ).onError((error, stackTrace) {
      log(error.toString());
    });
  }

  final SendEmailRepo _sendEmailRepo = SendEmailHttpRepo();

  void sendEmailApi(contentType) async {
    try {
      await _sendEmailRepo
          .sendEmailApi(
        selectedEmails,
        fromEmail.value.text,
        subjectController.value.text,
        contentType,
        contentController.value.text,
      )
          .then((value) {
        Get.snackbar(
          "Email Sent",
          "Email has been sent successfully.",
          snackPosition: SnackPosition.BOTTOM,
        );
      }).onError((error, stackTrace) {
        log(error.toString());
        Get.snackbar(
          "Error",
          error.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
