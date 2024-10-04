// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:calendar_bloc_example/core.dart';
import 'package:calendar_bloc_example/global/datasource/syncfusion/syncfusion_calendar_event_datasource.dart';
import 'package:calendar_bloc_example/model/calendar_event.dart';
import 'package:calendar_bloc_example/presentation/my_calendar_cubit.dart';
import 'package:calendar_bloc_example/presentation/my_calendar_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MyCalendarView extends StatefulWidget {
  const MyCalendarView({Key? key}) : super(key: key);
  @override
  _MyCalendarViewState createState() => _MyCalendarViewState();
}

class _MyCalendarViewState extends State<MyCalendarView> {
  MyCalendarCubit cubit = MyCalendarCubit();
  @override
  void initState() {
    super.initState();
    GetIt.I.registerSingleton(cubit);
    cubit.loadEvents();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Jadwal Kerja"),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyCalendarFormView()),
            );
          },
        ),
        body: BlocBuilder<MyCalendarCubit, MyCalendarState>(
            builder: (context, child) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: SfCalendar(
                    view: CalendarView.month,
                    dataSource:
                        SyncfusionCalendarEventDataSource(cubit.state.events),
                    monthViewSettings: const MonthViewSettings(
                      appointmentDisplayMode:
                          MonthAppointmentDisplayMode.appointment,
                    ),
                    onTap: (CalendarTapDetails details) {
                      if (details.targetElement ==
                          CalendarElement.calendarCell) {
                        cubit.setSelectedEvents(
                            _getEventsForDate(details.date!));
                      }
                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.state.selectedEvents.length,
                    itemBuilder: (BuildContext context, int index) {
                      var item = cubit.state.selectedEvents[index];
                      return Container(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 42,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: index > 0
                                    ? []
                                    : [
                                        Icon(
                                          Icons.calendar_month,
                                          size: 24.0,
                                          color: index > 0
                                              ? Colors.transparent
                                              : null,
                                        ),
                                        const SizedBox(
                                          height: 2.0,
                                        ),
                                        Text(
                                          "${DateFormat("d MMM").format(item.from)}",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                          ),
                                        ),
                                      ],
                              ),
                            ),
                            const SizedBox(
                              width: 12.0,
                            ),
                            Container(
                              height: 42,
                              width: 4,
                              decoration: BoxDecoration(
                                color: item.color,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.eventName,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  '${DateFormat("kk:mm").format(item.from)} - ${DateFormat("kk:mm").format(item.to)}',
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  List<CalendarEvent> _getEventsForDate(DateTime date) {
    return cubit.state.events.where((event) {
      final eventDate = DateTime(
        event.from.year,
        event.from.month,
        event.from.day,
      );
      return eventDate.isAtSameMomentAs(date);
    }).toList();
  }
}
