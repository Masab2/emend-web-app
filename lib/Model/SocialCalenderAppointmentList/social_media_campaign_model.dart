import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SocialMediaCampaignModel {
  static List<Appointment> getDataSource() {
    final List<Appointment> meetings = <Appointment>[];
    final DateTime today = DateTime.now();

    // First post on the same day
    final DateTime firstPostStartTime =
        DateTime(today.year, today.month, today.day, 9, 0);
    final DateTime firstPostEndTime =
        firstPostStartTime.add(const Duration(hours: 2));
    meetings.add(Appointment(
      startTime: firstPostStartTime,
      endTime: firstPostEndTime,
      subject: 'Development Meeting',
      color: Colors.blue,
    ));

    // Second post on the same day
    final DateTime secondPostStartTime =
        DateTime(today.year, today.month, today.day, 13, 0);
    final DateTime secondPostEndTime =
        secondPostStartTime.add(const Duration(hours: 1));
    meetings.add(Appointment(
      startTime: secondPostStartTime,
      endTime: secondPostEndTime,
      subject: 'Design Review',
      color: Colors.green,
    ));

    // Third post overlapping the first post on the same day
    final DateTime thirdPostStartTime =
        DateTime(today.year, today.month, today.day, 10, 0);
    final DateTime thirdPostEndTime =
        thirdPostStartTime.add(const Duration(hours: 1));
    meetings.add(Appointment(
      startTime: thirdPostStartTime,
      endTime: thirdPostEndTime,
      subject: 'Code Review',
      color: Colors.orange,
    ));

    // Additional posts for other days
    meetings.add(Appointment(
      startTime: firstPostStartTime.add(const Duration(days: 1)),
      endTime: firstPostEndTime.add(const Duration(days: 1)),
      subject: 'General Meeting',
      color: Colors.red,
    ));
    meetings.add(Appointment(
      startTime: firstPostStartTime.add(const Duration(days: 2)),
      endTime: firstPostEndTime.add(const Duration(days: 2)),
      subject: 'Plan Execution',
      color: Colors.deepPurple,
    ));

    return meetings;
  }
}
