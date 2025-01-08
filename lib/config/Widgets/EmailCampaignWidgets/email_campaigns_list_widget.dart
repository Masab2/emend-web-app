import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';

class EmailCampaignsListWidget extends StatelessWidget {
  const EmailCampaignsListWidget({super.key});

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
                      'Previous Campaigns',
                      style: TextStyle(
                        fontSize: context.mh * 0.022,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: context.mh * 0.005),
                    Text(
                      'Overview of your email campaign history',
                      style: TextStyle(
                        fontSize: context.mh * 0.014,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

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

          SizedBox(
            height: context.mh * 0.4,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 10,
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
      {'width': 0.05, 'text': 'ID'},
      {'width': 0.13, 'text': 'NAME'},
      {'width': 0.09, 'text': 'RECIPIENTS'},
      {'width': 0.09, 'text': 'OPENS'},
      {'width': 0.09, 'text': 'CLICKS'},
      {'width': 0.09, 'text': 'UNSUBSCRIBED'},
      {'width': 0.09, 'text': 'SEND DATE'},
      {'width': 0.12, 'text': 'ACTIONS'},
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
          SizedBox(
            width: context.mw * 0.05,
            child: Text(
              '#0001',
              style: TextStyle(
                fontSize: context.mh * 0.014,
                color: Colors.grey[800],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            width: context.mw * 0.13,
            child: Text(
              'Sept 2021 Deliverability',
              style: TextStyle(
                fontSize: context.mh * 0.014,
                color: AppColor.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          _buildMetric(context, '73/100', 0.09),
          _buildMetric(context, '1.39%', 0.09, isPositive: true),
          _buildMetric(context, '1.39%', 0.09, isPositive: true),
          _buildMetric(context, '0', 0.09),
          SizedBox(
            width: context.mw * 0.09,
            child: Text(
              '02 Sep, 2021',
              style: TextStyle(
                fontSize: context.mh * 0.014,
                color: Colors.grey[600],
              ),
            ),
          ),
          SizedBox(
            width: context.mw * 0.12,
            child: Row(
              children: [
                _buildActionButton(
                  context,
                  'Reports',
                  AppColor.primaryColor,
                  Colors.white,
                  () {},
                ),
                SizedBox(width: context.mw * 0.01),
                _buildActionButton(
                  context,
                  'Preview',
                  Colors.grey[50]!,
                  Colors.grey[700]!,
                  () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetric(BuildContext context, String value, double width,
      {bool isPositive = false}) {
    return SizedBox(
      width: context.mw * width,
      child: Row(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: context.mh * 0.014,
              color: isPositive ? Colors.green[700] : Colors.grey[800],
              fontWeight: FontWeight.w500,
            ),
          ),
          if (isPositive) ...[
            SizedBox(width: context.mw * 0.005),
            Icon(
              Icons.trending_up,
              size: context.mh * 0.016,
              color: Colors.green[700],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String label,
    Color bgColor,
    Color textColor,
    VoidCallback onPressed,
  ) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: bgColor,
        padding: EdgeInsets.symmetric(
          horizontal: context.mw * 0.01,
          vertical: context.mh * 0.008,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: context.mh * 0.013,
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
