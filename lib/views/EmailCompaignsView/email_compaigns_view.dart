import 'package:emend_web_app/Controllers/createEmailController/create_email_controller.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:emend_web_app/views/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/Widgets/widgets.dart';

class EmailCompaignsView extends StatefulWidget {
  const EmailCompaignsView({super.key});

  @override
  State<EmailCompaignsView> createState() => _EmailCompaignsViewState();
}

class _EmailCompaignsViewState extends State<EmailCompaignsView> {
  final createEmailController = Get.put(CreateEmailController());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.viewsBackgroundColor,
      child: SingleChildScrollView(
        child: Obx(() {
          return createEmailController.showCreateEmailView.value == false
              ? Column(
                  children: [
                    const EmailCompaginHeaderWidget(),
                    0.01.ph(context),
                    const EmailCompaignCardWidget(),
                    0.01.ph(context),
                    const EmailCompaaginSecondWidget(),
                    0.01.ph(context),
                    const EmailCompaignsListWidget(),
                    0.01.ph(context),
                  ],
                )
              : const CreateEmailCompaginView();
        }),
      ),
    );
  }
}
