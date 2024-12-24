// ignore_for_file: library_private_types_in_public_api

import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../../../Controllers/controller.dart';

class CreateEmailRecipientWidget extends StatefulWidget {
  const CreateEmailRecipientWidget({super.key});

  @override
  _CreateEmailRecipientWidgetState createState() =>
      _CreateEmailRecipientWidgetState();
}

class _CreateEmailRecipientWidgetState
    extends State<CreateEmailRecipientWidget> {
  final TextEditingController _searchController = TextEditingController();
  bool _showSuggestions = false;
  final contactListController = Get.put(ContactListController());
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Custom Search Field
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.mw * 0.02,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01,
                        horizontal: MediaQuery.of(context).size.width * 0.02,
                      ),
                      suffixIcon:
                          const Icon(IconlyLight.search, color: Colors.grey),
                      hintText: 'Search...',
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: context.mh * 0.014,
                      ),
                      border: InputBorder.none,
                    ),
                    onTap: () {
                      setState(() {
                        _showSuggestions = !_showSuggestions;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _showSuggestions = value.isNotEmpty;
                      });
                    },
                  ),
                ),
              ),
              0.02.pw(context),
              MaterialButton(
                color: Colors.blue,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minWidth: context.mw * 0.10,
                height: context.mh * 0.06,
                onPressed: () {},
                child: Text(
                  "Add Recipent",
                  style: GoogleFonts.roboto(
                    fontSize: context.mh * 0.02,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),

        0.02.ph(context),

        // Search Suggestions
        if (_showSuggestions)
          Padding(
            padding: EdgeInsets.symmetric(
            horizontal: context.mw * 0.02,
          ),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _searchController.text = 'Recent Search $index';
                      _showSuggestions = false;
                    });
                  },
                  child: Container(
                    width: context.mw * 0.48,
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.01,
                      horizontal: MediaQuery.of(context).size.width * 0.02,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey[700]!,
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Recent Search $index',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: context.mh * 0.016,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
