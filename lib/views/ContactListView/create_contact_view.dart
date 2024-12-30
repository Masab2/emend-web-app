import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/controllers/ContactListController/contact_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateContactView extends StatelessWidget {
  const CreateContactView({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactListController controller = Get.put(ContactListController());

    return Container(
      color: AppColor.viewsBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: context.mw * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          0.01.ph(context),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  controller.showCreateContactUi(false);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: context.mh * 0.020,
                ),
              ),
              Text(
                "Create List",
                style: TextStyle(
                  fontSize: context.mh * 0.028,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          0.03.ph(context),
          // Name Field
          Text(
            "Name",
            style: TextStyle(
              fontSize: context.mh * 0.020,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: context.mh * 0.01),
          TextField(
            controller: controller.nameController,
            decoration: InputDecoration(
              hintText: "Your List Name",
              hintStyle: TextStyle(
                fontSize: context.mh * 0.018,
                color: Colors.grey[600],
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColor.primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          0.03.ph(context),
          // Description Field
          Text(
            "Description",
            style: TextStyle(
              fontSize: context.mh * 0.020,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: context.mh * 0.01),
          TextField(
            controller: controller.descriptionController,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: "Your list description",
              hintStyle: TextStyle(
                fontSize: context.mh * 0.018,
                color: Colors.grey[600],
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColor.primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          0.01.ph(context),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MaterialButton(
                minWidth: context.mw * 0.15,
                height: context.mh * 0.06,
                color: AppColor.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () async {
                  controller.createList();
                },
                child: Text(
                  "Create",
                  style: TextStyle(
                    fontSize: context.mh * 0.020,
                    color: AppColor.whiteColor,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
