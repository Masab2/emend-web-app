import 'package:emend_web_app/config/AppUrl/app_url.dart';
import 'package:emend_web_app/config/GlobalVarriable/global.dart';
import 'package:emend_web_app/data/Network/network_api_service.dart';
import 'package:emend_web_app/model/TemplateModel/template_model.dart';

import 'template_repo.dart';

class TemplateHttpRepo implements TemplateRepo {
  final _api = NetworkApiService();

  @override
  Future<TemplateModel> fetchTemplate() async {
    final response = await _api.getGetApiResponse(
      AppUrl.getAllTemplates,
      {
        "Authorization": "Bearer ${token.value}",
      },
    );
    return TemplateModel.fromJson(response);
  }
}
