import 'package:mobx/mobx.dart';
import '../gen/basic_recurring_event.dart';
import '../model/recurring_time.dart';
import '../model/location.dart';
import '../model/cortex.dart';
  
class RecurringEvent extends BasicRecurringEvent {
  RecurringEvent(
      {required ObservableList<RecurringTime> times,
      required String name,
      String? description,
      Location? location,
      Cortex? category,
      required String id}) : super(times: times, name: name, description: description, location: location, category: category, id: id);

  RecurringEvent.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
