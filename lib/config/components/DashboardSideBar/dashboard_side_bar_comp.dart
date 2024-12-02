import 'package:emend_web_app/config/Color/app_color.dart';
import 'package:emend_web_app/config/extenshions/extenshion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardSideBarComp extends StatelessWidget {
  final String? title;
  final bool index;
  final VoidCallback ontap;
  final IconData icon;
  const DashboardSideBarComp(
      {super.key,
      required this.title,
      required this.index,
      required this.ontap,
      required this.icon});

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
          color: index == true
              ? AppColor.sideBarBoxSelectedColor
              : null,
          borderRadius: BorderRadius.circular(10),
        ),
        child: GestureDetector(
          onTap: ontap,
          child: Row(
            children: [
              Icon(
                icon,
                size: context.mh * 0.03,
                color:
                    index == true ? AppColor.primaryColor : Colors.black,
              ),
              if (title != null) ...[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: context.mw * 0.01),
                    child: Text(
                      title!,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.barlow(
                        fontSize: context.mw * 0.010,
                        color: index == true
                            ? AppColor.primaryColor
                            : Colors.black,
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
