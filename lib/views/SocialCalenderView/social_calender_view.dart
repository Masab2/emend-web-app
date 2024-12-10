import 'package:emend_web_app/Controllers/controller.dart';
import 'package:emend_web_app/Model/EmailCompaignModel/SocialCalenderAppoinmentList/social_media_compaign_model.dart';
import 'package:emend_web_app/views/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../config/utils/Dialog/add_post_dialog.dart';

class SocialCalendarView extends StatelessWidget {
  const SocialCalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    final socialController = Get.put(SocialCalenderController());

    AddPostDialog dialog = AddPostDialog();

    return Obx(() {
      return socialController.showaddPostView.value == false
          ? SfCalendar(
              view: CalendarView.month,
              initialDisplayDate: DateTime.now(),
              allowedViews: const [
                CalendarView.day,
                CalendarView.week,
                CalendarView.workWeek,
                CalendarView.month,
                CalendarView.timelineDay,
                CalendarView.timelineWeek,
                CalendarView.timelineWorkWeek,
              ],
              monthViewSettings: const MonthViewSettings(
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                showAgenda: false,
              ),
              dataSource:
                  MeetingDataSource(SocialMediaCompaignModel.getDataSource()),
              onTap: (CalendarTapDetails details) {
                if (details.targetElement == CalendarElement.calendarCell) {
                  final List<Appointment> appointments =
                      details.appointments?.cast<Appointment>() ?? [];

                  if (appointments.isNotEmpty) {
                    // _showPostOptionsDialog(context, appointments);
                  } else {
                    dialog.showAddPostDialog(context);
                  }
                }
              },
            )
          : const AddPostView();
    });
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
