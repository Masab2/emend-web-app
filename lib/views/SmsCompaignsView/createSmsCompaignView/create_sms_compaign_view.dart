import 'package:emend_web_app/Controllers/controller.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/components/stepIndicator/sms_process_timeLine_indicator.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:emend_web_app/config/widgets/smsCompaginWidgets/createSmsCompaignWidget/create_sms_message_widget.dart';
import 'package:emend_web_app/config/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateSmsCompaignView extends StatelessWidget {
  const CreateSmsCompaignView({super.key});

  @override
  Widget build(BuildContext context) {
    final createSmsController = Get.put(SmsCompaignController());
    return Container(
      color: AppColor.viewsBackgroundColor,
      height: context.mh,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    createSmsController.showCreateEmailUi(false);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: context.mh * 0.020,
                  ),
                ),
                Text(
                  "Create SMS Campaign",
                  style: GoogleFonts.barlow(
                    fontSize: context.mh * 0.028,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Container(
              height: context.mh * 0.8,
              width: context.mw,
              // color: Colors.red,
              child: Column(
                children: [
                  SmsProcessTimelineIndicator(),
                  Obx(() {
                    return getselectedIndexForm(
                        createSmsController.processIndex.value);
                  })
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: context.mw * 0.10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    onPressed: () {
                      createSmsController.decrementIndex();
                    },
                    child: Text(
                      "Previous",
                      style: GoogleFonts.barlow(),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      createSmsController.incrementIndex();
                    },
                    child: Text(
                      "Next",
                      style: GoogleFonts.barlow(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getselectedIndexForm(int index) {
    switch (index) {
      case 0:
        return const SmsCompaignSetupWidget();
      case 1:
        return const SmsCompaignContentWidget();
      case 2:
        return const CreateSmsMessageWidget();
      default:
        return const Text("No Form");
    }
  }
}
