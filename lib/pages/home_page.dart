import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:scedu/store/root_store.dart';
import 'package:scedu/util/greeting.dart';
import 'package:scedu/widgets/agenda.dart';
import 'package:scedu/widgets/current_activity.dart';
import 'package:scedu/widgets/habits.dart';
import 'package:scedu/widgets/projects.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(getGreeting(name: "Hauke"),
            style: Theme.of(context).textTheme.headline1),
        const SizedBox(height: 12),
        Observer(builder: (_) {
          return CurrentActivity(rootStore.agendaStore.currentActivity);
        }),
        if (rootStore.agendaStore.currentActivity != null)
          const SizedBox(height: 48),
        const Agenda(),
        if (rootStore.projectsStore.projects.isNotEmpty)
          const SizedBox(height: 48),
        const Projects(),
        if (rootStore.habitsStore.habits.isNotEmpty) const SizedBox(height: 48),
        const Habits()
      ],
    );
  }
}
