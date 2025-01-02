import 'package:emend_web_app/config/GlobalVarriable/global.dart';
import 'package:emend_web_app/config/keys/box_key.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;
  var isSidebarVisible = true.obs;

  @override
  void onInit() {
    super.onInit();
    selectedIndex.value = box.value.read<int>(BoxKeys.selectedIndex) ?? 0;
    isSidebarVisible.value =
        box.value.read<bool>(BoxKeys.isSidebarVisible) ?? true;
  }

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
    box.value.write(BoxKeys.selectedIndex, index);
  }

  void toggleSidebarVisibility() {
    isSidebarVisible.value = !isSidebarVisible.value;
    // Save to storage
    box.value.write(BoxKeys.isSidebarVisible, isSidebarVisible.value);
  }
}
