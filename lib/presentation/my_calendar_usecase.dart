import 'package:calendar_bloc_example/core.dart';
import 'package:calendar_bloc_example/model/calendar_event.dart';

class MyCalendarUseCase {
  Future<List<CalendarEvent>> getEvents() async {
    return await MyCalendarRepository().getEvents();
  }
}
