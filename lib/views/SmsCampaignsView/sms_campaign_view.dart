import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/widgets/SMSCampaignWidgets/sms_campaign_header_widget.dart';
import 'package:emend_web_app/config/widgets/SMSCampaignWidgets/sms_campaigns_card_widget.dart';
import 'package:emend_web_app/controllers/sms_campaign_controller.dart';
import 'package:emend_web_app/views/SmsCampaignsView/createSmsCampaignView/create_sms_campaign_home_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/widgets/SideBarWidgets/side_bar_widgets.dart';

class SmsCampaignView extends StatefulWidget {
  static const String route = '/smsCampaignsView';
  const SmsCampaignView({super.key});

  @override
  State<SmsCampaignView> createState() => _SmsCampaignViewState();
}

class _SmsCampaignViewState extends State<SmsCampaignView> {
  @override
  Widget build(BuildContext context) {
    final smsController = Get.put(SmsCampaignController());
    return Scaffold(
      body: Row(
        children: [
          SideBarWidgets(
            key: UniqueKey(),
          ),
          Expanded(
            child: SizedBox(
              height: context.mh,
              child: SingleChildScrollView(
                child: Obx(
                  () {
                    return smsController.showSMSCampaignView.value == false
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SmsCampaignHeaderWidget(),
                              0.02.ph(context),
                              const SmsCampaignsCardWidget(),
                            ],
                          )
                        : CreateSmsCampaignHomeScreenView();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
