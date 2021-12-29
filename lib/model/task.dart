import 'package:mobx/mobx.dart';
import '../gen/basic_task.dart';
import '../model/task.dart';
  
class Task extends BasicTask {
  Task(
      {required bool done,
      required String title,
      String? description,
      required ObservableList<Task> subtasks,
      required String id}) : super(done: done, title: title, description: description, subtasks: subtasks, id: id);

  Task.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
