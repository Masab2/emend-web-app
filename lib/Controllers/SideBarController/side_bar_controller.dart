import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;
  var selectedTitle = 'Dashboard'.obs;
  var isSidebarVisible = true.obs;

  void setSelectedIndex(int index, String title) {
    selectedIndex.value = index;
    selectedTitle.value = title;
  }

  void toggleSidebarVisibility() {
    isSidebarVisible.value = !isSidebarVisible.value;
  }
}
