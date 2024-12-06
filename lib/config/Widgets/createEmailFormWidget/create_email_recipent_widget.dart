// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';
import 'package:emend_web_app/Model/EmailCompaignModel/email_compaign_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:searchfield/searchfield.dart';

class CreateEmailRecipientWidget extends StatefulWidget {
  const CreateEmailRecipientWidget({super.key});

  @override
  _CreateEmailRecipientWidgetState createState() =>
      _CreateEmailRecipientWidgetState();
}

class _CreateEmailRecipientWidgetState
    extends State<CreateEmailRecipientWidget> {
  final List<AccountManager> accountManagerList =
      generateRandomAccountManagers(10);
  final List<AccountManager> selectedRecipients = [];
  final TextEditingController emailRecipientController =
      TextEditingController();
  AccountManager? selectedRecipient;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06),
          child: Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recipient",
                    style: GoogleFonts.barlow(
                      fontSize: MediaQuery.of(context).size.height * 0.016,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.50,
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.01),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: SearchField<AccountManager>(
                      controller: emailRecipientController,
                      onSuggestionTap: (selected) {
                        setState(() {
                          selectedRecipient = selected.item;
                          emailRecipientController.text = selected.searchKey;
                        });
                        log('Selected: ${selected.item?.name}, Contact: ${selected.item?.contact}');
                      },
                      searchInputDecoration: SearchInputDecoration(
                        contentPadding:
                            EdgeInsets.only(top: 5, left: 0, bottom: 16),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      suggestions: accountManagerList
                          .map(
                            (manager) => SearchFieldListItem<AccountManager>(
                              manager.name,
                              item: manager,
                              key: UniqueKey(),
                              child: Text(
                                manager.name,
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height *
                                        0.015),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.01),
              Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.012),
                  MaterialButton(
                    color: Colors.blue,
                    minWidth: MediaQuery.of(context).size.width * 0.10,
                    height: MediaQuery.of(context).size.height * 0.07,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onPressed: () {
                      if (selectedRecipient != null &&
                          !selectedRecipients
                              .contains(selectedRecipient)) {
                        setState(() {
                          selectedRecipients.add(selectedRecipient!);
                          emailRecipientController.clear();
                          selectedRecipient = null;
                        });
                      }
                    },
                    child: Text(
                      "Add Recipient",
                      style: GoogleFonts.barlow(
                        fontSize: MediaQuery.of(context).size.height * 0.016,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        // Display the selected recipients in a table
        if (selectedRecipients.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06),
            child: Table(
              border: TableBorder.all(color: Colors.grey),
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(2),
                2: FlexColumnWidth(2),
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "No.",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Name",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Contact",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                ...List.generate(
                  selectedRecipients.length,
                  (index) => TableRow(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text((index + 1).toString()),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(selectedRecipients[index].name),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(selectedRecipients[index].contact),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
