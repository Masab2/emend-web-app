import 'package:emend_web_app/config/Widgets/templateWidgets/template_header.dart';
import 'package:emend_web_app/config/Widgets/widgets.dart';
import 'package:emend_web_app/config/assets/image_asset.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:emend_web_app/views/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TemplateView extends StatelessWidget {
  static const String route = '/templateView';
  const TemplateView({super.key});

  @override
  Widget build(BuildContext context) {
    // List of templates data
    final List<Map<String, String>> templates = [
      {'image': ImageAsset.emtemp1pictitle, 'title': "Email Template 1"},
      {'image': ImageAsset.emtemp1pictitle, 'title': "Email Template 2"},
      {'image': ImageAsset.emtemp1pictitle, 'title': "Email Template 3"},
      {'image': ImageAsset.emtemp1pictitle, 'title': "Email Template 4"},
      {'image': ImageAsset.emtemp1pictitle, 'title': "Email Template 5"},
    ];

    return Scaffold(
      body: Row(
        children: [
          SideBarWidgets(
            key: UniqueKey(),
          ),
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
                    const TemplateHeaderWidget(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Email Templates",
                          style: TextStyle(
                            fontSize: context.mh * 0.028,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.toNamed(UnLayerEditor.route);
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
                    // Template Cards
                    0.02.ph(context),
                    SizedBox(
                      height: context.mh * 0.8,
                      width: context.mw * 0.8,
                      child: SingleChildScrollView(
                          child: TemplateGrid(templates: templates)),
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

class TemplateGrid extends StatelessWidget {
  const TemplateGrid({
    super.key,
    required this.templates,
  });

  final List<Map<String, String>> templates;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 30,
      children: templates.map((template) {
        return Container(
          height: context.mh * 0.45,
          width: context.mw * 0.15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(template['image']!),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Open Template Button
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    child: Text(
                      "Email Template 1",
                      style: TextStyle(
                        fontSize: context.mh * 0.020,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
