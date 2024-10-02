import 'package:calendar_bloc_example/model/calendar_event.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class SyncfusionCalendarEventDataSource extends CalendarDataSource {
  SyncfusionCalendarEventDataSource(List<CalendarEvent> source) {
    appointments = source;
  }
  @override
  DateTime getStartTime(int index) {
    return getCalendarEventData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return getCalendarEventData(index).to;
  }

  @override
  String getSubject(int index) {
    return getCalendarEventData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return getCalendarEventData(index).color;
  }

  @override
  bool isAllDay(int index) {
    return getCalendarEventData(index).isAllDay;
  }

  CalendarEvent getCalendarEventData(int index) {
    final dynamic calendarEvent = appointments![index];
    late final CalendarEvent calendarEventData;
    if (calendarEvent is CalendarEvent) {
      calendarEventData = calendarEvent;
    }
    return calendarEventData;
  }
}
