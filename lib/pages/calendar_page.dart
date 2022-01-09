import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:scedu/pages/root_page.dart';
import 'package:scedu/widgets/calendar/calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  void nextMonth() {
    setState(() {
      pageStore.selectedMonth = DateTime(
          pageStore.selectedMonth.year, pageStore.selectedMonth.month + 1);
    });
  }

  void prevMonth() {
    setState(() {
      pageStore.selectedMonth = DateTime(
          pageStore.selectedMonth.year, pageStore.selectedMonth.month - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Observer(builder: (_) {
                return Text(
                  DateFormat.yMMMM().format(pageStore.selectedMonth),
                  style: textTheme.headline1,
                  maxLines: 1,
                );
              }),
            ),
            IconButton(
                onPressed: prevMonth, icon: const Icon(CupertinoIcons.back)),
            IconButton(
                onPressed: nextMonth, icon: const Icon(CupertinoIcons.forward))
          ],
        ),
        const SizedBox(height: 12),
        Expanded(child: Observer(builder: (_) {
          return Calendar(pageStore.selectedMonth);
        }))
      ],
    );
  }
}
