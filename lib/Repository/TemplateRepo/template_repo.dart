import 'package:emend_web_app/model/TemplateModel/template_model.dart';

abstract class TemplateRepo {
  Future<TemplateModel> fetchTemplate();
}
