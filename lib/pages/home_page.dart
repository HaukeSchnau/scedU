import 'package:flutter/material.dart';
import 'package:scedu/model/activity.dart';
import 'package:scedu/util/greeting.dart';
import 'package:scedu/widgets/agenda.dart';
import 'package:scedu/widgets/current_activity.dart';
import 'package:scedu/widgets/habits.dart';
import 'package:scedu/widgets/projects.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(getGreeting(name: "Hauke"),
              style: Theme.of(context).textTheme.headline1),
          const SizedBox(height: 12),
          CurrentActivity(Activity(
            plannedStart: DateTime(2022, 1, 4, 12),
            plannedDuration: 120,
            flexible: true,
            name: "Arbeiten",
            id: "id",
            description: "Test",
            checkedIn: DateTime(2022, 1, 4, 12, 30),
          )),
        ],
      ),
    );
  }
}
