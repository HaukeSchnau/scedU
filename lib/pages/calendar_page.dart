import 'package:flutter/material.dart';
import 'package:scedu/widgets/calendar/calendar.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Kalender", style: textTheme.headline1),
        const Expanded(child: Calendar(2022, 1))
      ],
    );
  }
}
