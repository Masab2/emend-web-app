import 'package:emend_web_app/config/components/messagingComp/messaging_comp.dart';
import 'package:emend_web_app/config/components/smsCompaignComp/sms_compaign_comp.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Controllers/controller.dart';

class SmsCompaignsCardWidget extends StatelessWidget {
  const SmsCompaignsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final smsController = Get.put(SmsCompaignController());
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
          child: Row(
            children: [
              Text(
                "SMS Campaigns",
                style: GoogleFonts.barlow(
                  fontSize: context.mh * 0.028,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        0.04.ph(context),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
          child: Row(
            children: [
              Text(
                "SINCE LAST VISIT",
                style: GoogleFonts.barlow(
                  fontSize: context.mh * 0.024,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        0.01.ph(context),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
          child: const Row(
            children: [
              SmsCompaignComp(count: "0"),
              SmsCompaignComp(count: "0"),
              SmsCompaignComp(count: "0"),
              SmsCompaignComp(count: "0"),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
          child: Row(
            children: [
              Text(
                "MESSAGING",
                style: GoogleFonts.barlow(
                  fontSize: context.mh * 0.022,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        0.01.ph(context),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
          child: Row(
            children: [
              const MessagingComp(
                text: "Send a group Text",
                subtext:
                    "Compose and send group texts to your subscribed contacts",
              ),
              const MessagingComp(
                text: "Start 1-on-chat",
                subtext:
                    "Use a textable phone number to start a 1-on-1 chat with a contact",
              ),
              GestureDetector(
                onTap: () {
                  smsController.showCreateEmailUi(true);
                },
                child: const MessagingComp(
                  text: "Create a SMS campaign",
                  subtext:
                      "Automate messages when sunscribers join your contact group",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
