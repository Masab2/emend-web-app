import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;
  var selectedTitle = 'Dashboard'.obs;
  var isSidebarVisible = true.obs;

  void setSelectedIndex(
    int index,
  ) {
    selectedIndex.value = index;
  }

  void toggleSidebarVisibility() {
    isSidebarVisible.value = !isSidebarVisible.value;
  }
}
