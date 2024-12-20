// // ignore_for_file: prefer_typing_uninitialized_variables
// import 'package:emend_web_app/Controllers/createEmailController/create_email_controller.dart';
// import 'package:emend_web_app/config/Painter/painter.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:timelines/timelines.dart';

// const completeColor = Color(0xff5e6172);
// const inProgressColor = Color.fromARGB(255, 94, 160, 199);
// const todoColor = Color(0xffd1d2d7);

// class ProcessTimelineIndicator extends StatelessWidget {
//   ProcessTimelineIndicator({super.key});

//   final controller = Get.put(CreateEmailController());

//   Color getColor(int index, int processIndex) {
//     if (index == processIndex) {
//       return inProgressColor;
//     } else if (index < processIndex) {
//       return completeColor;
//     } else {
//       return todoColor;
//     }
//   }

//   final List<IconData> icons = [
//     Icons.data_array,
//     Icons.content_copy_outlined,
//     Icons.receipt,
//     Icons.send,
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Column(
//       children: [
//         SizedBox(
//           height: screenHeight * 0.2,
//           child: Obx(() {
//             int processIndex = controller.processIndex.value;
//             return Timeline.tileBuilder(
//               theme: TimelineThemeData(
//                 direction: Axis.horizontal,
//                 connectorTheme: ConnectorThemeData(
//                   space: screenWidth * 0.02,
//                   thickness: screenHeight * 0.005,
//                 ),
//               ),
//               builder: TimelineTileBuilder.connected(
//                 connectionDirection: ConnectionDirection.before,
//                 itemExtentBuilder: (_, __) =>
//                     screenWidth * 0.7 / controller.processes.length,
//                 oppositeContentsBuilder: (context, index) {
//                   return Padding(
//                     padding: EdgeInsets.only(bottom: screenHeight * 0.02),
//                     child: Icon(
//                       icons[index],
//                       size: screenHeight * 0.03,
//                     ),
//                   );
//                 },
//                 contentsBuilder: (context, index) {
//                   return Padding(
//                     padding: EdgeInsets.only(top: screenHeight * 0.02),
//                     child: Text(
//                       controller.processes[index],
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: getColor(index, processIndex),
//                         fontSize: screenHeight * 0.02,
//                       ),
//                     ),
//                   );
//                 },
//                 indicatorBuilder: (_, index) {
//                   var color;
//                   Widget? child;

//                   if (index == processIndex) {
//                     color = inProgressColor;
//                     child = const Icon(Icons.loop);
//                   } else if (index < processIndex) {
//                     color = completeColor;
//                     child = Icon(
//                       Icons.check,
//                       color: Colors.white,
//                       size: screenHeight * 0.02,
//                     );
//                   } else {
//                     color = todoColor;
//                   }

//                   if (index <= processIndex) {
//                     return Stack(
//                       children: [
//                         CustomPaint(
//                           size: Size(screenHeight * 0.05, screenHeight * 0.05),
//                           painter: BezierPainter(
//                             color: color,
//                             drawStart: index > 0,
//                             drawEnd: index < processIndex,
//                           ),
//                         ),
//                         DotIndicator(
//                           size: screenHeight * 0.05,
//                           color: color,
//                           child: child,
//                         ),
//                       ],
//                     );
//                   } else {
//                     return Stack(
//                       children: [
//                         CustomPaint(
//                           size: Size(screenHeight * 0.03, screenHeight * 0.03),
//                           painter: BezierPainter(
//                             color: color,
//                             drawEnd: index < controller.processes.length - 1,
//                           ),
//                         ),
//                         OutlinedDotIndicator(
//                           borderWidth: screenHeight * 0.004,
//                           color: color,
//                         ),
//                       ],
//                     );
//                   }
//                 },
//                 connectorBuilder: (_, index, type) {
//                   if (index > 0) {
//                     if (index == processIndex) {
//                       final prevColor = getColor(index - 1, processIndex);
//                       final color = getColor(index, processIndex);
//                       List<Color> gradientColors;
//                       if (type == ConnectorType.start) {
//                         gradientColors = [
//                           Color.lerp(prevColor, color, 0.5)!,
//                           color
//                         ];
//                       } else {
//                         gradientColors = [
//                           prevColor,
//                           Color.lerp(prevColor, color, 0.5)!
//                         ];
//                       }
//                       return DecoratedLineConnector(
//                         decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: gradientColors,
//                           ),
//                         ),
//                       );
//                     } else {
//                       return SolidLineConnector(
//                         color: getColor(index, processIndex),
//                       );
//                     }
//                   } else {
//                     return null;
//                   }
//                 },
//                 itemCount: controller.processes.length,
//               ),
//             );
//           }),
//         ),
       
//       ],
//     );
//   }
// }
