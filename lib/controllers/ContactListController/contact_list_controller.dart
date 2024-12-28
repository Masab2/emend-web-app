import 'package:emend_web_app/model/ContactListModel/contact_list_model.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ContactListController extends GetxController {
  RxBool showCreateContactView = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  var contactsLists = <ContactListModel>[].obs;

  void showCreateContactUi(bool visibility) {
    showCreateContactView.value = visibility;
  }

  var contactList = <Contact>[].obs;

  RxBool showContactListInList = false.obs;
  void showContactListUi(bool visibility, List<Contact> contact) {
    showContactListInList.value = visibility;
    contactList.value = contact;
  }

  Future<void> importCSV() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv'],
      );

      if (result != null && result.files.single.bytes != null) {
        Uint8List fileBytes = result.files.single.bytes!;
        List<Contact> contacts = _parseContactsFromCSV(fileBytes);

        if (contacts.isNotEmpty) {
          ContactListModel contactList = ContactListModel(
            name: nameController.text,
            description: descriptionController.text,
            contacts: contacts,
          );
          contactsLists.add(contactList);

          Get.snackbar("Success", "Imported ${contacts.length} contacts!");
          nameController.clear();
          descriptionController.clear();
        } else {
          Get.snackbar("Error", "No valid contacts found in the file.");
        }
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to import the file: $e");
    }
  }

  List<Contact> _parseContactsFromCSV(Uint8List fileBytes) {
    try {
      String content = String.fromCharCodes(fileBytes);
      List<String> lines = content.split('\n');

      if (lines.isEmpty || lines.length < 2) {
        return [];
      }

      List<Contact> contacts = lines
          .skip(1)
          .where((line) => line.trim().isNotEmpty)
          .map((line) {
            List<String> fields = line.split(',');

            if (fields.length >= 4) {
              return Contact(
                firstName: fields[0].trim(),
                lastName: fields[1].trim(),
                mobileNo: fields[2].trim(),
                email: fields[3].trim(),
              );
            }
            return null;
          })
          .whereType<Contact>()
          .toList();

      return contacts;
    } catch (e) {
      return [];
    }
  }

  // Delete The Specific Contact List
  void deleteContactList(Contact contact) {
    contactList.remove(contact);
  }

  // Update the Contact List with the New Csv File
  void updateContactList(ContactListModel contactList) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv'],
      );

      if (result != null && result.files.single.bytes != null) {
        Uint8List fileBytes = result.files.single.bytes!;
        List<Contact> contacts = _parseContactsFromCSV(fileBytes);

        if (contacts.isNotEmpty) {
          contactList.contacts = contacts;
          Get.snackbar("Success", "Updated ${contacts.length} contacts!");
        } else {
          Get.snackbar("Error", "No valid contacts found in the file.");
        }
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to import the file: $e");
    }
  }
}
