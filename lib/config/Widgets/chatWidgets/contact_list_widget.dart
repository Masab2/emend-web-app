import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class ContactListWidget extends StatelessWidget {
  const ContactListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    final List<Map<String, dynamic>> socialPlatforms = [
      {'name': 'Instagram', 'icon': IconlyBold.camera},
      {'name': 'Facebook', 'icon': IconlyBold.message},
      {'name': 'WhatsApp', 'icon': IconlyBold.chat},
      {'name': 'TikTok', 'icon': IconlyBold.video},
      {'name': 'Twitter', 'icon': IconlyBold.paper},
    ];

    return Card(
      color: AppColor.whiteColor,
      child: Container(
        height: context.mh * 0.9,
        width: context.mw * 0.27,
        padding: EdgeInsets.symmetric(
          horizontal: context.mw * 0.01,
          vertical: context.mh * 0.01,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: context.mh * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(bottom: context.mh * 0.01),
                          border: InputBorder.none,
                          prefixIcon: const Icon(IconlyLight.search),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            0.01.ph(context),
            Scrollbar(
              thumbVisibility: true,
              controller: _scrollController,
              child: Container(
                width: context.mw * 0.27,
                margin: EdgeInsets.symmetric(vertical: context.mh * 0.01),
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(vertical: context.mh * 0.01),
                  child: Row(
                    children: socialPlatforms
                        .map((platform) => Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Chip(
                                backgroundColor:
                                    AppColor.primaryColor.withOpacity(0.1),
                                label: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      platform['icon'],
                                      size: context.mh * 0.018,
                                      color: AppColor.primaryColor,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      platform['name'],
                                      style: GoogleFonts.barlow(
                                        fontSize: context.mh * 0.016,
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
            0.01.ph(context),
            // Contact List
            Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColor.redColor,
                          radius: context.mh * 0.030,
                        ),
                        Positioned(
                          bottom: 2,
                          right: 2,
                          child: CircleAvatar(
                            backgroundColor: Colors.green,
                            radius: context.mh * 0.010,
                          ),
                        ),
                      ],
                    ),
                    title: Text(
                      "Masab",
                      style: GoogleFonts.barlow(
                        fontSize: context.mh * 0.018,
                      ),
                    ),
                    subtitle: Text(
                      "From ads that dance or sing to MTV-like commercials, online...",
                      maxLines: 2,
                      style: GoogleFonts.barlow(
                        color: Colors.grey,
                        fontSize: context.mh * 0.016,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.email,
                          color: AppColor.primaryColor,
                          size: context.mh * 0.018,
                        ),
                        0.003.pw(context),
                        Text(
                          "Email",
                          style: GoogleFonts.barlow(
                            fontSize: context.mh * 0.018,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
