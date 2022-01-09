import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:scedu/util/date.dart';
import '../gen/basic_recurring_time.dart';

part 'recurring_time.g.dart';

class RecurringTime = _RecurringTime with _$RecurringTime;

abstract class _RecurringTime extends BasicRecurringTime with Store {
  _RecurringTime(
      {required int nthDay,
      required DateTime start,
      required int duration,
      required String id})
      : super(nthDay: nthDay, start: start, duration: duration, id: id);

  // ignore: unused_element
  _RecurringTime.fromJson(Map<String, dynamic> json) : super.fromJson(json);

  @computed
  String get friendlyFormat {
    final startStr = "ab KW ${start.weekNumber}";
    final frequencyStr =
        nthDay == 7 ? "" : "${(nthDay / 7).toStringAsFixed(0)}. ";
    return "Jeden $frequencyStr${DateFormat("EEEE").format(start)} $startStr";
  }

  @computed
  String get friendlyFormatDuration {
    final format = DateFormat.Hm();
    return "${format.format(start)} - ${format.format(start.add(Duration(minutes: duration)))}";
  }
}
