import 'package:get/get.dart';

class CreateEmailController extends GetxController {
  RxBool showCreateEmailView = false.obs;
  void showCreateEmailUi(bool visibility) {
    showCreateEmailView.value = visibility;
  }

  var currentStep = 0.obs;

  void nextStep() {
    if (currentStep.value < 2) currentStep.value++;
  }

  void previousStep() {
    if (currentStep.value > 0) currentStep.value--;
  }

  var selectedContacts = <String>[].obs;
  var isSearchFocused = false.obs;
  var contactLists = [
    {'name': 'Test List', 'contacts': 4},
    {'name': 'test', 'contacts': 0},
    {'name': 'List created on 2024-12-24 00:01:20', 'contacts': 1},
    {'name': 'Emend Health Care 1', 'contacts': 139},
    {'name': 'Emend Health Care 2', 'contacts': 133},
  ].obs;

  var filteredContactLists = [].obs;

  @override
  void onInit() {
    super.onInit();
    filteredContactLists.value = contactLists;
  }

  void filterContacts(String query) {
    if (query.isEmpty) {
      filteredContactLists.value = contactLists;
    } else {
      filteredContactLists.value = contactLists
          .where((list) => list['name']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    }
  }

  var selectedCampaigns = <Map<String, dynamic>>[].obs;
  var isDropdownOpen = false.obs;

  void toggleDropdown() {
    isDropdownOpen.value = !isDropdownOpen.value;
  }

  void addToCampaign(Map<String, dynamic> campaign) {
    if (!selectedCampaigns.contains(campaign)) {
      selectedCampaigns.add(campaign);
    }
  }

  void removeFromCampaign(Map<String, dynamic> campaign) {
    selectedCampaigns.remove(campaign);
  }
}
