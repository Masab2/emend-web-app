import 'package:emend_web_app/Model/GenerateEmailModel/genrate_email_model.dart';

abstract class GenerateEmailRepo {
  Future<GenerateEmailModel> generateEmailApi(  tone, subjectLine, callOfAction);
}