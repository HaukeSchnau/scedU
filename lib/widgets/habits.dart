import 'package:flutter/material.dart';
import 'package:scedu/model/habit.dart';
import 'package:scedu/widgets/habit_view.dart';

final List<Habit> habits = [
  Habit(
    frequencyDays: 1,
    goal: 12,
    name: "Laufen",
    description: "5km in <30 min",
    id: 'asdf',
  ),
  Habit(
    frequencyDays: 0.5,
    goal: 12,
    name: "Laufen",
    description: "5km in <30 min",
    id: 'asdf',
  ),
  Habit(
    frequencyDays: 2,
    goal: 12,
    name: "Laufen",
    description: "5km in <30 min",
    id: 'asdf',
  ),
  Habit(
    frequencyDays: 14,
    goal: 12,
    name: "Laufen",
    description: "5km in <30 min",
    id: 'asdf',
  ),
  Habit(
    frequencyDays: 10,
    goal: 12,
    name: "Laufen",
    description: "5km in <30 min",
    id: 'asdf',
  ),
];

class Habits extends StatelessWidget {
  const Habits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final heading = Text("Deine Habits:", style: textTheme.headline4);
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
