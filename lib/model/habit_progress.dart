import 'package:mobx/mobx.dart';
import '../gen/basic_habit_progress.dart';
import '../model/habit.dart';
  
part 'habit_progress.g.dart';

class HabitProgress = _HabitProgress with _$HabitProgress;

abstract class _HabitProgress extends BasicHabitProgress with Store {
  _HabitProgress(
      {required Habit habit,
      required String id}) : super(habit: habit, id: id);

  // ignore: unused_element
  _HabitProgress.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
