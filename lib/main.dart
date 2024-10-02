import 'package:calendar_bloc_example/core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  return runApp(const CalendarApp());
}

class CalendarApp extends StatelessWidget {
  const CalendarApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar Demo',
      navigatorKey: Get.navigatorKey,
      home: MyCalendarView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
