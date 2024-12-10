import 'package:emend_web_app/Controllers/controller.dart';
import 'package:get/get.dart';

class AllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => CreateEmailController());
    Get.lazyPut(() => SmsCompaignController());
    Get.lazyPut(() => SocialCalenderController());
  }
}
