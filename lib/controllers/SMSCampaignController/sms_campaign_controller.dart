import 'package:get/get.dart';

class SmsCampaignController extends GetxController {
  var isDropdownOpen = false.obs;
  void toggleDropdown() {
    isDropdownOpen.value = !isDropdownOpen.value;
  }
}
