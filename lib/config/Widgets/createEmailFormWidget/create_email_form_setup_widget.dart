import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateEmailFormSetupWidget extends StatelessWidget {
  const CreateEmailFormSetupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: context.mh * 0.06,
          padding: EdgeInsets.symmetric(horizontal: context.mw * 0.01),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: "Campaign Name",
              hintStyle: GoogleFonts.barlow(
                fontSize: context.mh * 0.020,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: context.mh * 0.01,
                horizontal: context.mw * 0.01,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
