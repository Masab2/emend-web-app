import 'package:emend_web_app/config/assets/image_asset.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailTemplateOne extends StatelessWidget {
  const EmailTemplateOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: context.mh,
            width: context.mw,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image(
                    width: context.mw,
                    fit: BoxFit.cover,
                    image: AssetImage(ImageAsset.emtemp1pictitle),
                  ),
                  Text(
                    "WELCOME TO OUR",
                    style: GoogleFonts.poppins(
                      fontSize: context.mh * 0.020,
                    ),
                  ),
                  Text(
                    "Monthly Newsletter",
                    style: GoogleFonts.poppins(
                      fontSize: context.mh * 0.045,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image container
                      Container(
                        height: context.mh * 0.8,
                        width: context.mw * 0.3,
                        margin:
                            EdgeInsets.symmetric(horizontal: context.mw * 0.03),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(ImageAsset
                                .emtemp1picsubTitle), // Ensure this path is correct
                          ),
                        ),
                      ),
                      // Text container
                      Container(
                        height: context.mh * 0.8,
                        width: context.mw * 0.5,
                        padding:
                            EdgeInsets.symmetric(horizontal: context.mw * 0.02),
                        child: Expanded(
                          child: Text(
                            """An Alumni Update\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet volutpat dui, sed euismod neque. Donec a convallis ex. Suspendisse ut consectetur lectus. Quisque vel aliquet nibh. Aenean malesuada tincidunt dignissim. Curabitur in metus magna.\n\nPellentesque enim tortor, eleifend quis pellentesque eget, ultrices eu velit. Sed elementum tortor et porttitor dignissim. Cras id odio ut lectus dignissim pretium. Vivamus a laoreet orci. Nunc volutpat diam quis blandit ullamcorper.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sit amet volutpat dui, sed euismod neque. Donec a convallis ex. Suspendisse ut consectetur lectus. Quisque vel aliquet nibh. Aenean malesuada tincidunt dignissim. Curabitur in metus magna.""",
                            style: GoogleFonts.poppins(
                              fontSize: context.mh * 0.02,
                              height: 1.6,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
