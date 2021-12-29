import '../gen/basic_habit.dart';
import '../model/location.dart';
import '../model/cortex.dart';
  
class Habit extends BasicHabit {
  Habit(
      {required double frequencyDays,
      required double goal,
      required String name,
      String? description,
      Location? location,
      Cortex? category,
      required String id}) : super(frequencyDays: frequencyDays, goal: goal, name: name, description: description, location: location, category: category, id: id);

  Habit.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
