import 'package:mobx/mobx.dart';
import 'package:scedu/store/agenda_store.dart';
import 'package:scedu/store/habits_store.dart';
import 'package:scedu/store/projects_store.dart';

part 'root_store.g.dart';

final rootStore = RootStore();

class RootStore = _RootStore with _$RootStore;

abstract class _RootStore with Store {
  @observable
  AgendaStore agendaStore = AgendaStore();

  @observable
  ProjectsStore projectsStore = ProjectsStore();

  @observable
  HabitsStore habitsStore = HabitsStore();
}
