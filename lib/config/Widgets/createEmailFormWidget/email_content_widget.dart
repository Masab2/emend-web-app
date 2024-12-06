import 'package:emend_web_app/config/components/FormFeildsEmail/form_feilds_comp.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';

class CreateEmailContentWidget extends StatelessWidget {
  const CreateEmailContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        FormFeildsComp(
          title: "Content",
          hint: "Enter Email Content here",
          maxLines: 10, height: context.mh * 0.5,
        ),
      ],
    );
  }
}
