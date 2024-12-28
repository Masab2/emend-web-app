import 'package:emend_web_app/config/components/components.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/controllers/SMSCampaignController/sms_campaign_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'sms_campaign_list_widget.dart';

class SmsCampaignsCardWidget extends StatelessWidget {
  const SmsCampaignsCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final smsController = Get.put(SmsCampaignController());
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SMS Campaigns",
                style: TextStyle(
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
                  smsController.showSMSCampaignView.value = true;
                },
                child: Text(
                  "Create Campaign",
                  style: TextStyle(
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
        //         style: TextStyle(
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
              SmsCampaignComp(count: "0"),
              SmsCampaignComp(count: "0"),
              SmsCampaignComp(count: "0"),
              SmsCampaignComp(count: "0"),
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
                style: TextStyle(
                  fontSize: context.mh * 0.019,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        0.01.ph(context),
        // ListViewBuilder for Active Messaging Campaign
        const SmsCampaignsListWidget()
      ],
    );
  }
}
