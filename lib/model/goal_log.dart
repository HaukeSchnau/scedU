import 'package:mobx/mobx.dart';
import '../gen/basic_goal_log.dart';
import '../model/daily_goal.dart';
  
part 'goal_log.g.dart';

class GoalLog = _GoalLog with _$GoalLog;

abstract class _GoalLog extends BasicGoalLog with Store {
  _GoalLog(
      {required DailyGoal goal,
      required DateTime date,
      required int state,
      required String id}) : super(goal: goal, date: date, state: state, id: id);

  // ignore: unused_element
  _GoalLog.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
