import 'package:flutter/material.dart';

class SimpleCalendar extends StatelessWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final ValueChanged<DateTime> onDateChanged;

  const SimpleCalendar({
    Key? key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onDateChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker(
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      onDateChanged: onDateChanged,
    );
  }
}
