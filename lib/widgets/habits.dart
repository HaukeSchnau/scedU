import 'package:flutter/material.dart';
import 'package:scedu/store/root_store.dart';
import 'package:scedu/widgets/habit_view.dart';

class Habits extends StatelessWidget {
  const Habits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final heading = Text("Deine Habits:", style: textTheme.headline4);
    final habits = rootStore.habitsStore.habits;

    if (habits.isEmpty) return Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heading,
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 32.0,
          crossAxisSpacing: 32.0,
          children: habits.map((habit) => HabitView(habit)).toList(),
        )
      ],
    );
  }
}
