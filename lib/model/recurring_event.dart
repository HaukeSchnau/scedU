import 'package:mobx/mobx.dart';
import 'package:scedu/model/activity.dart';
import '../gen/basic_recurring_event.dart';
import '../model/recurring_time.dart';
import '../model/location.dart';
import '../model/cortex.dart';
import 'package:uuid/uuid.dart';

part 'recurring_event.g.dart';

class RecurringEvent = _RecurringEvent with _$RecurringEvent;

abstract class _RecurringEvent extends BasicRecurringEvent with Store {
  _RecurringEvent(
      {required ObservableList<RecurringTime> times,
      required String name,
      String? description,
      Location? location,
      Cortex? category,
      required bool flexible,
      required String id})
      : super(
            times: times,
            name: name,
            description: description,
            location: location,
            category: category,
            id: id,
            flexible: flexible);

  // ignore: unused_element
  _RecurringEvent.fromJson(Map<String, dynamic> json) : super.fromJson(json);

  Activity toActivity(RecurringTime time, DateTime day) {
    return Activity(
      plannedStart: DateTime(
          day.year, day.month, day.day, time.start.hour, time.start.minute),
      flexible: false,
      id: const Uuid().v4(),
      name: name,
      plannedDuration: time.duration,
      category: category,
      description: description,
      location: location,
      original: this
    );
  }
}
