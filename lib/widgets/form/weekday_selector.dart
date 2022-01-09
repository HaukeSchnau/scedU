import 'package:flutter/material.dart';
import 'package:scedu/theme.dart';
import 'package:scedu/util/indexed_iterable.dart';

final weekdays = [
  "Montag",
  "Dienstag",
  "Mittwoch",
  "Donnerstag",
  "Freitag",
  "Samstag",
  "Sonntag"
];

class WeekdaySelector extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index) onSelect;

  const WeekdaySelector(
      {Key? key, required this.selectedIndex, required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const size = 32.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: weekdays
          .mapIndexed((weekday, i) => Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                  color: i == selectedIndex ? dynamicPixie : onSurface,
                  borderRadius: BorderRadius.circular(9999)),
              child: InkWell(
                  onTap: () => onSelect(i),
                  child: Center(child: Text(weekday.substring(0, 2))))))
          .toList(),
    );
  }
}
