import 'package:calendar_bloc_example/model/calendar_event.dart';

class MyCalendarState {
  List<CalendarEvent> events;
  List<CalendarEvent> selectedEvents;
  MyCalendarState({
    required this.events,
    required this.selectedEvents,
  });
}
