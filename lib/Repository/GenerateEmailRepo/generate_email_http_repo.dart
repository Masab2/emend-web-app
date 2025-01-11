import 'package:emend_web_app/Model/GenerateEmailModel/genrate_email_model.dart';
import 'package:emend_web_app/Repository/GenerateEmailRepo/generate_email_repo.dart';
import 'package:emend_web_app/config/AppUrl/app_url.dart';
import 'package:emend_web_app/config/GlobalVarriable/global.dart';
import 'package:emend_web_app/data/Network/network_api_service.dart';

class GenerateEmailHttpRepo implements GenerateEmailRepo {
  final _api = NetworkApiService();

  @override
  Future<GenerateEmailModel> generateEmailApi(
    tone,
    subjectLine,
    callOfAction,
  ) async {
    Map<String, dynamic> data = {
      "subjectLine": subjectLine,
      "tone": tone,
      "callToAction": callOfAction,
    };
    final response = await _api.getPostApiResponse(AppUrl.generateEmail, data, {
      "Authorization": "Bearer ${token.value}",
      "Accept": "application/json",
      "Content-Type": "application/json",
    });
    return GenerateEmailModel.fromJson(response);
  }
}
