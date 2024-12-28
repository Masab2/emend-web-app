import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateEmailFormSetupWidget extends StatelessWidget {
  const CreateEmailFormSetupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Heading Widget
        _buildHeading(context),
        0.02.ph(context),
        Row(
          children: [
            Expanded(
              child: _buildFormField(
                "From Name",
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Campaign Name',
                    hintStyle: TextStyle(fontSize: context.mh * 0.020),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                  ),
                ),
                context,
              ),
            ),
            0.01.pw(context),
            Expanded(
              child: _buildFormField(
                "From Email",
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    hintStyle: TextStyle(fontSize: context.mh * 0.020),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                  ),
                ),
                context,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Text(
              "Use a different reply-to email address",
              style: GoogleFonts.outfit(
                fontSize: context.mh * 0.018,
              ),
            ),
          ],
        ),
        0.02.ph(context),
        _buildFormField(
          "Subject",
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter Subject',
              hintStyle: TextStyle(fontSize: context.mh * 0.020),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
          ),
          context,
        ),
      ],
    );
  }

  Widget _buildFormField(String label, Widget field, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            fontSize: context.mh * 0.018,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          height: context.mh * 0.06,
          width: context.mw,
          decoration: BoxDecoration(
            color: AppColor.textFormFeildBackgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: field,
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildHeading(BuildContext context) {
    return Row(
      children: [
        Text(
          "Subject & Content",
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.bold,
            fontSize: context.mh * 0.025,
          ),
        ),
        const SizedBox(width: 8),
        Icon(
          Icons.arrow_forward_ios,
          size: context.mh * 0.020,
        ),
      ],
    );
  }
}
