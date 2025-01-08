import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ReportsListWidget extends StatelessWidget {
  const ReportsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.mw * 0.02),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        color: AppColor.whiteColor,
        child: Padding(
          padding: EdgeInsets.all(context.mw * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Reports Overview',
                    style: TextStyle(
                      fontSize: context.mh * 0.022,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[800],
                    ),
                  ),
                ],
              ),
      
              SizedBox(height: context.mh * 0.02),
      
              // Table Header
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: context.mh * 0.012,
                  horizontal: context.mw * 0.01,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  border: Border(
                    bottom: BorderSide(color: Colors.grey[200]!),
                  ),
                ),
                child: Row(
                  children: [
                    _buildHeaderCell(context, "Name", 0.18),
                    _buildHeaderCell(context, "User ID", 0.10),
                    _buildHeaderCell(context, "Opens", 0.10),
                    _buildHeaderCell(context, "Date", 0.10),
                    _buildHeaderCell(context, "Clicks", 0.10),
                    _buildHeaderCell(context, "Actions", 0.13),
                  ],
                ),
              ),
      
              // Table Content
              SizedBox(
                height: context.mh * 0.5,
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey[100]!),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: context.mh * 0.012,
                          horizontal: context.mw * 0.01,
                        ),
                        child: Row(
                          children: [
                            _buildUserCell(context, "Victoria Perez", 0.18),
                            _buildDataCell(context, "LA-0234", 0.10),
                            _buildMetricCell(context, "24", "+12%", 0.10),
                            _buildDataCell(context, "30 Apr, 2017", 0.10),
                            _buildMetricCell(context, "156", "+8%", 0.10),
                            _buildActionsCell(context, 0.13),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCell(BuildContext context, String text, double width) {
    return SizedBox(
      width: context.mw * width,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontSize: context.mh * 0.014,
          fontWeight: FontWeight.w600,
          color: Colors.grey[700],
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _buildUserCell(BuildContext context, String name, double width) {
    return SizedBox(
      width: context.mw * width,
      child: Row(
        children: [
          Container(
            width: context.mw * 0.025,
            height: context.mw * 0.025,
            decoration: BoxDecoration(
              color: AppColor.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                name[0],
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: context.mh * 0.012,
                ),
              ),
            ),
          ),
          SizedBox(width: context.mw * 0.01),
          Text(
            name,
            style: TextStyle(
              fontSize: context.mh * 0.014,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataCell(BuildContext context, String text, double width) {
    return SizedBox(
      width: context.mw * width,
      child: Text(
        text,
        style: TextStyle(
          fontSize: context.mh * 0.014,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _buildMetricCell(
      BuildContext context, String value, String change, double width) {
    return SizedBox(
      width: context.mw * width,
      child: Row(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: context.mh * 0.014,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
          
        ],
      ),
    );
  }

  Widget _buildActionsCell(BuildContext context, double width) {
    return SizedBox(
      width: context.mw * width,
      child: Row(
        children: [
          _buildActionButton(
            context,
            IconlyLight.edit_square,
            AppColor.primaryColor.withOpacity(0.1),
            AppColor.primaryColor,
          ),
          SizedBox(width: context.mw * 0.01),
          _buildActionButton(
            context,
            IconlyLight.delete,
            Colors.red[50]!,
            Colors.red,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    IconData icon,
    Color backgroundColor,
    Color iconColor,
  ) {
    return Container(
      width: context.mw * 0.028,
      height: context.mw * 0.028,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(
        icon,
        size: context.mh * 0.018,
        color: iconColor,
      ),
    );
  }
}
