import 'package:emend_web_app/config/keys/box_key.dart';
import 'package:emend_web_app/data/local/storage_service.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final box = StorageService.box;
  var selectedIndex = 0.obs;
  var isSidebarVisible = true.obs;

  @override
  void onInit() {
    super.onInit();
    selectedIndex.value = box.read<int>(BoxKeys.selectedIndex) ?? 0;
    isSidebarVisible.value = box.read<bool>(BoxKeys.isSidebarVisible) ?? true;
  }

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
    box.write(BoxKeys.selectedIndex, index);
  }

  void toggleSidebarVisibility() {
    isSidebarVisible.value = !isSidebarVisible.value;
    // Save to storage
    box.write(BoxKeys.isSidebarVisible, isSidebarVisible.value);
  }
}
