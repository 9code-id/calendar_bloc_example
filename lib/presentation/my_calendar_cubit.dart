import 'package:calendar_bloc_example/model/calendar_event.dart';
import 'package:calendar_bloc_example/presentation/my_calendar_state.dart';
import 'package:calendar_bloc_example/presentation/my_calendar_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCalendarCubit extends Cubit<MyCalendarState> {
  MyCalendarCubit()
      : super(MyCalendarState(
          events: [],
          selectedEvents: [],
        ));

  loadEvents() async {
    print("LoadEvents...");
    var events = await MyCalendarUseCase().getEvents();
    var newState = MyCalendarState(
      events: events,
      selectedEvents: state.selectedEvents,
    );
    emit(newState);
  }

  setSelectedEvents(List<CalendarEvent> _events) async {
    print("setSelectedEvents : ${_events.length}");
    var newState = MyCalendarState(
      events: state.events,
      selectedEvents: _events,
    );
    emit(newState);
  }

  addEvent(CalendarEvent event) async {
    print("addEvent...");
    var events = state.events;
    events.add(event);
    var newState = MyCalendarState(
      events: events,
      selectedEvents: state.selectedEvents,
    );
    emit(newState);
  }
}
