import 'package:emend_web_app/config/Color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';

class CreateListDialogBox {
  static void showCreateListDialog(BuildContext context,
      TextEditingController nameController, VoidCallback createList) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: AppColor.viewsBackgroundColor,
          child: Container(
            width: context.mw * 0.35, // Increased width for web
            padding: EdgeInsets.all(context.mh * 0.03),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Create New List",
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
                Text(
                  "List Name",
                  style: TextStyle(
                    fontSize: context.mh * 0.018,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: context.mh * 0.012),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Enter list name",
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
                ),
                SizedBox(height: context.mh * 0.035),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColor.blueColor),
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
                          color: AppColor.blueColor,
                          fontSize: context.mh * 0.018,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: context.mw * 0.01),
                    ElevatedButton(
                      onPressed: createList,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.blueColor,
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
                        "Create List",
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
}
