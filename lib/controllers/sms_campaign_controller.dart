import 'package:get/get.dart';

class SmsCampaignController extends GetxController {
  RxBool showSMSCampaignView = false.obs;
  final processes = ['Setup', 'Content', 'Message', 'Send'];
  void showCreateEmailUi(bool visibility) {
    showSMSCampaignView.value = visibility;
  }

  // Reactive process index
  var processIndex = 0.obs;

  void incrementIndex() {
    processIndex.value = (processIndex.value + 1) % processes.length;
  }

  // Decrement Process
  void decrementIndex() {
    processIndex.value =
        (processIndex.value - 1 + processes.length) % processes.length;
  }
}
