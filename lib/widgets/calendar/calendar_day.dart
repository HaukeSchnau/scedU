import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:scedu/pages/root_page.dart';
import 'package:scedu/store/root_store.dart';
import 'package:scedu/util/date.dart';
import 'package:scedu/widgets/calendar/calendar_event.dart';
import 'package:scedu/widgets/surface.dart';

class CalendarDay extends StatelessWidget {
  final DateTime date;

  const CalendarDay(this.date, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final events = rootStore.agendaStore.getForDay(date);

        final child = LayoutBuilder(builder: (context, constraints) {
          const occupiedHeight = 12 + 6 + 2;
          final maxHeight = constraints.maxHeight - occupiedHeight;
          final maxShown = maxHeight ~/ CalendarEvent.height;
          var shownCount = maxShown;
          var addOverflowHint = false;
          if (shownCount < events.length) {
            shownCount--;
            addOverflowHint = true;
          }
          shownCount = min(shownCount, events.length);

          return Surface(
              onTap: date.isBefore(DateTime.now().toDate())
                  ? null
                  : () {
                      pageStore.setCurrentPage(0);
                      pageStore.selectedDate = date.toDate();
                    },
              padding: const EdgeInsets.only(top: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      .map((event) => shownCount == maxShown
                          ? Expanded(child: CalendarEvent(event))
                          : CalendarEvent(event))
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
        return date.isBefore(DateTime.now().toDate())
            ? Opacity(
                opacity: .5,
                child: child,
              )
            : child;
      },
    );
  }
}
