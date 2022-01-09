import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scedu/model/daily_goal.dart';
import 'package:scedu/theme.dart';
import 'package:scedu/widgets/progress_bar.dart';

class GoalView extends StatelessWidget {
  final DailyGoal goal;

  const GoalView(this.goal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final icon = Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: dynamicPixie, borderRadius: BorderRadius.circular(99999)),
    );
    final heading = Text(goal.name, style: textTheme.headline3);
    final percentView = Text("72%", style: textTheme.subtitle2);
    final outOfView = Text("1728/${goal.goal}", style: textTheme.subtitle2);
    final editIcon = IconButton(
      icon: const Icon(CupertinoIcons.pen),
      onPressed: () {},
    );

    return Row(
      children: [
        icon,
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: heading),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [percentView, outOfView],
                  ),
                  editIcon
                ],
              ),
              ProgressBar(1728 / goal.goal)
            ],
          ),
        )
      ],
    );
  }
}
