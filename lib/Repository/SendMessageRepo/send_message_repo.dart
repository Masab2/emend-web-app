import 'package:emend_web_app/Model/SendMessageModel/send_message_model.dart';

abstract class SendMessageRepo {
  Future<SendMessageModel> singleSendMessageApi(phone, content);
}