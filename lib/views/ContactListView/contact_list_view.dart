import 'package:emend_web_app/config/Widgets/widgets.dart';
import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:emend_web_app/views/ContactListView/create_contact_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Controllers/controller.dart';

class ContactListView extends StatelessWidget {
  const ContactListView({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactListController controller = Get.put(ContactListController());
    return Obx(
      () {
        return controller.showCreateContactView.value == true
            ? const CreateContactView()
            : Container(
                color: AppColor.viewsBackgroundColor,
                child: Column(
                  children: [
                    0.01.ph(context),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: context.mw * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.showContactListUi(false, []);
                                },
                                child: Icon(
                                  Icons.arrow_back,
                                  size: context.mh * 0.024,
                                ),
                              ),
                              0.02.pw(context),
                              Text(
                                "Contact List",
                                style: GoogleFonts.roboto(
                                  fontSize: context.mh * 0.027,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          0.01.ph(context),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MaterialButton(
                                minWidth: context.mw * 0.15,
                                color: AppColor.blueColor,
                                height: context.mh * 0.06,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onPressed: () async {
                                  controller.showContactListUi(false, []);
                                  controller.showCreateContactUi(true);
                                },
                                child: Text(
                                  "Create List",
                                  style: GoogleFonts.roboto(
                                    fontSize: context.mh * 0.02,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    0.01.ph(context),
                    const ContactListViewWiidget(),
                  ],
                ),
              );
      },
    );
  }
}
