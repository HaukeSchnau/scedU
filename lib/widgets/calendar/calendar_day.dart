import 'package:flutter/material.dart';
import 'package:scedu/model/activity.dart';
import 'package:scedu/widgets/calendar/calendar_event.dart';
import 'package:scedu/widgets/surface.dart';

class CalendarDay extends StatelessWidget {
  final DateTime date;

  const CalendarDay(this.date, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Activity> events = [
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
      ),
      Activity(
        plannedStart: DateTime(2022, 1, 4, 21),
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
    ];

    return LayoutBuilder(builder: (context, constraints) {
      const occupiedHeight = 12 + 6 + 2;
      final maxHeight = constraints.maxHeight - occupiedHeight;
      var shownCount = maxHeight ~/ CalendarEvent.height;
      var addOverflowHint = false;
      if (shownCount < events.length) {
        shownCount--;
        addOverflowHint = true;
      }

      return Surface(
          padding: const EdgeInsets.only(top: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(date.day.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1,
                    )),
              ),
              const SizedBox(height: 2),
              ...events
                  .sublist(0, shownCount)
                  .map((event) => CalendarEvent(event))
                  .toList(),
              if (addOverflowHint)
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text("+${events.length - shownCount}",
                          style: const TextStyle(fontSize: 12, height: 1)),
                    ),
                  ),
                )
            ],
          ));
    });
  }
}
