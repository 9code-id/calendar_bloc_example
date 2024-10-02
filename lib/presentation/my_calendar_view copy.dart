// // ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

// import 'package:calendar_bloc_example/global/datasource/syncfusion/syncfusion_calendar_event_datasource.dart';
// import 'package:calendar_bloc_example/model/calendar_event.dart';
// import 'package:calendar_bloc_example/presentation/my_calendar_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';

// class MyCalendarView extends StatefulWidget {
//   const MyCalendarView({Key? key}) : super(key: key);
//   @override
//   _MyCalendarViewState createState() => _MyCalendarViewState();
// }

// class _MyCalendarViewState extends State<MyCalendarView> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => MyCalendarCubit(),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Jadwal Kerja"),
//         ),
//         floatingActionButton: FloatingActionButton(
//           child: const Icon(Icons.add),
//           onPressed: () {
//             //
//           },
//         ),
//         body: Builder(builder: (context) {
//           var cubit = context.read<MyCalendarCubit>();
//           return Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: SfCalendar(
//                     view: CalendarView.month,
//                     dataSource:
//                         SyncfusionCalendarEventDataSource(_getDataSource()),
//                     monthViewSettings: const MonthViewSettings(
//                       appointmentDisplayMode:
//                           MonthAppointmentDisplayMode.appointment,
//                     ),
//                     onTap: (CalendarTapDetails details) {
//                       if (details.targetElement ==
//                           CalendarElement.calendarCell) {
//                         cubit.setSelectedEvents(
//                             _getEventsForDate(details.date!));
//                       }
//                     },
//                   ),
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cubit.state.events.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       var item = cubit.state.events[index];
//                       return Container(
//                         padding: EdgeInsets.all(8.0),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               width: 42,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: index > 0
//                                     ? []
//                                     : [
//                                         Icon(
//                                           Icons.calendar_month,
//                                           size: 24.0,
//                                           color: index > 0
//                                               ? Colors.transparent
//                                               : null,
//                                         ),
//                                         const SizedBox(
//                                           height: 2.0,
//                                         ),
//                                         Text(
//                                           "${DateFormat("d MMM").format(item.from)}",
//                                           style: TextStyle(
//                                             fontSize: 14.0,
//                                           ),
//                                         ),
//                                       ],
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 12.0,
//                             ),
//                             Container(
//                               height: 42,
//                               width: 4,
//                               decoration: BoxDecoration(
//                                 color: item.color,
//                                 borderRadius: BorderRadius.all(
//                                   Radius.circular(12.0),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               width: 6.0,
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   item.eventName,
//                                   style: TextStyle(
//                                     fontSize: 16.0,
//                                   ),
//                                 ),
//                                 Text(
//                                   '${DateFormat("kk:mm").format(item.from)} - ${DateFormat("kk:mm").format(item.to)}',
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }),
//       ),
//     );
//   }

//   List<CalendarEvent> _getDataSource() {
//     final List<CalendarEvent> calendarEvents = <CalendarEvent>[];
//     final DateTime today = DateTime.now();
//     final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
//     final DateTime endTime = startTime.add(const Duration(hours: 2));
//     calendarEvents.add(
//       CalendarEvent(
//         eventName: 'Conference',
//         from: startTime,
//         to: endTime,
//         color: const Color(0xFF0F8644),
//         isAllDay: false,
//       ),
//     );
//     for (int i = 0; i < 10; i++) {
//       List colors = [
//         Colors.green,
//         Colors.blue,
//         Colors.purple,
//         Colors.red,
//         Colors.brown,
//         Colors.grey,
//       ];
//       colors.shuffle();
//       var randomColor = colors.first;
//       final DateTime startTime =
//           DateTime(today.year, today.month, today.day + i, 9);
//       final DateTime endTime = startTime.add(const Duration(hours: 2));
//       calendarEvents.add(
//         CalendarEvent(
//           eventName: 'Event ${i}',
//           from: startTime,
//           to: endTime,
//           color: randomColor,
//           isAllDay: false,
//         ),
//       );
//     }
//     return calendarEvents;
//   }

//   List<CalendarEvent> _getEventsForDate(DateTime date) {
//     return _getDataSource().where((event) {
//       final eventDate = DateTime(
//         event.from.year,
//         event.from.month,
//         event.from.day,
//       );
//       return eventDate.isAtSameMomentAs(date);
//     }).toList();
//   }
// }
