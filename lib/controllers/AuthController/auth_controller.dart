import 'dart:developer';

import 'package:emend_web_app/Repository/AuthRepo/auth_repo.dart';
import 'package:emend_web_app/Repository/AuthRepo/auth_repo_http_repo.dart';
import 'package:emend_web_app/config/Routes/route_names.dart';
import 'package:emend_web_app/config/keys/box_key.dart';
import 'package:emend_web_app/data/local/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepo _authRepo = AuthRepoHttpRepo();
  final authToken = ''.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  onInit() {
    super.onInit();
    authToken.value = StorageService.box.read(BoxKeys.authToken) ?? '';
    log(authToken.value);
  }

  // Register the User and token Stored in the getStorage
  void registerUser(String name, String email) async {
    if (nameController.text.isEmpty && emailController.text.isEmpty) {
      Get.snackbar("Error", "Please Fill the Fields");
    } else {
      await _authRepo.registerApi(name, email).then(
        (value) {
          authToken.value = value.token ?? '';
          StorageService.box.write(BoxKeys.authToken, value.token);
          log(authToken.value);
          nameController.clear();
          emailController.clear();
          Get.offNamed(RouteNames.dashboard);
        },
      ).onError(
        (error, stackTrace) {
          Get.snackbar("Error", error.toString());
        },
      );
    }
  }

  // Login the User and Get token Stored in the getStorage
  void loginUser(String email) async {
    authToken.value = StorageService.box.read(BoxKeys.authToken) ?? '';
    log(authToken.value);
    await _authRepo.loginApi(authToken.value, email).then(
      (value) {
        Get.snackbar("Success", "User Logged In Successfully");
        nameController.clear();
        emailController.clear();
        authToken.value = value.token ?? '';
        StorageService.box.write(BoxKeys.authToken, value.token);
        Get.offNamed(RouteNames.dashboard);
      },
    ).onError(
      (error, stackTrace) {
        Get.snackbar("Error", error.toString());
      },
    );
  }
}
