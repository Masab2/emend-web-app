import 'dart:typed_data';
import 'package:emend_web_app/Model/CreateContactInListModel/create_contact_in_list_model.dart';
import 'package:emend_web_app/Model/CreateListModel/create_list_model.dart';
import 'package:emend_web_app/Model/GetListModel/get_list_model.dart';
import 'package:emend_web_app/Repository/CreateListAndContactRepo/create_list_and_contact_repo.dart';
import 'package:emend_web_app/config/AppUrl/app_url.dart';
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
      "Authorization": "Bearer ${AppUrl.token}",
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
      "Authorization": "Bearer ${AppUrl.token}",
      "Accept": "application/json",
    });

    return CreateContactInListModel.fromJson(response);
  }

  @override
  Future<GetListModel> getContactsListApi() async {
    final response = await _api.getGetApiResponse(AppUrl.getList, {
      "Authorization": "Bearer ${AppUrl.token}",
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
      "Authorization": "Bearer ${AppUrl.token}",
      "Accept": "application/json",
    });
    return CreateContactInListModel.fromJson(response);
  }
}
