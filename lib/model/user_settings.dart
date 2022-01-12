import 'package:mobx/mobx.dart';
import '../gen/basic_user_settings.dart';
  
part 'user_settings.g.dart';

class UserSettings = _UserSettings with _$UserSettings;

abstract class _UserSettings extends BasicUserSettings with Store {
  _UserSettings(
      {required String name,
      required DateTime sleepTime,
      required double sleepHours,
      required String id}) : super(name: name, sleepTime: sleepTime, sleepHours: sleepHours, id: id);

  // ignore: unused_element
  _UserSettings.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
