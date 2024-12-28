import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/components/components.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/controllers/SocialCalenderController/social_calender_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPostView extends StatefulWidget {
  const AddPostView({super.key});

  @override
  State<AddPostView> createState() => _AddPostViewState();
}

class _AddPostViewState extends State<AddPostView> {
  final socialController = Get.put(SocialCalenderController());
  final TextEditingController postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.viewsBackgroundColor,
      height: context.mh,
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  socialController.showAddPostUi(false);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: context.mh * 0.020,
                ),
              ),
              Text(
                "Social Calendar",
                style: TextStyle(
                  fontSize: context.mh * 0.028,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          0.01.ph(context),
          HorizontalCalendar(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 30)),
            lastDate: DateTime.now().add(const Duration(days: 30)),
            onDateChanged: (selectedDate) {
              log('Selected Date: $selectedDate');
            },
          ),
          0.01.ph(context),
          Container(
            height: context.mh * 0.55,
            margin: EdgeInsets.symmetric(
                horizontal: context.mw * 0.02, vertical: context.mh * 0.01),
            padding: EdgeInsets.symmetric(
                horizontal: context.mw * 0.02, vertical: context.mh * 0.01),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Post",
                      style: TextStyle(
                        fontSize: context.mh * 0.018,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    0.01.pw(context),
                    Text(
                      "Stories",
                      style: TextStyle(
                        fontSize: context.mh * 0.018,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    0.01.pw(context),
                    Text(
                      "Reels",
                      style: TextStyle(
                        fontSize: context.mh * 0.018,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                0.01.ph(context),
                Row(
                  children: [
                    DottedBorder(
                      child: SizedBox(
                        height: context.mh * 0.32,
                        width: context.mw * 0.15,
                        child: const Center(
                          child: Icon(Icons.file_upload),
                        ),
                      ),
                    ),
                    0.01.pw(context),
                    Expanded(
                      child: CustomTextFormField(
                        controller: postController,
                        hintText: "Write your post here...",
                        maxLines: 8,
                      ),
                    ),
                  ],
                ),
                0.01.ph(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MaterialButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      onPressed: () {},
                      child: Text(
                        "Create Post",
                        style: TextStyle(
                          fontSize: context.mh * 0.018,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
