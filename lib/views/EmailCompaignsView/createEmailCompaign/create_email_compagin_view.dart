import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:emend_web_app/config/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Controllers/createEmailController/create_email_controller.dart';
import '../../../config/components/stepIndicator/time_line_stepper_indicator.dart';

class CreateEmailCompaginView extends StatefulWidget {
  const CreateEmailCompaginView({super.key});

  @override
  State<CreateEmailCompaginView> createState() =>
      _CreateEmailCompaginViewState();
}

class _CreateEmailCompaginViewState extends State<CreateEmailCompaginView> {
  @override
  Widget build(BuildContext context) {
    final createEmailController = Get.put(CreateEmailController());
    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop) {
          createEmailController.showCreateEmailUi(false);
        }
      },
      child: Container(
        color: AppColor.viewsBackgroundColor,
        height: context.mh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      createEmailController.showCreateEmailUi(false);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      size: context.mh * 0.020,
                    ),
                  ),
                  Text(
                    "Create Campaign",
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
                    ProcessTimelineIndicator(),
                    Obx(() {
                      return getselectedIndexForm(
                          createEmailController.processIndex.value);
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
                        createEmailController.incrementIndex();
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
      ),
    );
  }

  Widget getselectedIndexForm(int index) {
    switch (index) {
      case 0:
        return const CreateEmailFormSetupWidget();
      case 1:
        return const CreateEmailContentWidget();
      case 2:
        return const CreateEmailRecipientWidget();
      default:
        return const Text("No Form");
    }
  }
}
