import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/widgets/widgets.dart';
import 'package:emend_web_app/controllers/CreateEmailController/create_email_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailCampaignsView extends StatefulWidget {
  const EmailCampaignsView({super.key});

  @override
  State<EmailCampaignsView> createState() => _EmailCampaignsViewState();
}

class _EmailCampaignsViewState extends State<EmailCampaignsView> {
  final createEmailController = Get.put(CreateEmailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBarWidgets(
            key: UniqueKey(),
          ),
          Expanded(
            child: Container(
              color: AppColor.viewsBackgroundColor,
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: context.mh * 0.02,
                children: const [
                  EmailCampaignHeaderWidget(),
                  EmailCampaignCardWidget(),
                  EmailCampaignsListWidget(),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
