import 'package:emend_web_app/controllers/controllers.dart';
import 'package:get/get.dart';

class AllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController());
    Get.lazyPut(() => CreateEmailController());
    Get.lazyPut(() => SmsCampaignController());
    Get.lazyPut(() => SocialCalenderController());
    Get.lazyPut(() => StepController());
    Get.lazyPut(() => ContactListController());
  }
}
