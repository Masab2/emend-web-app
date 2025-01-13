import 'dart:developer';

import 'package:emend_web_app/Repository/AuthRepo/auth_repo.dart';
import 'package:emend_web_app/Repository/AuthRepo/auth_repo_http_repo.dart';
import 'package:emend_web_app/config/GlobalVarriable/global.dart';
import 'package:emend_web_app/config/Routes/route_names.dart';
import 'package:emend_web_app/config/keys/box_key.dart';
import 'package:emend_web_app/config/utils/Dialog/alert_dialog_for_error_andSuccess.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepo _authRepo = AuthRepoHttpRepo();
  TextEditingController emailController = TextEditingController();
  RxBool isLoading = false.obs;

  // Register the User and token Stored in the getStorage
  void registerUser(String email, BuildContext context) async {
    if (emailController.text.isEmpty) {
      Get.snackbar("Error", "Please Fill the Fields");
    } else {
      isLoading.value = true; // Start loading
      await _authRepo.registerApi(email).then(
        (value) {
          token.value = value.token ?? '';
          box.value.write(BoxKeys.authToken, value.token);
          log("Register Value Token: ${token.value}");
          emailController.clear();
          Get.offNamed(RouteNames.dashboard);
        },
      ).onError(
        (error, stackTrace) {
          CustomDialogs.showErrorDialog(context, message: error.toString());
        },
      ).whenComplete(() => isLoading.value = false); // Stop loading
    }
  }
}
