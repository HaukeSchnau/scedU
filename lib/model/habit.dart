import 'package:mobx/mobx.dart';
import 'package:scedu/util/string_util.dart';
import '../gen/basic_habit.dart';
import '../model/location.dart';
import '../model/cortex.dart';

part 'habit.g.dart';

class Habit = _Habit with _$Habit;

abstract class _Habit extends BasicHabit with Store {
  _Habit(
      {required double frequencyDays,
      required double goal,
      required String name,
      String? description,
      Location? location,
      Cortex? category,
      required String id})
      : super(
            frequencyDays: frequencyDays,
            goal: goal,
            name: name,
            description: description,
            location: location,
            category: category,
            id: id);

  // ignore: unused_element
  _Habit.fromJson(Map<String, dynamic> json) : super.fromJson(json);

  @computed
  String get readableFrequency {
    if (frequencyDays == 1) return "Täglich";
    if (frequencyDays < 1) {
      return "${approximateNumberFormat(1 / frequencyDays)}x / Tag";
    }
    if (frequencyDays < 7) {
      return "${approximateNumberFormat(7 / frequencyDays)}x / Woche";
    }
    return "Alle ${approximateNumberFormat(frequencyDays / 7)} Wochen";
  }
}
