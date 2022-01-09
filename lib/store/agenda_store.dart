import 'package:mobx/mobx.dart';
import 'package:scedu/db.dart';
import 'package:scedu/model/activity.dart';
import 'package:scedu/model/recurring_event.dart';
import 'package:scedu/util/date.dart';

part 'agenda_store.g.dart';

class AgendaStore = _AgendaStore with _$AgendaStore;

abstract class _AgendaStore with Store {
  @observable
  ObservableList<Activity> activities = ObservableList();

  @observable
  ObservableList<RecurringEvent> recurringEvents = ObservableList();

  @action
  Future<void> loadActivities() async {
    activities = ObservableList.of(await loadEntities<Activity>());
    recurringEvents = ObservableList.of(await loadEntities<RecurringEvent>());
  }

  @computed
  Activity? get currentActivity {
    final activeActivities = activities.where((activity) =>
        activity.checkedIn != null && activity.checkedOut == null);
    return activeActivities.isNotEmpty ? activeActivities.first : null;
  }

  List<Activity> getRecurringEventsForDay(DateTime day) {
    final List<Activity> res = [];
    for (RecurringEvent event in recurringEvents) {
      final times = event.times.where((time) =>
          time.start.toDate().difference(day).inDays % time.nthDay == 0);
      if (times.isNotEmpty) {
        res.add(event.toActivity(times.first, day));
      }
    }
    return res;
  }

  List<Activity> getForDay(DateTime day) {
    DateTime tomorrowDate = day.add(const Duration(days: 1));
    final res = [
      ...activities.where((activity) =>
          activity.plannedStart.isAfter(day) &&
          activity.plannedStart.isBefore(tomorrowDate)),
      ...getRecurringEventsForDay(day)
    ];
    res.sort(compareActivities);
    return res;
  }
}

int compareActivities(Activity a, Activity b) {
  return a.plannedStart.compareTo(b.plannedStart);
}
