import 'package:emend_web_app/Model/GenerateSmsModel/generate_sms_model.dart';

abstract class GenerateSmsRepo {
  Future<GenerateSmsModel> generateSmsApi(tone, occassion , additionalNotes);
}