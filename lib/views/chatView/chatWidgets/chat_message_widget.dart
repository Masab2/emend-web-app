import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.whiteColor,
      child: SizedBox(
        height: context.mh * 0.9,
        width: context.mw * 0.30,
        // color: Colors.green,
        child: Column(
          children: [
            // Chat Messages Area
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(context.mw * 0.02),
                children: [
                  // Date Header
                  Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.mw * 0.02,
                        vertical: context.mh * 0.005,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "February 16th, 2021",
                        style: TextStyle(
                          fontSize: context.mh * 0.015,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: context.mh * 0.02),

                  // Received Message
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.only(bottom: context.mh * 0.01),
                      padding: EdgeInsets.symmetric(
                        horizontal: context.mw * 0.03,
                        vertical: context.mh * 0.015,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, I've been thinking about using Cuboid software for a while",
                            style: TextStyle(
                              fontSize: context.mh * 0.018,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: context.mh * 0.005),
                          Text(
                            "I just have a couple of questions to see if it's the right fit for us",
                            style: TextStyle(
                              fontSize: context.mh * 0.018,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: context.mh * 0.005),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "Today 11:52",
                              style: TextStyle(
                                fontSize: context.mh * 0.014,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Sent Message
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.only(bottom: context.mh * 0.01),
                      padding: EdgeInsets.symmetric(
                        horizontal: context.mw * 0.03,
                        vertical: context.mh * 0.015,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hey Donald, thanks for reaching out. Would love to set up some time to chat with you more about your needs. What's a good number to reach you at?",
                            style: TextStyle(
                              fontSize: context.mh * 0.018,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: context.mh * 0.005),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "Today 01:05",
                              style: TextStyle(
                                fontSize: context.mh * 0.014,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Input Box
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.mw * 0.02,
                vertical: context.mh * 0.01,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.grey.shade300),
                ),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Type your message...",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send, color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
