import '../gen/basic_habit_progress.dart';
import '../model/habit.dart';
  
class HabitProgress extends BasicHabitProgress {
  HabitProgress(
      {required Habit habit,
      required String id}) : super(habit: habit, id: id);

  HabitProgress.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
