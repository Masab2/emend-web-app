import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';

class DashboardPostSummaryWidget extends StatelessWidget {
  const DashboardPostSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.whiteColor,
      child: SizedBox(
        height: context.mh * 0.42,
        child: Container(
          height: context.mh * 0.42,
          width: context.mw,
          padding: EdgeInsets.symmetric(
              horizontal: context.mw * 0.01, vertical: context.mh * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Post Summary',
                    style: TextStyle(
                      fontSize: context.mh * 0.018,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(Icons.more_horiz, color: Colors.grey),
                ],
              ),
              SizedBox(height: context.mh * 0.01),
              Text(
                'Total of likes & comments',
                style: TextStyle(
                  fontSize: context.mh * 0.017,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: context.mh * 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildCircularIndicator(
                    context: context,
                    color: Colors.redAccent,
                    value: 0.75, // 75% completion
                    label: '2.864',
                    subtitle: 'Likes',
                  ),
                  0.02.pw(context),
                  _buildCircularIndicator(
                    context: context,
                    color: Colors.blueAccent,
                    value: 0.4, // 40% completion
                    label: '624',
                    subtitle: 'Comments',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircularIndicator({
    required BuildContext context,
    required Color color,
    required double value,
    required String label,
    required String subtitle,
  }) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: context.mw * 0.04,
              height: context.mw * 0.04,
              child: CircularProgressIndicator(
                value: value,
                color: color,
                backgroundColor: color.withValues(alpha: 0.2),
                strokeWidth: 5,
              ),
            ),
            Text(
              '${(value * 100).toStringAsFixed(0)}%',
              style: TextStyle(
                fontSize: context.mh * 0.012,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: context.mh * 0.01),
        Text(
          label,
          style: TextStyle(
            fontSize: context.mh * 0.017,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: context.mh * 0.013,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
