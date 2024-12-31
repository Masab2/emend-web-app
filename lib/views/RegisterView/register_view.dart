import 'package:emend_web_app/config/assets/image_asset.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/components/components.dart';
import 'package:emend_web_app/config/routes/route_names.dart';
import 'package:emend_web_app/config/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/AuthController/auth_controller.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authController = Get.put(AuthController());
    return Scaffold(
      body: Row(
        children: [
          // Left Section
          Container(
            width: size.width * 0.5,
            color: AppColor.primaryColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageAsset.login,
                    width: size.width * 0.3,
                  ),
                ],
              ),
            ),
          ),

          // Right Section
          Container(
            width: size.width * 0.5,
            color: const Color(0xFFF0928B),
            child: Center(
              child: SizedBox(
                width: size.width * 0.4,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 16,
                      children: [
                        // Title
                        Text(
                          "Welcome to Emend",
                          style: AppTextStyles.heading3.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        // Username Field
                        CommonTextFormField(
                          label: "Name",
                          controller: authController.nameController,
                        ),
                        // Password Field
                        CommonTextFormField(
                          label: "Email",
                          controller: authController.emailController,
                        ),
                        // Register Button
                        ElevatedButton(
                          onPressed: () {
                            authController.registerUser(
                              authController.nameController.text,
                              authController.emailController.text,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: AppColor.primaryColor,
                          ),
                          child: const Text(
                            "REGISTER",
                            style: AppTextStyles.button,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: AppTextStyles.heading4,
                            ),
                            TextButton(
                              onPressed: () {
                                Get.offNamed(RouteNames.login);
                              },
                              child: const Text(
                                "Sign IN",
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
        ],
      ),
    );
  }
}
