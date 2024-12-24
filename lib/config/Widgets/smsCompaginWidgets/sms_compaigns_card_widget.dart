import 'package:emend_web_app/config/components/smsCompaignComp/sms_compaign_comp.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:emend_web_app/config/widgets/widgets.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SMS Campaigns",
                style: GoogleFonts.roboto(
                  fontSize: context.mh * 0.025,
                  fontWeight: FontWeight.w500,
                ),
              ),
              MaterialButton(
                minWidth: context.mw * 0.10,
                color: Colors.blue,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                height: context.mh * 0.06,
                onPressed: () {
                  smsController.showsmsCompaignView.value = true;
                },
                child: Text(
                  "Create Campaign",
                  style: GoogleFonts.roboto(
                    fontSize: context.mh * 0.019,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
        0.04.ph(context),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
        //   child: Row(
        //     children: [
        //       Text(
        //         "SINCE LAST VISIT",
        //         style: GoogleFonts.roboto(
        //           fontSize: context.mh * 0.024,
        //           fontWeight: FontWeight.w500,
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        // 0.01.ph(context),
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
        0.02.ph(context),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
          child: Row(
            children: [
              Text(
                "Messaging",
                style: GoogleFonts.roboto(
                  fontSize: context.mh * 0.019,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        0.01.ph(context),
        // ListViewBuilder for Active Messgaing Campign
        const SmsCompaignsListWidget()
      ],
    );
  }
}
