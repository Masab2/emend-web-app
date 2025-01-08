import 'package:emend_web_app/config/assets/image_asset.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/routes/route_names.dart';
import 'package:emend_web_app/controllers/AuthController/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
                            "Create Account",
                            style: TextStyle(
                              fontSize: context.mh * 0.028,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800],
                            ),
                          ),
                          SizedBox(height: context.mh * 0.01),
                          Text(
                            "Sign up to get started with Emend",
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
                            _buildTextField(
                              context,
                              controller: authController.nameController,
                              label: 'Full Name',
                              icon: IconlyLight.profile,
                            ),
                            SizedBox(height: context.mh * 0.02),
                            _buildTextField(
                              context,
                              controller: authController.emailController,
                              label: 'Email Address',
                              icon: IconlyLight.message,
                            ),
                            SizedBox(height: context.mh * 0.03),

                            // Register Button
                            Obx(() => ElevatedButton(
                                  onPressed: authController.isLoading.value
                                      ? null
                                      : () {
                                          if (authController.nameController.text
                                                  .isEmpty ||
                                              authController.emailController
                                                  .text.isEmpty) {
                                            Get.snackbar(
                                              "Error",
                                              "Please fill in all fields",
                                            );
                                          } else {
                                            authController.registerUser(
                                              authController
                                                  .nameController.text,
                                              authController
                                                  .emailController.text,
                                              context,
                                            );
                                          }
                                        },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.primaryColor,
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                      vertical: context.mh * 0.02,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          context.mw * 0.005),
                                    ),
                                    elevation: 0,
                                  ),
                                  child: authController.isLoading.value
                                      ? SizedBox(
                                          height: context.mh * 0.025,
                                          width: context.mh * 0.025,
                                          child:
                                              const CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                              Colors.white,
                                            ),
                                          ),
                                        )
                                      : Text(
                                          "Create Account",
                                          style: TextStyle(
                                            fontSize: context.mh * 0.018,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                )),
                            SizedBox(height: context.mh * 0.03),

                            // Sign In Link
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontSize: context.mh * 0.016,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Get.offNamed(RouteNames.login),
                                  style: TextButton.styleFrom(
                                    foregroundColor: AppColor.primaryColor,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: context.mw * 0.01,
                                      vertical: context.mh * 0.01,
                                    ),
                                  ),
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: context.mh * 0.016,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
}
