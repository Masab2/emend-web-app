import 'dart:typed_data';

import 'package:emend_web_app/Model/AddSingleContactModel/add_single_contact_model.dart';
import 'package:emend_web_app/Model/CreateContactInListModel/create_contact_in_list_model.dart';
import 'package:emend_web_app/Model/CreateListModel/create_list_model.dart';
import 'package:emend_web_app/Model/GetAllContactModel/getAll_contact_model.dart';
import 'package:emend_web_app/Model/GetListModel/get_list_model.dart';
import 'package:emend_web_app/Repository/CreateListAndContactRepo/create_list_and_contact_repo.dart';
import 'package:emend_web_app/config/AppUrl/app_url.dart';
import 'package:emend_web_app/config/GlobalVarriable/global.dart';
import 'package:emend_web_app/data/Network/network_api_service.dart';

class CreateListAndContactHttpRepo implements CreateListAndContactRepo {
  final _api = NetworkApiService();

  @override
  Future<CreateListModel> createListApi(listName) async {
    Map<String, dynamic> data = {
      "name": listName,
      "members": {},
    };
    final response = await _api.getPostApiResponse(AppUrl.createList, data, {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token.value}",
      "Accept": "application/json",
    });
    return CreateListModel.fromJson(response);
  }

  @override
  Future<CreateContactInListModel> createContactInListApi(
      listName, Uint8List csv) async {
    Map<String, dynamic> data = {
      "listName": listName,
      "file": csv,
    };

    final response = await _api.getPostApiResponse(AppUrl.createContact, data, {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token.value}",
      "Accept": "application/json",
    });

    return CreateContactInListModel.fromJson(response);
  }

  @override
  Future<GetListModel> getContactsListApi() async {
    final response = await _api.getGetApiResponse(AppUrl.getList, {
      "Authorization": "Bearer ${token.value}",
    });
    return GetListModel.fromJson(response);
  }

  @override
  Future<CreateContactInListModel> updateContactListApi(contactId,
      String? firstName, String? lastName, String? email, String? phone) async {
    Map<String, dynamic> data = {
      "contactId": contactId,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phone": phone,
    };
    final response = await _api.getPostApiResponse(AppUrl.updateContact, data, {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token.value}",
      "Accept": "application/json",
    });
    return CreateContactInListModel.fromJson(response);
  }

  @override
  Future<GetAllContacts> getAllContactsApi() async {
    final response = await _api.getGetApiResponse(AppUrl.getAllContactsUrl, {
      "Authorization": "Bearer ${token.value}",
    });

    return GetAllContacts.fromJson(response);
  }

  @override
  Future<AddSingleContactModel> addSingleContactApi(
    firstName,
    lastName,
    email,
    phone,
    listName,
  ) async {
    Map<String, dynamic> data = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "phone": phone,
      "listName": listName,
    };
    final response =
        await _api.getPostApiResponse(AppUrl.addSingleContact, data, {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token.value}",
      "Accept": "application/json",
    });
    return AddSingleContactModel.fromJson(response);
  }

  @override
  Future<AddSingleContactModel> deleteListandContacts(listName) async {
    Map<String, dynamic> data = {
      "listName": listName,
    };
    final response =
        await _api.getDeleteApiResponse(AppUrl.deleteListUrl, data, {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token.value}",
      "Accept": "application/json",
    });

    return AddSingleContactModel.fromJson(response);
  }

  @override
  Future<AddSingleContactModel> updateListNameApi(
      listName, updatedListname) async {
    Map<String, dynamic> data = {
      "currentListName": listName,
      "newListName": updatedListname,
    };
    final response =
        await _api.getPutApiResponse(AppUrl.updateListNameUrl, data, {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token.value}",
      "Accept": "application/json",
    });
    return AddSingleContactModel.fromJson(response);
  }
}
