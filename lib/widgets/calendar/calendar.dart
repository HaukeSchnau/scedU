import 'package:flutter/material.dart';
import 'package:scedu/widgets/calendar/calendar_day.dart';
import 'package:scedu/widgets/calendar/calendar_grid_delegate.dart';

class Calendar extends StatelessWidget {
  final DateTime selectedMonth;

  const Calendar(this.selectedMonth, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime firstOfMonth = DateTime(selectedMonth.year, selectedMonth.month);
    int startIndex = firstOfMonth.weekday - 1;

    DateTime lastOfMonth =
        DateTime(selectedMonth.year, selectedMonth.month + 1, 0);

    int totalItems = startIndex + lastOfMonth.day;
    totalItems += 7 - totalItems % 7;
    int rows = totalItems ~/ 7;

    return GridView.builder(
      gridDelegate: CalendarGridDelegate(rows: rows, cols: 7),
      itemBuilder: (context, index) =>
          CalendarDay(firstOfMonth.add(Duration(days: index - startIndex))),
      itemCount: rows * 7,
    );
  }
}
