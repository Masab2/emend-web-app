import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/widgets/ChatWidgets/chat_contact_list_widget.dart';
import 'package:emend_web_app/config/widgets/SideBarWidgets/side_bar_widgets.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  static const String route = '/chatView';
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBarWidgets(
            key: UniqueKey(),
          ),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
                  child: Row(
                    children: [
                      Text(
                        "Chats",
                        style: TextStyle(
                          fontSize: context.mh * 0.028,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                const ChatContactListWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
