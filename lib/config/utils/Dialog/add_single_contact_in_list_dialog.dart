import 'package:emend_web_app/config/Color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';

class AddSingleContactInListDialog {
  static void showAddContactDialog(BuildContext context,
      {required TextEditingController firstNameController,
      required TextEditingController lastNameController,
      required TextEditingController emailController,
      required TextEditingController phoneController,
      required VoidCallback onAdd}) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: AppColor.viewsBackgroundColor,
          child: Container(
            width: context.mw * 0.35,
            padding: EdgeInsets.all(context.mh * 0.03),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add New Contact",
                      style: TextStyle(
                        fontSize: context.mh * 0.028,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(Icons.close,
                          size: context.mh * 0.025, color: Colors.grey[600]),
                    ),
                  ],
                ),
                SizedBox(height: context.mh * 0.025),
                _buildField(context, "First Name", firstNameController),
                SizedBox(height: context.mh * 0.02),
                _buildField(context, "Last Name", lastNameController),
                SizedBox(height: context.mh * 0.02),
                _buildField(context, "Email", emailController),
                SizedBox(height: context.mh * 0.02),
                _buildField(context, "Phone", phoneController),
                SizedBox(height: context.mh * 0.035),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColor.primaryColor),
                        padding: EdgeInsets.symmetric(
                          horizontal: context.mw * 0.02,
                          vertical: context.mh * 0.018,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          color: AppColor.primaryColor,
                          fontSize: context.mh * 0.018,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: context.mw * 0.01),
                    ElevatedButton(
                      onPressed: onAdd,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: context.mw * 0.02,
                          vertical: context.mh * 0.018,
                        ),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Add Contact",
                        style: TextStyle(
                          color: AppColor.whiteColor,
                          fontSize: context.mh * 0.018,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _buildField(
      BuildContext context, String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: context.mh * 0.018,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: context.mh * 0.012),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: "Enter $label",
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: context.mh * 0.018,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: AppColor.primaryColor, width: 2),
            ),
            filled: true,
            fillColor: AppColor.whiteColor,
            contentPadding: EdgeInsets.symmetric(
              horizontal: context.mw * 0.015,
              vertical: context.mh * 0.018,
            ),
          ),
        ),
      ],
    );
  }
}
