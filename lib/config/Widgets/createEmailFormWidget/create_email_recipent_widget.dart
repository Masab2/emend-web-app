import 'package:flutter/material.dart';

class AccountManager {
  final String name;
  final String contact;

  AccountManager(this.name, this.contact);
}

// Generate random account managers
List<AccountManager> generateRandomAccountManagers(int count) {
  return List.generate(
    count,
    (index) => AccountManager("Manager $index", "Contact $index"),
  );
}

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

  void filterAccountManagers(String query) {
    setState(() {
      // Not using this anymore because `flutter_typeahead` handles filtering
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Padding(
        //   padding: EdgeInsets.symmetric(
        //       horizontal: MediaQuery.of(context).size.width * 0.06),
        //   child: Row(
        //     children: [
        //       SizedBox(width: MediaQuery.of(context).size.width * 0.02),
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Text(
        //             "Recipient",
        //             style: GoogleFonts.barlow(
        //               fontSize: MediaQuery.of(context).size.height * 0.016,
        //             ),
        //           ),
        //           Container(
        //             height: MediaQuery.of(context).size.height * 0.07,
        //             width: MediaQuery.of(context).size.width * 0.50,
        //             padding: EdgeInsets.symmetric(
        //                 horizontal: MediaQuery.of(context).size.width * 0.01),
        //             decoration: BoxDecoration(
        //                 color: Colors.white,
        //                 borderRadius: BorderRadius.circular(10)),
        //             child: TypeAheadField<AccountManager>(
        //               textFieldConfiguration: TextFieldConfiguration(
        //                 controller: emailRecipientController,
        //                 decoration: const InputDecoration(
        //                   hintText: "Search Recipient",
        //                   border: InputBorder.none,
        //                   contentPadding: EdgeInsets.only(left: 8, bottom: 12),
        //                 ),
        //               ),
        //               suggestionsCallback: (pattern) {
        //                 return accountManagerList.where((manager) {
        //                   return manager.name
        //                       .toLowerCase()
        //                       .contains(pattern.toLowerCase());
        //                 }).toList();
        //               },
        //               itemBuilder: (context, AccountManager manager) {
        //                 return ListTile(
        //                   title: Text(manager.name),
        //                 );
        //               },
        //               onSuggestionSelected: (AccountManager manager) {
        //                 setState(() {
        //                   selectedRecipient = manager;
        //                   emailRecipientController.text = manager.name;
        //                 });
        //               },
        //             ),
        //           ),
        //         ],
        //       ),
        //       SizedBox(width: MediaQuery.of(context).size.width * 0.01),
        //       Column(
        //         children: [
        //           SizedBox(height: MediaQuery.of(context).size.height * 0.012),
        //           MaterialButton(
        //             color: Colors.blue,
        //             minWidth: MediaQuery.of(context).size.width * 0.10,
        //             height: MediaQuery.of(context).size.height * 0.07,
        //             shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(10),
        //             ),
        //             onPressed: () {
        //               if (selectedRecipient != null &&
        //                   !selectedRecipients
        //                       .contains(selectedRecipient)) {
        //                 setState(() {
        //                   selectedRecipients.add(selectedRecipient!);
        //                   emailRecipientController.clear();
        //                   selectedRecipient = null;
        //                 });
        //               }
        //             },
        //             child: Text(
        //               "Add Recipient",
        //               style: GoogleFonts.barlow(
        //                 fontSize: MediaQuery.of(context).size.height * 0.016,
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
        // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        // if (selectedRecipients.isNotEmpty)
        //   Padding(
        //     padding: EdgeInsets.symmetric(
        //         horizontal: MediaQuery.of(context).size.width * 0.06),
        //     child: Table(
        //       border: TableBorder.all(color: Colors.grey),
        //       columnWidths: const {
        //         0: FlexColumnWidth(1),
        //         1: FlexColumnWidth(2),
        //         2: FlexColumnWidth(2),
        //       },
        //       children: [
        //         TableRow(
        //           decoration: BoxDecoration(color: Colors.grey[200]),
        //           children: const [
        //             Padding(
        //               padding: EdgeInsets.all(8.0),
        //               child: Text(
        //                 "No.",
        //                 style: TextStyle(fontWeight: FontWeight.bold),
        //               ),
        //             ),
        //             Padding(
        //               padding: EdgeInsets.all(8.0),
        //               child: Text(
        //                 "Name",
        //                 style: TextStyle(fontWeight: FontWeight.bold),
        //               ),
        //             ),
        //             Padding(
        //               padding: EdgeInsets.all(8.0),
        //               child: Text(
        //                 "Contact",
        //                 style: TextStyle(fontWeight: FontWeight.bold),
        //               ),
        //             ),
        //           ],
        //         ),
        //         ...List.generate(
        //           selectedRecipients.length,
        //           (index) => TableRow(
        //             children: [
        //               Padding(
        //                 padding: const EdgeInsets.all(8.0),
        //                 child: Text((index + 1).toString()),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.all(8.0),
        //                 child: Text(selectedRecipients[index].name),
        //               ),
        //               Padding(
        //                 padding: const EdgeInsets.all(8.0),
        //                 child: Text(selectedRecipients[index].contact),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
      ],
    );
  }
}
