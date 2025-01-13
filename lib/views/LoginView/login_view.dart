// ignore_for_file: deprecated_member_use

import 'package:emend_web_app/config/assets/image_asset.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/controllers/AuthController/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: context.mw * 0.35,
                margin: EdgeInsets.symmetric(vertical: context.mh * 0.04),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(context.mw * 0.01),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Header Section
                    Container(
                      padding: EdgeInsets.all(context.mw * 0.02),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(context.mw * 0.01),
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            ImageAsset.logo,
                            height: context.mh * 0.15,
                          ),
                          SizedBox(height: context.mh * 0.02),
                          Text(
                            "Welcome Back",
                            style: TextStyle(
                              fontSize: context.mh * 0.028,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800],
                            ),
                          ),
                          SizedBox(height: context.mh * 0.01),
                          Text(
                            "Sign in to continue to Emend",
                            style: TextStyle(
                              fontSize: context.mh * 0.016,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Form Section
                    Padding(
                      padding: EdgeInsets.all(context.mw * 0.02),
                      child: Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Email Field
                            _buildTextField(
                              context,
                              controller: authController.emailController,
                              label: 'Email Address',
                              icon: IconlyLight.message,
                            ),
                            SizedBox(height: context.mh * 0.03),

                            // Sign In Button
                            Obx(() =>
                                _buildSignInButton(context, authController)),

                            SizedBox(height: context.mh * 0.03),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Footer
              Text(
                "© ${DateTime.now().year} Emend. All rights reserved.",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: context.mh * 0.014,
                ),
              ),
              SizedBox(height: context.mh * 0.02),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: context.mh * 0.016,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: context.mh * 0.01),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(context.mw * 0.005),
            border: Border.all(
              color: Colors.grey[200]!,
              width: 1,
            ),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: isPassword,
            style: TextStyle(
              fontSize: context.mh * 0.016,
            ),
            decoration: InputDecoration(
              hintText: "Enter your ${label.toLowerCase()}",
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: context.mh * 0.016,
              ),
              prefixIcon: Icon(
                icon,
                size: context.mh * 0.024,
                color: Colors.grey[400],
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: context.mw * 0.01,
                vertical: context.mh * 0.015,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignInButton(
      BuildContext context, AuthController authController) {
    return ElevatedButton(
      onPressed: authController.isLoading.value
          ? null
          : () {
              if (authController.emailController.text.isEmpty) {
                Get.snackbar("Error", "Please enter your email address");
              } else {
                authController.registerUser(
                  authController.emailController.text,
                  context,
                );
              }
              // Get.toNamed(RouteNames.dashboard);
            },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(
          vertical: context.mh * 0.02,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.mw * 0.005),
        ),
        elevation: 0,
      ),
      child: authController.isLoading.value
          ? SizedBox(
              height: context.mh * 0.025,
              width: context.mh * 0.025,
              child: const CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              "Continue With Email",
              style: TextStyle(
                fontSize: context.mh * 0.018,
                fontWeight: FontWeight.w500,
              ),
            ),
    );
  }
}
