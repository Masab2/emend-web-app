import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:emend_web_app/config/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PostImpressionCardWidget extends StatefulWidget {
  const PostImpressionCardWidget({super.key});

  @override
  PostImpressionCardWidgetState createState() =>
      PostImpressionCardWidgetState();
}

class PostImpressionCardWidgetState extends State<PostImpressionCardWidget> {
  // ScrollController for the horizontal scrolling
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.mh * 0.4,
      width: context.mw * 0.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.mw * 0.02,
          vertical: context.mh * 0.01,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Best Performing Posts",
              style: TextStyle(
                fontSize: context.mh * 0.016,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Quickly see which 4 posts have the best engagement from March 26 - April 26",
              style: TextStyle(
                fontSize: context.mh * 0.014,
               
                color: Colors.grey,
              ),
            ),
            0.02.ph(context),
            // Wrap the SingleChildScrollView with Scrollbar
            Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: context.mh * 0.02,
                ),
                child: SizedBox(
                  width: context.mw * 0.9,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: _scrollController,
                    child: const Row(
                      children: [
                        PostImpressionWidget(),
                        PostImpressionWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
