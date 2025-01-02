import 'dart:typed_data';

import 'package:emend_web_app/Model/CreateContactInListModel/create_contact_in_list_model.dart';
import 'package:emend_web_app/Model/CreateListModel/create_list_model.dart';
import 'package:emend_web_app/Model/GetListModel/get_list_model.dart';

abstract class CreateListAndContactRepo {
  Future<CreateListModel> createListApi(listName);
  Future<CreateContactInListModel> createContactInListApi(
      listName, Uint8List csv);
  // Fetch List of Contacts
  Future<GetListModel> getContactsListApi();

  // Update the Contact List
  Future<CreateContactInListModel> updateContactListApi(
    contactId,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
  );
}
