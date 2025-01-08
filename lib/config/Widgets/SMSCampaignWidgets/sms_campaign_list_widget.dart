import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';

class SmsCampaignsListWidget extends StatelessWidget {
  const SmsCampaignsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Padding(
            padding: EdgeInsets.all(context.mw * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SMS Campaigns',
                      style: TextStyle(
                        fontSize: context.mh * 0.018,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: context.mh * 0.005),
                    Text(
                      'Overview of your SMS campaign history',
                      style: TextStyle(
                        fontSize: context.mh * 0.014,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    _buildFilterButton(context),
                  ],
                ),
              ],
            ),
          ),

          // Table Header
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.mw * 0.02,
              vertical: context.mh * 0.015,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              border: Border(
                top: BorderSide(color: Colors.grey[200]!),
                bottom: BorderSide(color: Colors.grey[200]!),
              ),
            ),
            child: Row(
              children: _buildHeaderItems(context),
            ),
          ),

          // Table Content
          SizedBox(
            height: context.mh * 0.4,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 10, // Replace with your actual data length
              separatorBuilder: (context, index) => Divider(
                height: 1,
                color: Colors.grey[200],
              ),
              itemBuilder: (context, index) => _buildTableRow(context),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildHeaderItems(BuildContext context) {
    final headers = [
      {'width': 0.22, 'text': 'NAME'},
      {'width': 0.10, 'text': 'LIST'},
      {'width': 0.10, 'text': 'CONTACTS'},
      {'width': 0.10, 'text': 'CREATOR'},
      {'width': 0.10, 'text': 'SEND DATE'},
      {'width': 0.10, 'text': 'STATUS'},
    ];

    return headers
        .map((header) => SizedBox(
              width: context.mw * (header['width'] as double),
              child: Text(
                header['text'] as String,
                style: TextStyle(
                  fontSize: context.mh * 0.014,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                  letterSpacing: 0.5,
                ),
              ),
            ))
        .toList();
  }

  Widget _buildTableRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.mw * 0.02,
        vertical: context.mh * 0.015,
      ),
      child: Row(
        children: [
          _buildCell(context, 'Marketing Campaign', 0.22, isPrimary: true),
          _buildCell(context, 'Customer List A', 0.10),
          _buildCell(context, '133 Contacts', 0.10),
          _buildCell(context, 'Syed Zain', 0.10),
          _buildCell(context, '15 Jan, 2024', 0.10),
          SizedBox(
            width: context.mw * 0.10,
            child: _buildStatusBadge(context, 'Active'),
          ),
        ],
      ),
    );
  }

  Widget _buildCell(BuildContext context, String text, double width,
      {bool isPrimary = false}) {
    return SizedBox(
      width: context.mw * width,
      child: Text(
        text,
        style: TextStyle(
          fontSize: context.mh * 0.014,
          color: isPrimary ? AppColor.primaryColor : Colors.grey[800],
          fontWeight: isPrimary ? FontWeight.w500 : FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context, String status) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.mw * 0.01,
        vertical: context.mh * 0.006,
      ),
      decoration: BoxDecoration(
        color: status == 'Active' ? Colors.green[50] : Colors.grey[100],
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: status == 'Active' ? Colors.green[400]! : Colors.grey[400]!,
          width: 1,
        ),
      ),
      child: Text(
        status,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: context.mh * 0.013,
          color: status == 'Active' ? Colors.green[700] : Colors.grey[700],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildFilterButton(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(
        Icons.filter_list,
        size: context.mh * 0.02,
        color: Colors.grey[700],
      ),
      label: Text(
        'Filter',
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: context.mh * 0.014,
        ),
      ),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: context.mw * 0.015,
          vertical: context.mh * 0.012,
        ),
        side: BorderSide(color: Colors.grey[300]!),
      ),
    );
  }
}
