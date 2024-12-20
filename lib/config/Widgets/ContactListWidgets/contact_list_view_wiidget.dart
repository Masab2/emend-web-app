import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:emend_web_app/views/ContactListView/contact_details_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../../../Controllers/controller.dart';

class ContactListViewWiidget extends StatelessWidget {
  const ContactListViewWiidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactListController controller = Get.put(ContactListController());
    return Obx(() {
      return controller.showContactListInList.value == true
          ? const ContactDetailsList()
          : Column(
              children: [
                Container(
                  height: context.mh * 0.06,
                  width: context.mw,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 220, 220, 223),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: context.mw * 0.01),
                  margin: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
                  child: Row(
                    children: [
                      SizedBox(
                        width: context.mw * 0.03,
                        child: Text(
                          "ID",
                          style: GoogleFonts.roboto(
                            fontSize: context.mh * 0.02,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.20,
                        child: Text(
                          "Name",
                          style: GoogleFonts.roboto(
                            fontSize: context.mh * 0.02,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.20,
                        child: Text(
                          "Total Contacts",
                          style: GoogleFonts.roboto(
                            fontSize: context.mh * 0.02,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: context.mw * 0.06,
                        child: Center(
                          child: Text(
                            "Actions",
                            style: GoogleFonts.roboto(
                              fontSize: context.mh * 0.02,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: context.mh * 0.85,
                  child: Obx(() {
                    return ListView.builder(
                      itemCount: controller.contactLists.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: context.mw * 0.02),
                          padding: EdgeInsets.symmetric(
                              horizontal: context.mw * 0.01),
                          child: Column(
                            spacing: context.mh * 0.02,
                            children: [
                              0.01.ph(context),
                              Row(
                                children: [
                                  SizedBox(
                                    width: context.mw * 0.03,
                                    child: Text(
                                      "${index + 1}",
                                      style: GoogleFonts.roboto(
                                        fontSize: context.mh * 0.02,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: context.mw * 0.20,
                                    child: Text(
                                      controller.contactLists[index].name,
                                      style: GoogleFonts.roboto(
                                        fontSize: context.mh * 0.02,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      controller.showContactListUi(
                                          true,
                                          controller
                                              .contactLists[index].contacts);
                                    },
                                    child: SizedBox(
                                      width: context.mw * 0.20,
                                      child: Text(
                                        "${controller.contactLists[index].contacts.length} Contacts",
                                        style: GoogleFonts.roboto(
                                          fontSize: context.mh * 0.02,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: context.mw * 0.06,
                                    child: Center(
                                      child: Icon(
                                        IconlyLight.add_user,
                                        size: context.mh * 0.028,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            );
    });
  }
}
