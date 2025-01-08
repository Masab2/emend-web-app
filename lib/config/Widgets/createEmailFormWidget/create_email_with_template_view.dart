import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';

import '../templateWidgets/template_grid.dart';

class CreateEmailWithTemplateView extends StatelessWidget {
  const CreateEmailWithTemplateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.mh * 0.5,
          width: context.mw,
          child: SingleChildScrollView(child: TemplateGrid()),
        ),
      ],
    );
  }
}
