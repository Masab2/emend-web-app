import 'package:emend_web_app/config/color/app_color.dart';
import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';

class DashboardSideBarComp extends StatelessWidget {
  final String? title;
  final bool index;
  final VoidCallback onTap;
  final IconData icon;
  const DashboardSideBarComp({
    super.key,
    required this.title,
    required this.index,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: title == null ? context.mw * 0.003 : context.mw * 0.003),
      child: Container(
        height: context.mh * 0.06,
        padding: EdgeInsets.symmetric(horizontal: context.mw * 0.01),
        margin: EdgeInsets.only(bottom: context.mh * 0.01),
        decoration: BoxDecoration(
          color: index == true ? AppColor.primaryColor : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              Icon(
                icon,
                size: context.mh * 0.024,
                color: index == true ? AppColor.whiteColor : Colors.black,
              ),
              if (title != null) ...[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: context.mw * 0.01),
                    child: Text(
                      title!,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: context.mh * 0.020,
                        color:
                            index == true ? AppColor.whiteColor : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
