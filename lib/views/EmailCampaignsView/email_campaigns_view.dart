import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/widgets/EmailCampaignWidgets/email_campaign_card_widget.dart';
import 'package:emend_web_app/config/widgets/EmailCampaignWidgets/email_campaign_second_widget.dart';
import 'package:emend_web_app/config/widgets/EmailCampaignWidgets/email_campaign_section_one_widget.dart';
import 'package:emend_web_app/config/widgets/EmailCampaignWidgets/email_campaigns_list_widget.dart';
import 'package:emend_web_app/config/widgets/SideBarWidgets/side_bar_widgets.dart';
import 'package:emend_web_app/controllers/create_email_controller.dart';
import 'package:emend_web_app/views/EmailCampaignsView/createEmailCampaign/create_email_campaign_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailCampaignsView extends StatefulWidget {
  static const String route = '/emailCampaignsView';
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
              child: SingleChildScrollView(
                child: Obx(() {
                  return createEmailController.showCreateEmailView.value ==
                          false
                      ? Column(
                          spacing: context.mh * 0.01,
                          children: const [
                            EmailCampaignHeaderWidget(),
                            EmailCampaignCardWidget(),
                            EmailCampaignSecondWidget(),
                            EmailCampaignsListWidget(),
                          ],
                        )
                      : const CreateEmailCampaignView();
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
