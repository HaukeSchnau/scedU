import 'package:mobx/mobx.dart';
import '../gen/basic_project.dart';
import '../model/task.dart';
import '../model/location.dart';
import '../model/cortex.dart';

part 'project.g.dart';

class Project = _Project with _$Project;

abstract class _Project extends BasicProject with Store {
  _Project(
      {required ObservableList<Task> tasks,
      DateTime? deadline,
      required String name,
      String? description,
      Location? location,
      Cortex? category,
      required String id})
      : super(
            tasks: tasks,
            deadline: deadline,
            name: name,
            description: description,
            location: location,
            category: category,
            id: id);

  // ignore: unused_element
  _Project.fromJson(Map<String, dynamic> json) : super.fromJson(json);

  @computed
  double get percentCompleted {
    if (tasks.isEmpty) return 1;
    return numCompleted / tasks.length;
  }

  @computed
  int get numCompleted {
    return tasks.where((task) => task.done).length;
  }
}
