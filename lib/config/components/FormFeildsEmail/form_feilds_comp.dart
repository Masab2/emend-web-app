import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormFeildsComp extends StatelessWidget {
  final String title;
  final int? maxLines;
  final double? height;
  final String? hint;
  const FormFeildsComp(
      {super.key,
      required this.title,
      this.maxLines,
      required this.height,
      this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.mw * 0.06),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.barlow(
                  fontSize: context.mh * 0.020,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                height: height,
                width: context.mw * 0.60,
                padding: EdgeInsets.symmetric(horizontal: context.mw * 0.01),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  maxLines: maxLines,
                  decoration: InputDecoration(
                    hintText: hint,
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
          ),
        ],
      ),
    );
  }
}
