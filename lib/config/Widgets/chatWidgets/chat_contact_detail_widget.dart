import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';

class ChatContactDetailWidget extends StatelessWidget {
  const ChatContactDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.whiteColor,
      child: Container(
        height: context.mh * 0.9,
        width: context.mw * 0.2,
        padding: EdgeInsets.all(context.mw * 0.01),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: context.mw * 0.04,
                      backgroundColor: Colors.red.shade300,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: context.mw * 0.05,
                      ),
                    ),
                    SizedBox(height: context.mh * 0.01),
                    Text(
                      "Donald Bryant",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.mh * 0.02,
                      ),
                    ),
                    SizedBox(height: context.mh * 0.005),
                    Text(
                      "640 N Plymouth, ID",
                      style: TextStyle(
                        fontSize: context.mh * 0.016,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: context.mh * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.phone, color: Colors.grey),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.mail, color: Colors.grey),
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.add, size: context.mh * 0.018),
                      label: const Text("Create deal"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                        foregroundColor: Colors.black,
                        textStyle: TextStyle(fontSize: context.mh * 0.016),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.grey.shade300, thickness: 1),
              SizedBox(height: context.mh * 0.01),

              // About Section
              ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                expandedAlignment: Alignment.topLeft,
                childrenPadding:
                    EdgeInsets.symmetric(horizontal: context.mw * 0.01),
                title: Text(
                  "About",
                  style: TextStyle(
                    fontSize: context.mh * 0.018,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailRow("First Name", "Donald", context),
                      _buildDetailRow("Last Name", "Bryant", context),
                      _buildDetailRow("Email", "donaldbry@gmail.com", context),
                      _buildDetailRow("Phone", "(204) 181-2406", context),
                      _buildDetailRow("Lifecycle State", "Customer", context),
                      _buildDetailRow(
                          "Became a Lead Date", "09/12/2019 6:29 PM", context),
                    ],
                  )
                ],
              ),
              Divider(color: Colors.grey.shade300, thickness: 1),
              SizedBox(height: context.mh * 0.01),

              // Conversation Details Section
              ExpansionTile(
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                expandedAlignment: Alignment.topLeft,
                childrenPadding:
                    EdgeInsets.symmetric(horizontal: context.mw * 0.01),
                title: Text(
                  "Conversation Details",
                  style: TextStyle(
                    fontSize: context.mh * 0.018,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailRow(
                          "Created Date", "June 22, 2021, 11:32am", context),
                      _buildDetailRow("Channel", "Twitter", context),
                      _buildDetailRow(
                          "Source", "Twitter/@eurekodesign", context),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.mh * 0.005),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: context.mh * 0.015,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: context.mh * 0.003),
          Text(
            value,
            style: TextStyle(
              fontSize: context.mh * 0.017,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
