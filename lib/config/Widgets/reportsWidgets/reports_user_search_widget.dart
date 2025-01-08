import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ReportsUserSearchWidget extends StatelessWidget {
  const ReportsUserSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.mw * 0.02,
        vertical: context.mh * 0.02,
      ),
      child: Row(
        children: [
          // Search Bar
          Expanded(
            child: Container(
              height: context.mh * 0.06,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Colors.grey.shade200,
                  width: 1,
                ),
              ),
              child: TextFormField(
                style: TextStyle(
                  fontSize: context.mh * 0.015,
                  color: Colors.grey[800],
                ),
                decoration: InputDecoration(
                  hintText: "Search reports...",
                  hintStyle: TextStyle(
                    fontSize: context.mh * 0.015,
                    color: Colors.grey[500],
                  ),
                  prefixIcon: Icon(
                    IconlyLight.search,
                    size: context.mh * 0.022,
                    color: Colors.grey[600],
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: context.mh * 0.012,
                    horizontal: context.mw * 0.01,
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),

          0.015.pw(context),
          _buildSortButton(context),
          0.015.pw(context),
          _buildFilterButton(context),
        ],
      ),
    );
  }

  Widget _buildSortButton(BuildContext context) {
    return Container(
      height: context.mh * 0.06,
      padding: EdgeInsets.symmetric(horizontal: context.mw * 0.012),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            IconlyLight.category,
            size: context.mh * 0.02,
            color: AppColor.primaryColor
          ),
          SizedBox(width: context.mw * 0.005),
          Text(
            "Sort",
            style: TextStyle(
              fontSize: context.mh * 0.015,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            size: context.mh * 0.02,
            color: Colors.grey[700],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(BuildContext context) {
    return Container(
      height: context.mh * 0.06,
      padding: EdgeInsets.symmetric(horizontal: context.mw * 0.012),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            IconlyLight.filter,
            size: context.mh * 0.02,
            color: AppColor.primaryColor
          ),
          SizedBox(width: context.mw * 0.005),
          Text(
            "Filters",
            style: TextStyle(
              fontSize: context.mh * 0.015,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
