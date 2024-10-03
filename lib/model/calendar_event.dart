import 'package:flutter/material.dart';

class CalendarEvent {
  CalendarEvent({
    required this.eventName,
    required this.from,
    required this.to,
    required this.color,
    required this.isAllDay,
    this.pic,
    this.location,
  });

  String eventName;
  DateTime from;
  DateTime to;
  Color color;
  bool isAllDay;

  String? pic;
  String? location;
}
