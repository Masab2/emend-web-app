import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';

import '../../config/Widgets/widgets.dart';

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
