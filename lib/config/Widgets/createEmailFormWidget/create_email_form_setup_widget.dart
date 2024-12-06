import 'package:emend_web_app/config/components/FormFeildsEmail/form_feilds_comp.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';

class CreateEmailFormSetupWidget extends StatelessWidget {
  const CreateEmailFormSetupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         FormFeildsComp(title: "From Name", height: context.mh * 0.06,),
        0.01.ph(context),
         FormFeildsComp(title: "Subject", height: context.mh * 0.06,),
        0.01.ph(context),
         FormFeildsComp(title: "From Email", height: context.mh * 0.06,),
        0.01.ph(context),
         FormFeildsComp(title: "Reply To", height: context.mh * 0.06,),
        0.01.ph(context),
      ],
    );
  }
}
