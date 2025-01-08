import 'package:emend_web_app/Model/SendMessageModel/send_message_model.dart';
import 'package:emend_web_app/Repository/SendMessageRepo/send_message_repo.dart';
import 'package:emend_web_app/config/AppUrl/app_url.dart';
import 'package:emend_web_app/config/GlobalVarriable/global.dart';
import 'package:emend_web_app/data/Network/network_api_service.dart';

class SendMessageHttpRepo implements SendMessageRepo {
  final _api = NetworkApiService();
  @override
  Future<SendMessageModel> singleSendMessageApi(phone, content) async {
    Map<String, dynamic> data = {
      "inboxId": "80020",
      "phone": phone,
      "content": content,
    };
    final response = await _api.getPostApiResponse(AppUrl.sendMessage, data, {
      "Authorization": "Bearer ${token.value}",
      "Accept": "application/json",
      "Content-Type": "application/json",
    });

    return SendMessageModel.fromJson(response);
  }
}
