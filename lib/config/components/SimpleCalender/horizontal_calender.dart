import 'package:emend_web_app/config/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HorizontalCalendar extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final ValueChanged<DateTime> onDateChanged;

  const HorizontalCalendar({
    super.key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    required this.onDateChanged,
  });

  @override
  HorizontalCalendarState createState() => HorizontalCalendarState();
}

class HorizontalCalendarState extends State<HorizontalCalendar> {
  late DateTime _selectedDate;
  late DateTime _currentWeekStart;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _currentWeekStart = _getStartOfWeek(widget.initialDate);
  }

  DateTime _getStartOfWeek(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  @override
  Widget build(BuildContext context) {
    final dates = List.generate(
      7,
      (index) => _currentWeekStart.add(Duration(days: index)),
    );

    return Column(
      children: [
        SizedBox(
          // color: Colors.red,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _currentWeekStart.isAfter(widget.firstDate)
                    ? () {
                        setState(() {
                          _currentWeekStart = _currentWeekStart
                              .subtract(const Duration(days: 7));
                        });
                      }
                    : null,
              ),
              0.20.pw(context),
              Expanded(
                child: Center(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dates.length,
                    itemBuilder: (context, index) {
                      final date = dates[index];
                      final isSelected = date == _selectedDate;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDate = date;
                          });
                          widget.onDateChanged(date);
                        },
                        child: Container(
                          width: 70,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.blue : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat('EEE').format(date), // Day of week
                                style: TextStyle(
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                DateFormat('dd').format(date), // Day of month
                                style: TextStyle(
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: _currentWeekStart
                        .add(const Duration(days: 7))
                        .isBefore(widget.lastDate)
                    ? () {
                        setState(() {
                          _currentWeekStart =
                              _currentWeekStart.add(const Duration(days: 7));
                        });
                      }
                    : null,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
