import 'package:emend_web_app/Controllers/controller.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/widgets/smsCompaginWidgets/sms_compaigns_card_widget.dart';
import 'package:emend_web_app/config/widgets/smsCompaginWidgets/sms_copaign_header_widget.dart';
import 'package:emend_web_app/views/SmsCompaignsView/createSmsCompaignView/create_sms_compaign_view.dart';
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
      child: SingleChildScrollView(
        child: Obx(
          () {
            return smsController.showsmsCompaignView.value == false
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmsCopaignHeaderWidget(),
                      SmsCompaignsCardWidget(),
                    ],
                  )
                : const CreateSmsCompaignView();
          },
        ),
      ),
    );
  }
}
