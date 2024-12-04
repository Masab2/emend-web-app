import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/views/EmailCompaignsView/emailCompaignWidgets/email_compaign_card_widget.dart';
import 'package:flutter/material.dart';

import 'emailCompaignWidgets/email_compaagin_second_widget.dart';
import 'emailCompaignWidgets/email_compagin_section_one_widget.dart';
import 'emailCompaignWidgets/email_compaigns_list_widget.dart';

class EmailCompaignsView extends StatelessWidget {
  const EmailCompaignsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.viewsBackgroundColor,
      child: const SingleChildScrollView(
        child: Column(
          children: [
            EmailCompaginHeaderWidget(),
            EmailCompaignCardWidget(),
            EmailCompaaginSecondWidget(),
            EmailCompaignsListWidget(),
          ],
        ),
      ),
    );
  }
}
