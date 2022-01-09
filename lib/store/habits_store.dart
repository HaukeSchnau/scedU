import 'package:mobx/mobx.dart';
import 'package:scedu/model/habit.dart';

part 'habits_store.g.dart';

class HabitsStore = _HabitsStore with _$HabitsStore;

abstract class _HabitsStore with Store {
  @observable
  ObservableList<Habit> habits = ObservableList();
}
