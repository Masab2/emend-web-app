import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ChatContactListWidget extends StatelessWidget {
  const ChatContactListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
      child: const Row(
        children: [
          ContactListWidget(),
          ChatMessageWidget(),
          ChatContactDetailWidget(),
        ],
      ),
    );
  }
}
