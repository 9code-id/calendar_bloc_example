import 'package:calendar_bloc_example/model/calendar_event.dart';
import 'package:calendar_bloc_example/presentation/my_calendar_data_source.dart';

class MyCalendarRepository {
  Future<List<CalendarEvent>> getEvents() async {
    return MyCalendarDataSource().getEvents();
  }
}
