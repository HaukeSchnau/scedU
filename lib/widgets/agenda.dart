import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:scedu/model/activity.dart';
import 'package:scedu/store/date_store.dart';
import 'package:scedu/widgets/activity_list.dart';

class Agenda extends StatelessWidget {
  const Agenda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final dateHeading = Observer(
        builder: (_) => Text(DateFormat.yMMMMd().format(dateStore.currentDate),
            style: textTheme.subtitle2));
    final heading = Text("Deine heutige Agenda:", style: textTheme.headline4);

    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [dateHeading, heading],
            ),
            Expanded(child: Container()),
            IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.back)),
            IconButton(
                onPressed: () {}, icon: const Icon(CupertinoIcons.forward))
          ],
        ),
        const SizedBox(height: 16),
        ActivityList([
          Activity(
            plannedStart: DateTime(2022, 1, 4, 10),
            plannedDuration: 121,
            flexible: true,
            name: "Arbeiten",
            id: "id",
            description: "Test",
            checkedIn: DateTime(2022, 1, 4, 12, 30),
          ),
          Activity(
            plannedStart: DateTime(2022, 1, 4, 15),
            plannedDuration: 120,
            flexible: false,
            name: "Arbeiten",
            id: "id",
            description: "Test",
          ),
          Activity(
            plannedStart: DateTime(2022, 1, 4, 18),
            plannedDuration: 120,
            flexible: true,
            name: "Arbeiten",
            id: "id",
            description: "Test",
          ),
          Activity(
            plannedStart: DateTime(2022, 1, 4, 21),
            plannedDuration: 120,
            flexible: true,
            name: "Arbeiten",
            id: "id",
            description: "Test",
          )
        ])
      ],
    );
  }
}
