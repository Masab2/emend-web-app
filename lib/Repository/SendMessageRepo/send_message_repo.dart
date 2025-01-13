import 'package:emend_web_app/Model/AddSingleContactModel/add_single_contact_model.dart';
import 'package:emend_web_app/Model/SendMessageModel/send_message_model.dart';

abstract class SendMessageRepo {
  Future<SendMessageModel> singleSendMessageApi(phone, content);
  Future<AddSingleContactModel> bulkSendMessageApi(campaignName, listid, inboxId, message , executeAt);

}