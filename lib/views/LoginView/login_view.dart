import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/components/components.dart';
import 'package:emend_web_app/config/styles/app_styles.dart'; // Import text styles
import 'package:emend_web_app/config/widgets/widgets.dart';
import 'package:emend_web_app/views/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  static const route = '/';
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                      // Welcome Back Text
                      Text(
                        "Welcome Back",
                        style: AppTextStyles.heading3.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      // Username Field
                      const CommonTextFormField(
                        label: "Email",
                      ),
                      // Password Field
                      const CommonTextFormField(
                        label: "Password",
                        obscureText: true,
                      ),
                      // Sign In Button
                      ElevatedButton(
                        onPressed: () {
                          Get.offAllNamed(DashboardView.route);
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
                          "SIGN IN",
                          style: AppTextStyles.button,
                        ),
                      ),
                      // Create Account Text
                      TextButton(
                        onPressed: () {
                          Get.offNamed(RegisterView.route);
                        },
                        child: const Text(
                          "Don't have an account yet? Create an account",
                          style: AppTextStyles.heading4,
                        ),
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
