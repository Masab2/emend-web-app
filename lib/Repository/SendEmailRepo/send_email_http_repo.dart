import 'package:emend_web_app/Model/SendEmailModel/send_email_model.dart';
import 'package:emend_web_app/Repository/SendEmailRepo/send_email_repo.dart';
import 'package:emend_web_app/config/AppUrl/app_url.dart';
import 'package:emend_web_app/data/Network/network_api_service.dart';

class SendEmailHttpRepo implements SendEmailRepo {
  final _api = NetworkApiService();
  @override
  Future<SendEmailModel> sendEmailApi(
    List<Map<String, String>> selectedEmails,
    fromEmail,
    subject,
    contentType,
    content,
  ) async {
    List<Map<String, String>> recipients = selectedEmails
        .map((emailMap) => {"Email": emailMap["Email"]!})
        .toList();

    Map<String, dynamic> data = {
      "Recipients": recipients,
      "Content": {
        "From": fromEmail,
        "Subject": subject,
        "Body": [
          {
            "ContentType": contentType,
            "Content": content,
          },
        ],
        "Charset": "utf-8",
      },
    };
    final response = await _api.getPostApiResponse(
      AppUrl.sendEmail,
      data,
      {
        "Authorization": "Bearer ${AppUrl.token}",
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
    );
    return SendEmailModel.fromJson(response);
  }
}
