import 'package:get/get.dart';

class CreateEmailController extends GetxController {
  RxBool showCreateEmailView = false.obs;
  final processes = ['Setup', 'Content', 'Recipient', 'Send'];
  void showCreateEmailUi(bool visibility) {
    showCreateEmailView.value = visibility;
  }

  // Reactive process index
  var processIndex = 0.obs;

  void incrementIndex() {
    processIndex.value = (processIndex.value + 1) % processes.length;
  }
}

