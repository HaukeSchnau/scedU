import 'package:mobx/mobx.dart';
import '../gen/basic_recurring_event.dart';
import '../model/recurring_time.dart';
import '../model/location.dart';
import '../model/cortex.dart';
  
part 'recurring_event.g.dart';

class RecurringEvent = _RecurringEvent with _$RecurringEvent;

abstract class _RecurringEvent extends BasicRecurringEvent with Store {
  _RecurringEvent(
      {required ObservableList<RecurringTime> times,
      required String name,
      String? description,
      Location? location,
      Cortex? category,
      required String id}) : super(times: times, name: name, description: description, location: location, category: category, id: id);

  // ignore: unused_element
  _RecurringEvent.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
