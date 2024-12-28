import 'package:get/get.dart';

class SocialCalenderController extends GetxController {
  RxBool showAddPostView = false.obs;
  // RxList<String> filePaths = <String>[].obs;

  // Future pickMultipleFiles() async {
  //   try {
  //     FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       allowMultiple: true,
  //       type: FileType.custom,
  //       allowedExtensions: ['mp4', 'mp3', 'png', 'jpg'],
  //     );

  //     if (result != null) {
  //       filePaths.value = result.paths.cast<String>();
  //     } else {
  //       Get.snackbar('No files selected', 'Please select at least one file.');
  //     }
  //   } catch (e) {
  //     Get.snackbar('Error', 'Failed to pick files: $e');
  //     log(e.toString());
  //   }
  // }

  void showAddPostUi(bool visibility) {
    showAddPostView.value = visibility;
  }
}
