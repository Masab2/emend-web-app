import 'package:get/get.dart';

class SmsCompaignController extends GetxController {
  RxBool showsmsCompaignView = false.obs;
  final processes = ['Setup', 'Content', 'Message', 'Send'];
  void showCreateEmailUi(bool visibility) {
    showsmsCompaignView.value = visibility;
  }

  // Reactive process index
  var processIndex = 0.obs;

  void incrementIndex() {
    processIndex.value = (processIndex.value + 1) % processes.length;
  }

  // Decremnet Process
  void decrementIndex() {
    processIndex.value =
        (processIndex.value - 1 + processes.length) % processes.length;
  }
}
