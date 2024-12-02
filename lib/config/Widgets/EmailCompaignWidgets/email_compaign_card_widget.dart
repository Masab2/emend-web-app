import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/EmailCompainBox/email_compains_box.dart';

class EmailCompaignCardWidget extends StatelessWidget {
  const EmailCompaignCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
          child: Row(
            children: [
              Text(
                "E-Mail Campaigns",
                style: GoogleFonts.roboto(
                  fontSize: context.mh * 0.024,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        0.01.ph(context),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.01),
          child: const Column(
            children: [
              Row(
                children: [
                  EmailCompainsBox(
                    count: '3000',
                    heading: 'All Your Accounts',
                  ),
                  EmailCompainsBox(
                    count: '2',
                    heading: 'Opened',
                  ),
                  EmailCompainsBox(
                    count: '2',
                    heading: 'Clicked',
                  ),
                  EmailCompainsBox(
                    count: '3',
                    heading: 'Blacklisted',
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
