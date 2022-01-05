import 'package:flutter/material.dart';
import 'package:scedu/model/daily_goal.dart';
import 'package:scedu/widgets/goal_view.dart';
import 'package:scedu/widgets/surface.dart';

class GoalsPage extends StatelessWidget {
  const GoalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final List<DailyGoal> goals = [
      DailyGoal(
          goal: 2400,
          id: "calories",
          name: "Kalorien",
          description: "Lorem Ipsum Dolor Sit Amet"),
      DailyGoal(
          goal: 2400,
          id: "calories",
          name: "Kalorien",
          description: "Lorem Ipsum Dolor Sit Amet"),
      DailyGoal(
          goal: 2400,
          id: "calories",
          name: "Kalorien",
          description: "Lorem Ipsum Dolor Sit Amet"),
      DailyGoal(
          goal: 2400,
          id: "calories",
          name: "Kalorien",
          description: "Lorem Ipsum Dolor Sit Amet"),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Tägliche Ziele", style: textTheme.headline1),
        const SizedBox(height: 12),
        Surface(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: goals.length,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(top: index == 0 ? 0 : 32.0),
                      child: GoalView(goals[index]),
                    )))
      ],
    );
  }
}
