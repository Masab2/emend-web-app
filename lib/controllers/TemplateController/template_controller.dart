import 'package:emend_web_app/Repository/TemplateRepo/template_http_repo.dart';
import 'package:emend_web_app/Repository/TemplateRepo/template_repo.dart';
import 'package:emend_web_app/data/Response/status.dart';
import 'package:emend_web_app/model/TemplateModel/template_model.dart';
import 'package:get/get.dart';

class TemplateController extends GetxController {
  final rxRequestStatusForAllTemplate = Status.loading.obs;
  final templateModel = TemplateModel().obs;
  final code = ''.obs;

  final TemplateRepo _fetchTemplate = TemplateHttpRepo();

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
}
