import 'package:emend_web_app/controllers/contact_list_controller.dart';
import 'package:emend_web_app/controllers/create_email_controller.dart';
import 'package:emend_web_app/controllers/side_bar_controller.dart';
import 'package:emend_web_app/controllers/sms_campaign_controller.dart';
import 'package:emend_web_app/controllers/social_calender_controller.dart';
import 'package:emend_web_app/controllers/step_controller.dart';
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
