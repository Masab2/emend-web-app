import 'package:emend_web_app/Controllers/controller.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:emend_web_app/config/widgets/smsCompaginWidgets/sms_compaigns_card_widget.dart';
import 'package:emend_web_app/config/widgets/smsCompaginWidgets/sms_copaign_header_widget.dart';
import 'package:emend_web_app/views/SmsCompaignsView/createSmsCompaignView/create_sms_campaign_home_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmsCompaignView extends StatefulWidget {
  const SmsCompaignView({super.key});

  @override
  State<SmsCompaignView> createState() => _SmsCompaignViewState();
}

class _SmsCompaignViewState extends State<SmsCompaignView> {
  @override
  Widget build(BuildContext context) {
    final smsController = Get.put(SmsCompaignController());
    return Container(
      color: AppColor.viewsBackgroundColor,
      height: context.mh,
      child: SingleChildScrollView(
        child: Obx(
          () {
            return smsController.showsmsCompaignView.value == false
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SmsCopaignHeaderWidget(),
                      0.02.ph(context),
                      const SmsCompaignsCardWidget(),
                    ],
                  )
                : CreateSmsCampaignHomeScreenView();
          },
        ),
      ),
    );
  }
}
