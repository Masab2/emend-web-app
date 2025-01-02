import 'dart:developer';

import 'package:emend_web_app/Repository/AuthRepo/auth_repo.dart';
import 'package:emend_web_app/Repository/AuthRepo/auth_repo_http_repo.dart';
import 'package:emend_web_app/config/GlobalVarriable/global.dart';
import 'package:emend_web_app/config/Routes/route_names.dart';
import 'package:emend_web_app/config/keys/box_key.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepo _authRepo = AuthRepoHttpRepo();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  // Register the User and token Stored in the getStorage
  void registerUser(String name, String email) async {
    if (nameController.text.isEmpty && emailController.text.isEmpty) {
      Get.snackbar("Error", "Please Fill the Fields");
    } else {
      await _authRepo.registerApi(name, email).then(
        (value) {
          token.value = value.token ?? '';
          box.value.write(BoxKeys.authToken, value.token);
          log("Regitser Value Token: ${token.value}");
          // var tempToken = StorageService.box.read(BoxKeys.authToken) ?? '';
          // log(tempToken);
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
    await _authRepo.loginApi(token.value, email).then(
      (value) {
        Get.snackbar("Success", "User Logged In Successfully");
        nameController.clear();
        emailController.clear();
        token.value = value.token ?? '';
        log("When Login Pressed: $token");
        box.value.write(BoxKeys.authToken, value.token);
        Get.offNamed(RouteNames.dashboard);
      },
    ).onError(
      (error, stackTrace) {
        Get.snackbar("Error", error.toString());
      },
    );
  }
}
