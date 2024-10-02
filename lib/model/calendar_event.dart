import 'package:flutter/material.dart';

class CalendarEvent {
  CalendarEvent({
    required this.eventName,
    required this.from,
    required this.to,
    required this.color,
    required this.isAllDay,
  });

  String eventName;
  DateTime from;
  DateTime to;
  Color color;
  bool isAllDay;
}
