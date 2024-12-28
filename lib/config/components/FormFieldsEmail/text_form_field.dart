import 'package:emend_web_app/config/styles/app_styles.dart';
import 'package:flutter/material.dart';

import '../../color/app_color.dart';

class CommonTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? initialValue;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool readOnly;
  final bool enabled;
  final String? label;
  final int? maxLines;

  const CommonTextFormField(
      {super.key,
      this.controller,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.readOnly = false,
      this.enabled = true,
      this.initialValue,
      this.labelText,
      this.label,
      this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null && label!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              label!,
              style: AppTextStyles.heading4.copyWith(
                color: AppColor.primaryColor,
              ),
            ),
          ),
        TextFormField(
          maxLines: maxLines,
          initialValue: initialValue,
          enabled: enabled,
          readOnly: readOnly,
          focusNode: FocusNode(),
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppTextStyles.hint,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            focusedBorder: const OutlineInputBorder(),
            border: const OutlineInputBorder(),
          ),
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obscureText,
        ),
      ],
    );
  }
}
