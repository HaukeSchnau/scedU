import '../gen/basic_recurring_time.dart';
  
class RecurringTime extends BasicRecurringTime {
  RecurringTime(
      {required int hour,
      required int minute,
      required int nthDay,
      required DateTime start,
      required int duration,
      required String id}) : super(hour: hour, minute: minute, nthDay: nthDay, start: start, duration: duration, id: id);

  RecurringTime.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
