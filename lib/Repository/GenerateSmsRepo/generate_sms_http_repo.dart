import 'package:emend_web_app/Model/GenerateSmsModel/generate_sms_model.dart';
import 'package:emend_web_app/Repository/GenerateSmsRepo/generate_sms_repo.dart';
import 'package:emend_web_app/config/AppUrl/app_url.dart';
import 'package:emend_web_app/config/GlobalVarriable/global.dart';
import 'package:emend_web_app/data/Network/network_api_service.dart';

class GenerateSmsHttpRepo implements GenerateSmsRepo {
  final _api = NetworkApiService();
  @override
  Future<GenerateSmsModel> generateSmsApi(
      tone, occassion, additionalNotes) async {
    Map<String, dynamic> data = {
      "tone": tone,
      "occasion": occassion,
      "additional_notes": additionalNotes,
    };
    final response =
        await _api.getPostApiResponse(AppUrl.generateSmsMessage, data, {
      "Authorization": "Bearer ${AppUrl.token}",
      "Accept": "application/json",
      "Content-Type": "application/json",
    });
    return GenerateSmsModel.fromJson(response);
  }
}
