import 'dart:developer';

import 'package:emend_web_app/config/GlobalVarriable/global.dart';
import 'package:emend_web_app/config/Routes/route_names.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/components/components.dart';
import 'package:emend_web_app/config/styles/app_styles.dart';
import 'package:emend_web_app/config/widgets/widgets.dart';
import 'package:emend_web_app/controllers/AuthController/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authController = Get.put(AuthController());
    return Scaffold(
      body: AuthCommonWidget(
        formWidget: Center(
          child: SizedBox(
            width: size.width * 0.4,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 16,
                    children: [
                      Text(
                        "Welcome to Emend",
                        style: AppTextStyles.heading3.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      CommonTextFormField(
                        label: "Email",
                        controller: authController.emailController,
                      ),
                      Obx(
                        () {
                          return authController.isLoading.value == true
                              ? const CircularProgressIndicator()
                              : ElevatedButton(
                                  onPressed: () {
                                    if (authController
                                        .emailController.text.isEmpty) {
                                      Get.snackbar(
                                          "Error", "Please Fill the Fields");
                                    } else {
                                      log(token.value);
                                      authController.loginUser(
                                          authController.emailController.text,
                                          context);
                                    }
                                    // Get.toNamed(RouteNames.dashboard);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize:
                                        const Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    foregroundColor: Colors.white,
                                    backgroundColor: AppColor.primaryColor,
                                  ),
                                  child: const Text(
                                    "SIGN IN",
                                    style: AppTextStyles.button,
                                  ),
                                );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: AppTextStyles.heading4,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(RouteNames.register);
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
