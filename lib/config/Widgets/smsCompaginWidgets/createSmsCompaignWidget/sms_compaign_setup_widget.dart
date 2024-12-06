import 'package:emend_web_app/config/components/FormFeildsEmail/form_feilds_comp.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';

class SmsCompaignSetupWidget extends StatelessWidget {
  const SmsCompaignSetupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FormFeildsComp(
          title: "First Name",
          height: context.mh * 0.06,
        ),
        0.01.ph(context),
        FormFeildsComp(
          title: "From",
          height: context.mh * 0.06,
        ),
        0.01.ph(context),
      ],
    );
  }
}
