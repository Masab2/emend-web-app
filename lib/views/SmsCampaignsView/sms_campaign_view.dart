import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/widgets/widgets.dart';
import 'package:emend_web_app/controllers/SMSCampaignController/sms_campaign_controller.dart';
import 'package:emend_web_app/views/views.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmsCampaignView extends StatefulWidget {
  static const String route = '/smsCampaignsView';
  const SmsCampaignView({super.key});

  @override
  State<SmsCampaignView> createState() => _SmsCampaignViewState();
}

class _SmsCampaignViewState extends State<SmsCampaignView> {
  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SmsCampaignHeaderWidget(),
                    0.02.ph(context),
                    const SmsCampaignsCardWidget(),
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
