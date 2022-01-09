import 'package:mobx/mobx.dart';
import 'package:scedu/store/date_store.dart';
import '../gen/basic_activity.dart';
import '../model/knowledge.dart';
import '../model/location.dart';
import '../model/cortex.dart';

part 'activity.g.dart';

class Activity = _Activity with _$Activity;

abstract class _Activity extends BasicActivity with Store {
  _Activity(
      {required DateTime plannedStart,
      required int plannedDuration,
      required bool flexible,
      DateTime? checkedIn,
      DateTime? checkedOut,
      int? satisfaction,
      Knowledge? log,
      required String name,
      String? description,
      Location? location,
      Cortex? category,
      required String id})
      : super(
            plannedStart: plannedStart,
            plannedDuration: plannedDuration,
            flexible: flexible,
            checkedIn: checkedIn,
            checkedOut: checkedOut,
            satisfaction: satisfaction,
            log: log,
            name: name,
            description: description,
            location: location,
            category: category,
            id: id);

  // ignore: unused_element
  _Activity.fromJson(Map<String, dynamic> json) : super.fromJson(json);

  @computed
  Duration? get checkedInDuration {
    final startTime = checkedIn;
    var endTime = checkedOut ?? dateStore.currentDate;
    if (startTime == null) return null;

    return endTime.difference(startTime);
  }

  @computed
  bool get isDone {
    return dateStore.currentDate
            .isAfter(plannedStart.add(Duration(minutes: plannedDuration))) ||
        checkedOut != null;
  }

  @computed
  DateTime get plannedEnd {
    return plannedStart.add(Duration(minutes: plannedDuration));
  }

  @action
  checkIn() {
    checkedIn = DateTime.now();
  }

  @action
  checkOut() {
    checkedOut = DateTime.now();
  }
}
