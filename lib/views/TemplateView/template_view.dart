import 'dart:developer';

import 'package:emend_web_app/config/AppUrl/app_url.dart';
import 'package:emend_web_app/config/GlobalVarriable/global.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/routes/route_names.dart';
import 'package:emend_web_app/config/widgets/widgets.dart';
import 'package:emend_web_app/controllers/TemplateController/template_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class TemplateView extends StatelessWidget {
  TemplateView({super.key});
  final TemplateController controller = Get.put(TemplateController());

  @override
  Widget build(BuildContext context) {
    log("${RouteNames.templateEditor}${templateCode.value}/?token=${AppUrl.token}");
    return Scaffold(
      body: Row(
        children: [
          SideBarWidgets(key: UniqueKey()),
          Expanded(
            child: SizedBox(
              height: context.mh,
              width: context.mw,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header
                    0.01.ph(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Email Templates",
                          style: TextStyle(
                            fontSize: context.mh * 0.020,
                            fontWeight: FontWeight.w600,
                            color: AppColor.primaryColor,
                            letterSpacing: 0.3,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed(RouteNames.templateEditor);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            child: Text(
                              "Create New",
                              style: TextStyle(
                                fontSize: context.mh * 0.020,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Search Bar
                    SizedBox(height: context.mh * 0.02),
                    Container(
                      height: context.mh * 0.06,
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: Colors.grey.shade200,
                          width: 1,
                        ),
                      ),
                      child: TextFormField(
                        controller: controller.searchController.value,
                        style: TextStyle(
                          fontSize: context.mh * 0.015,
                          color: Colors.grey[800],
                        ),
                        decoration: InputDecoration(
                          hintText: "Search Templates...",
                          hintStyle: TextStyle(
                            fontSize: context.mh * 0.015,
                            color: Colors.grey[500],
                          ),
                          prefixIcon: Icon(
                            IconlyLight.search,
                            size: context.mh * 0.022,
                            color: Colors.grey[600],
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: context.mh * 0.012,
                            horizontal: context.mw * 0.01,
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                        onChanged: (value) {
                          controller.filterTemplates(value);
                        },
                      ),
                    ),

                    // Template Grid
                    0.02.ph(context),
                    SizedBox(
                      height: context.mh * 0.8,
                      width: context.mw * 0.8,
                      child: SingleChildScrollView(child: TemplateGrid()),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
