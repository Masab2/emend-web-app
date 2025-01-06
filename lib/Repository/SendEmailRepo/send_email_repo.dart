import 'package:emend_web_app/Model/SendEmailModel/send_email_model.dart';

abstract class SendEmailRepo {
  Future<SendEmailModel> sendEmailApi(email, fromEmail, subject, contentType, content);
}
