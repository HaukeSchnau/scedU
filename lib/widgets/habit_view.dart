import 'package:flutter/material.dart';
import 'package:scedu/model/habit.dart';
import 'package:scedu/widgets/outline_text.dart';
import 'package:scedu/widgets/surface.dart';

class HabitView extends StatelessWidget {
  final Habit habit;

  const HabitView(this.habit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final description = habit.description;

    return Surface(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          habit.name,
          style: textTheme.headline6,
        ),
        if (description != null)
          Text(
            description,
            style: textTheme.bodyText2,
          ),
        Expanded(
          child: Container(),
        ),
        OutlineText(
          habit.readableFrequency,
        )
      ],
    ));
  }
}
