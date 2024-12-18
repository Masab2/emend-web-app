import 'package:emend_web_app/config/assets/image_asset.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TemplateView extends StatelessWidget {
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

    return Container(
      color: AppColor.viewsBackgroundColor,
      height: context.mh,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Text(
                "Email Templates",
                style: GoogleFonts.barlow(
                  fontSize: context.mh * 0.028,
                  fontWeight: FontWeight.w500,
                ),
              ),
              // Template Cards
              0.02.ph(context),
              Wrap(
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 8),
                              child: Text(
                                "Open Template",
                                style: GoogleFonts.barlow(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
