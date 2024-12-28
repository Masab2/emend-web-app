import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/widgets/chatWidgets/chat_contact_detail_widget.dart';
import 'package:emend_web_app/config/widgets/chatWidgets/chat_message_widget.dart';
import 'package:emend_web_app/config/widgets/chatWidgets/contact_list_widget.dart';
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
