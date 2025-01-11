import 'package:emend_web_app/Repository/TemplateRepo/template_http_repo.dart';
import 'package:emend_web_app/Repository/TemplateRepo/template_repo.dart';
import 'package:emend_web_app/data/Response/status.dart';
import 'package:emend_web_app/model/TemplateModel/template_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TemplateController extends GetxController {
  final rxRequestStatusForAllTemplate = Status.loading.obs;
  var templateModel = TemplateModel().obs;
  final TemplateRepo _fetchTemplate = TemplateHttpRepo();
  // final baseUrl = 'https://react-email-editor-ce42a.web.app';

  final searchController = TextEditingController().obs;

  // Get the Contact List From Api
  void setRxRequestStatusForGetTemplate(Status value) =>
      rxRequestStatusForAllTemplate.value = value;
  void setGetContactsApiResponse(TemplateModel data) {
    templateModel.value = data;
  }

  @override
  void onInit() {
    getAllTemplateApi();
    super.onInit();
  }

  // Get All Template
  void getAllTemplateApi() async {
    setRxRequestStatusForGetTemplate(Status.loading);
    await _fetchTemplate.fetchTemplate().then(
      (value) {
        setRxRequestStatusForGetTemplate(Status.completed);
        setGetContactsApiResponse(value);
      },
    ).onError(
      (error, stackTrace) {
        setRxRequestStatusForGetTemplate(Status.error);
      },
    );
  }

  // Filter Templates
  void filterTemplates(String value) {
    if (value.isEmpty) {
      getAllTemplateApi();
    } else {
      templateModel.value.templates = templateModel.value.templates!
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
  }
}
