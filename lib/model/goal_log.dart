import '../gen/basic_goal_log.dart';
import '../model/daily_goal.dart';
  
class GoalLog extends BasicGoalLog {
  GoalLog(
      {required DailyGoal goal,
      required DateTime date,
      required int state,
      required String id}) : super(goal: goal, date: date, state: state, id: id);

  GoalLog.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
