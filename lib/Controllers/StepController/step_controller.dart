import 'package:emend_web_app/Model/StepModel/step_model.dart';
import 'package:emend_web_app/config/widgets/smsCompaginWidgets/createSmsCompaignWidget/schedule_message_widget.dart';
import 'package:get/get.dart';

class StepController extends GetxController {
  // List of steps, initialized with one step
  var steps = <StepData>[].obs;

  @override
  void onInit() {
    steps.add(StepData(
      title: "Message 1",
      isActive: true,
      widget: const ScheduleMessageUI(),
    ));
    super.onInit();
  }

  // Method to add a new step
  void addStep() {
    steps.add(StepData(
      title: "Message ${steps.length + 1}",
      isActive: true,
      widget: const ScheduleMessageUI(),
    ));
  }

  void removeStep(int index) {
    steps.removeAt(index);
  }

   // Observable for visibility
  var isWrapVisible = false.obs;

  // Method to toggle visibility
  void toggleWrapVisibility() {
    isWrapVisible.value = !isWrapVisible.value;
  }


}
