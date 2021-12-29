import '../gen/basic_daily_goal.dart';
  
class DailyGoal extends BasicDailyGoal {
  DailyGoal(
      {required String name,
      String? description,
      required int goal,
      required String id}) : super(name: name, description: description, goal: goal, id: id);

  DailyGoal.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
