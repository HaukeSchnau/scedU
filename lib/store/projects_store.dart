import 'package:mobx/mobx.dart';
import 'package:scedu/model/project.dart';

part 'projects_store.g.dart';

class ProjectsStore = _ProjectsStore with _$ProjectsStore;

abstract class _ProjectsStore with Store {
  @observable
  ObservableList<Project> projects = ObservableList();
}
