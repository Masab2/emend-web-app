import 'package:emend_web_app/config/Color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';

class EditContactDialog {
  void showEditContactDialog(
    BuildContext context,
    TextEditingController editFirstNameController,
    TextEditingController editLastNameController,
    TextEditingController editEmailController,
    TextEditingController editPhoneController,
    VoidCallback onSave,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: AppColor.viewsBackgroundColor,
          child: Container(
            width: context.mw * 0.40,
            padding: EdgeInsets.all(context.mh * 0.03),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Edit Contact",
                      style: TextStyle(
                        fontSize: context.mh * 0.028,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.close,
                        size: context.mh * 0.025,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.mh * 0.025),

                // Form Fields
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel(context, "First Name"),
                          SizedBox(height: context.mh * 0.008),
                          _buildTextField(
                            context,
                            editFirstNameController,
                            "Enter first name",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: context.mw * 0.01),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLabel(context, "Last Name"),
                          SizedBox(height: context.mh * 0.008),
                          _buildTextField(
                            context,
                            editLastNameController,
                            "Enter last name",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: context.mh * 0.02),

                _buildLabel(context, "Email"),
                SizedBox(height: context.mh * 0.008),
                _buildTextField(
                  context,
                  editEmailController,
                  "Enter email address",
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: context.mh * 0.02),

                _buildLabel(context, "Phone Number"),
                SizedBox(height: context.mh * 0.008),
                _buildTextField(
                  context,
                  editPhoneController,
                  "Enter phone number",
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: context.mh * 0.035),

                // Action Buttons
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
                      onPressed: onSave,
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
                        "Save Changes",
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

  Widget _buildLabel(BuildContext context, String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: context.mh * 0.018,
        fontWeight: FontWeight.w500,
        color: Colors.grey[700],
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context,
    TextEditingController? controller,
    String hint, {
    TextInputType? keyboardType,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: context.mh * 0.018,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColor.blueColor,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: AppColor.whiteColor,
        contentPadding: EdgeInsets.symmetric(
          horizontal: context.mw * 0.015,
          vertical: context.mh * 0.018,
        ),
      ),
    );
  }
}
