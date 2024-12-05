import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SocialCalendarView extends StatelessWidget {
  const SocialCalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white, // Background color of the calendar
      child: SfCalendar(
        view: CalendarView.week,
        timeSlotViewSettings: const TimeSlotViewSettings(
          timeInterval: Duration(hours: 24),
          timeFormat: '',
          dateFormat: 'EEE',
          timeTextStyle: TextStyle(color: Colors.transparent),
          timelineAppointmentHeight: 50,
        ),
        headerStyle: const CalendarHeaderStyle(
          textAlign: TextAlign.center,
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        todayHighlightColor: Colors.transparent,
        cellBorderColor: Colors.grey.withOpacity(0.3),
        appointmentBuilder: (context, details) {
          // Ensure that appointments are accessed properly
          final appointmentsList = details.appointments.toList();
          return Container(
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              appointmentsList[0].subject, // Accessing the first appointment's subject
              style: const TextStyle(fontSize: 14, color: Colors.black),
            ),
          );
        },
        dataSource: SocialCalendarDataSource(_getAppointments()),
      ),
    );
  }

  // Example appointments
  List<Appointment> _getAppointments() {
    return <Appointment>[
      Appointment(
        startTime: DateTime.now(),
        endTime: DateTime.now().add(const Duration(hours: 1)),
        subject: 'Coffee with Sarah',
        color: Colors.lightGreenAccent,
        isAllDay: true,
      ),
      Appointment(
        startTime: DateTime.now().add(const Duration(days: 1)),
        endTime: DateTime.now().add(const Duration(days: 1, hours: 1)),
        subject: 'Lunch Meeting',
        color: Colors.blueAccent,
        isAllDay: true, 
      ),
      Appointment(
        startTime: DateTime.now().add(const Duration(days: 2)),
        endTime: DateTime.now().add(const Duration(days: 2, hours: 2)),
        subject: 'Holiday Event',
        color: Colors.redAccent,
        isAllDay: true,
      ),
    ];
  }
}

// Custom data source for appointments
class SocialCalendarDataSource extends CalendarDataSource {
  SocialCalendarDataSource(List<Appointment> source) {
    appointments = source;
  }
}
