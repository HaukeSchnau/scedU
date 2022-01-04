import 'package:mobx/mobx.dart';
import '../gen/basic_daily_goal.dart';
  
part 'daily_goal.g.dart';

class DailyGoal = _DailyGoal with _$DailyGoal;

abstract class _DailyGoal extends BasicDailyGoal with Store {
  _DailyGoal(
      {required String name,
      String? description,
      required int goal,
      required String id}) : super(name: name, description: description, goal: goal, id: id);

  // ignore: unused_element
  _DailyGoal.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
