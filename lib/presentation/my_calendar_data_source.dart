import 'package:calendar_bloc_example/model/calendar_event.dart';
import 'package:flutter/material.dart';

class MyCalendarDataSource {
  List<CalendarEvent> getEvents() {
    final List<CalendarEvent> calendarEvents = <CalendarEvent>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    calendarEvents.add(
      CalendarEvent(
        eventName: 'Conference',
        from: startTime,
        to: endTime,
        color: const Color(0xFF0F8644),
        isAllDay: false,
      ),
    );
    for (int i = 0; i < 10; i++) {
      List colors = [
        Colors.green,
        Colors.blue,
        Colors.purple,
        Colors.red,
        Colors.brown,
        Colors.grey,
      ];
      colors.shuffle();
      var randomColor = colors.first;
      final DateTime startTime =
          DateTime(today.year, today.month, today.day + i, 9);
      final DateTime endTime = startTime.add(const Duration(hours: 2));
      calendarEvents.add(
        CalendarEvent(
          eventName: 'Event ${i}',
          from: startTime,
          to: endTime,
          color: randomColor,
          isAllDay: false,
        ),
      );
    }
    return calendarEvents;
  }
}
