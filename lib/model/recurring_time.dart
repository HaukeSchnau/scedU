import 'package:mobx/mobx.dart';
import '../gen/basic_recurring_time.dart';
  
part 'recurring_time.g.dart';

class RecurringTime = _RecurringTime with _$RecurringTime;

abstract class _RecurringTime extends BasicRecurringTime with Store {
  _RecurringTime(
      {required int hour,
      required int minute,
      required int nthDay,
      required DateTime start,
      required int duration,
      required String id}) : super(hour: hour, minute: minute, nthDay: nthDay, start: start, duration: duration, id: id);

  // ignore: unused_element
  _RecurringTime.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
