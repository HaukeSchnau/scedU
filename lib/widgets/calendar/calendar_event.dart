import 'package:flutter/material.dart';
import 'package:scedu/model/activity.dart';
import 'package:scedu/theme.dart';

class CalendarEvent extends StatelessWidget {
  final Activity activity;

  const CalendarEvent(this.activity, {Key? key}) : super(key: key);

  static const double height = 12 * 1.2;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: activity.flexible ? dynamicPixie : strawberryFix,
        child: Text(
          activity.name,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 12,
            height: 1.2,
          ),
        ));
  }
}
