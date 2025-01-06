import 'dart:developer';
import 'package:emend_web_app/Model/GetListModel/get_list_model.dart';
import 'package:emend_web_app/Repository/CreateListAndContactRepo/create_list_and_contact_http_repo.dart';
import 'package:emend_web_app/Repository/CreateListAndContactRepo/create_list_and_contact_repo.dart';
import 'package:emend_web_app/data/Response/status.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ContactListController extends GetxController {
  RxBool showCreateContactView = false.obs;
  final CreateListAndContactRepo _createListAndContactRepo =
      CreateListAndContactHttpRepo();

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController editFirstNameController = TextEditingController();
  TextEditingController editLastNameController = TextEditingController();
  TextEditingController editEmailController = TextEditingController();
  TextEditingController editPhoneController = TextEditingController();

  @override
  void onInit() {
    getContactListApi();
    super.onInit();
  }
  
  void showCreateContactUi(bool visibility) {
    showCreateContactView.value = visibility;
  }

  var contactList = <Contact>[].obs;

  RxBool showContactListInList = false.obs;
  void showContactListUi(bool visibility, List<Contact> contact) {
    showContactListInList.value = visibility;
    contactList.value = contact;
  }

  Future<FilePickerResult> importCSV() async {
    FilePickerResult? result;
    try {
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv'],
      );
    } catch (e) {
      Get.snackbar("Error", "Failed to import the file: $e");
    }
    return result!;
  }

  // Delete The Specific Contact List
  void deleteContactList(Contact contact) {
    contactList.remove(contact);
  }

  // Update the Contact List with the New Csv File
  void updateContactList() async {}

  // Create the Contact List From Api
  void createList() async {
    if (nameController.text.isEmpty) {
      Get.snackbar("Error", "Please enter the list name.");
      return;
    }
    await _createListAndContactRepo.createListApi(nameController.text).then(
      (value) async {
        Get.snackbar("Success", value.message ?? "");
        getContactListApi();
      },
    ).onError(
      (error, stackTrace) {
        log("Error: $error");
        Get.snackbar("Error", error.toString());
      },
    );
  }

  // Create the Contact in List Api
  void createContactInList(listname) async {
    await importCSV().then(
      (value) async {
        await _createListAndContactRepo
            .createContactInListApi(listname, value.files.single.bytes!)
            .then(
          (value) {
            Get.snackbar("Success", value.message ?? "");
            getContactListApi();
          },
        ).onError(
          (error, stackTrace) {
            Get.snackbar("Error", error.toString());
          },
        );
      },
    );
  }

  final rxRequestStatus = Status.loading.obs;
  final getListModel = GetListModel().obs;
  // Get the Contact List From Api
  void setRxRequestStatusForGetList(Status value) =>
      rxRequestStatus.value = value;
  void setGetListApiResponse(GetListModel data) {
    getListModel.value = data;
  }

  // Hit The Api
  void getContactListApi() async {
    setRxRequestStatusForGetList(Status.loading);
    await _createListAndContactRepo.getContactsListApi().then(
      (value) {
        setRxRequestStatusForGetList(Status.completed);
        setGetListApiResponse(value);
      },
    ).onError(
      (error, stackTrace) {
        log("Error: $error");
        setRxRequestStatusForGetList(Status.error);
      },
    );
  }

  // Filter List of Contacts
  void filterList(String value) {
    if (value.isEmpty) {
      getContactListApi();
    } else {
      getListModel.value.list = getListModel.value.list!
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
  }

  // Update the Contact List
  void updateContactListApi(contactId, String? firstName, String? lastName,
      String? email, String? phone) async {
    await _createListAndContactRepo
        .updateContactListApi(contactId, firstName, lastName, email, phone)
        .then(
      (value) {
        Get.snackbar("Success", value.message ?? "");
        getContactListApi();
      },
    ).onError(
      (error, stackTrace) {
        Get.snackbar("Error", error.toString());
      },
    );
  }

  // Filter Contacts
  void filterContacts(String value) {
    if (value.isEmpty) {
      getContactListApi();
    } else {
      contactList.value = contactList
          .where((element) =>
              element.firstName!.toLowerCase().contains(value.toLowerCase()) ||
              element.lastName!.toLowerCase().contains(value.toLowerCase()) ||
              element.email!.toLowerCase().contains(value.toLowerCase()) ||
              element.phone!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
  }
}
