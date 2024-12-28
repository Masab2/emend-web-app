import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ReportsUserSearchWidget extends StatelessWidget {
  const ReportsUserSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.mw * 0.01),
      child: Row(
        children: [
          0.01.pw(context),
          Expanded(
            child: Container(
              height: context.mh * 0.06,
              padding: EdgeInsets.symmetric(horizontal: context.mw * 0.01),
              decoration: BoxDecoration(
                  color: Colors.grey.withValues(alpha: 0.23),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Search User",
                  hintStyle: TextStyle(
                    fontSize: context.mh * 0.020,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: context.mh * 0.01,
                    horizontal: context.mw * 0.01,
                  ),
                  prefixIcon: const Icon(IconlyLight.search),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          0.02.pw(context),
          MaterialButton(
            color: Colors.green,
            minWidth: context.mw * 0.08,
            height: context.mh * 0.06,
            onPressed: () {},
            child: Text(
              "Add User",
              style: TextStyle(
                fontSize: context.mh * 0.020,
                color: AppColor.whiteColor,
              ),
            ),
          ),
          0.01.pw(context),
          Row(
            children: [
              Text(
                "Sort By",
                style: TextStyle(
                  fontSize: context.mh * 0.020,
                ),
              ),
              const Icon(Icons.arrow_drop_down)
            ],
          ),
          0.01.pw(context),
          Container(
            height: context.mw * 0.03,
            width: context.mw * 0.03,
            decoration: BoxDecoration(
              color: AppColor.notificationBackgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(IconlyBold.filter),
          ),
        ],
      ),
    );
  }
}
