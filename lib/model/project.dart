import 'package:mobx/mobx.dart';
import '../gen/basic_project.dart';
import '../model/task.dart';
import '../model/location.dart';
import '../model/cortex.dart';
  
class Project extends BasicProject {
  Project(
      {required ObservableList<Task> tasks,
      DateTime? deadline,
      required String name,
      String? description,
      Location? location,
      Cortex? category,
      required String id}) : super(tasks: tasks, deadline: deadline, name: name, description: description, location: location, category: category, id: id);

  Project.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
