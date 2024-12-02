import 'package:emend_web_app/config/Color/app_color.dart';
import 'package:emend_web_app/config/Widgets/widgets.dart';
import 'package:flutter/material.dart';

class EmailCompaignsView extends StatelessWidget {
  const EmailCompaignsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.viewsBackgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: const [
            EmailCompaginSectionOneWidget(),
            EmailCompaignCardWidget(),
            EmailCompaaginSecondWidget(),
            EmailCompaignsListWidget(),
          ],
        ),
      ),
    );
  }
}
