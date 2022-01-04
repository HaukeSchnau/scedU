import 'package:mobx/mobx.dart';
import '../gen/basic_task.dart';
  
part 'task.g.dart';

class Task = _Task with _$Task;

abstract class _Task extends BasicTask with Store {
  _Task(
      {required bool done,
      required String title,
      String? description,
      required ObservableList<Task> subtasks,
      required String id}) : super(done: done, title: title, description: description, subtasks: subtasks, id: id);

  // ignore: unused_element
  _Task.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
