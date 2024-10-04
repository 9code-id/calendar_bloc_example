// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:calendar_bloc_example/core.dart';
import 'package:calendar_bloc_example/global/datasource/syncfusion/syncfusion_calendar_event_datasource.dart';
import 'package:calendar_bloc_example/global/widget/button.dart';
import 'package:calendar_bloc_example/global/widget/timepicker.dart';
import 'package:calendar_bloc_example/model/calendar_event.dart';
import 'package:calendar_bloc_example/presentation/my_calendar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MyCalendarFormView extends StatefulWidget {
  const MyCalendarFormView({Key? key}) : super(key: key);
  @override
  _MyCalendarFormViewState createState() => _MyCalendarFormViewState();
}

class _MyCalendarFormViewState extends State<MyCalendarFormView> {
  MyCalendarCubit cubit = GetIt.I<MyCalendarCubit>();
  String title = "";
  DateTime date = DateTime.now();
  TimeOfDay from = TimeOfDay(hour: 0, minute: 0);
  TimeOfDay to = TimeOfDay(hour: 0, minute: 0);
  String pic = "";
  String location = "";

  save() async {
    await cubit.addEvent(
      CalendarEvent(
        eventName: title,
        from: DateTime(
          date.year,
          date.month,
          date.day,
          from.hour,
          from.minute,
        ),
        to: DateTime(
          date.year,
          date.month,
          date.day,
          to.hour,
          to.minute,
        ),
        color: Colors.green,
        isAllDay: false,
        pic: pic,
        location: location,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Jadwal"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            QTextField(
              label: "Title",
              value: title,
              onChanged: (value) {
                title = value;
              },
            ),
            QDatePicker(
              label: "Date",
              value: date,
              onChanged: (value) {
                print("value: $value");
                date = value;
              },
            ),
            Row(
              children: [
                Expanded(
                  child: QTimePicker(
                    label: "From",
                    onChanged: (value) {
                      from = value!;
                    },
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Expanded(
                  child: QTimePicker(
                    label: "To",
                    onChanged: (value) {
                      to = value!;
                    },
                  ),
                ),
              ],
            ),
            QDatePicker(
              label: "Date",
              value: date,
              onChanged: (value) {
                print("value: $value");
                date = value;
              },
            ),
            QDropdownField(
              label: "PIC",
              items: const [
                {
                  "label": "Andre",
                  "value": "Andre",
                },
                {
                  "label": "Rian",
                  "value": "Rian",
                },
                {
                  "label": "Saka",
                  "value": "Saka",
                }
              ],
              value: pic,
              onChanged: (value, label) {
                pic = value;
              },
            ),
            QDropdownField(
              label: "Location",
              items: const [
                {
                  "label": "Cafee",
                  "value": "Cafee",
                },
                {
                  "label": "Kitchen",
                  "value": "Kitchen",
                },
                {
                  "label": "Office",
                  "value": "Office",
                }
              ],
              value: location,
              onChanged: (value, label) {
                location = value;
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12.0),
        child: QButton(
          label: "Save",
          color: Colors.grey[900],
          onPressed: () => save(),
        ),
      ),
    );
  }
}
