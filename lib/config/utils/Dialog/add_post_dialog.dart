import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/controllers/social_calender_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPostDialog {
  final socialController = Get.put(SocialCalenderController());
  void showAddPostDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            width: context.mw * 0.50,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Choose the platform(s) to create your next post from",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildPlatformIcon(
                      Icons.camera_alt,
                      Colors.pink,
                      "Instagram",
                      () {},
                    ),
                    const SizedBox(width: 12),
                    _buildPlatformIcon(
                      Icons.facebook,
                      Colors.blue,
                      "Facebook",
                      () {},
                    ),
                    const SizedBox(width: 12),
                    _buildPlatformIcon(
                      Icons.cancel,
                      Colors.grey,
                      "Cancel",
                      () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                MaterialButton(
                  minWidth: context.mw * 0.15,
                  onPressed: () {
                    socialController.showAddPostUi(true);
                    Navigator.pop(context);
                  },
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "START CREATING",
                    style: TextStyle(
                      fontSize: context.mh * 0.016,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPlatformIcon(
      IconData icon, Color color, String tooltip, VoidCallback onTap) {
    return Tooltip(
      message: tooltip,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: color,
            size: 32,
          ),
        ),
      ),
    );
  }
}
