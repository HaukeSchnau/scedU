import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:scedu/pages/root_page.dart';
import 'package:scedu/store/root_store.dart';
import 'package:scedu/util/date.dart';
import 'package:scedu/widgets/activity_list.dart';

class Agenda extends StatefulWidget {
  const Agenda({Key? key}) : super(key: key);

  @override
  State<Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  void nextDay() {
    setState(() {
      pageStore.selectedDate = DateTime(pageStore.selectedDate.year,
          pageStore.selectedDate.month, pageStore.selectedDate.day + 1);
    });
  }

  void prevDay() {
    setState(() {
      pageStore.selectedDate = DateTime(pageStore.selectedDate.year,
          pageStore.selectedDate.month, pageStore.selectedDate.day - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final dateHeading = Observer(
        builder: (_) => Text(DateFormat.yMMMMd().format(pageStore.selectedDate),
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
            IconButton(
                onPressed: DateTime.now()
                        .toDate()
                        .isAtSameMomentAs(pageStore.selectedDate)
                    ? null
                    : prevDay,
                icon: const Icon(CupertinoIcons.back)),
            IconButton(
                onPressed: nextDay, icon: const Icon(CupertinoIcons.forward))
          ],
        ),
        const SizedBox(height: 16),
        Observer(builder: (_) {
          return ActivityList(
              rootStore.agendaStore.getForDay(pageStore.selectedDate));
        })
      ],
    );
  }
}
