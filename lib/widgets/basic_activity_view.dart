import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scedu/util/time.dart';
import 'package:scedu/widgets/surface.dart';

class ButtonAction {
  final String label;
  final VoidCallback handler;
  final Color color;

  const ButtonAction(
      {required this.label, required this.handler, required this.color});
}

class BasicActivityView extends StatelessWidget {
  final bool greyedOut;
  final DateTime start;
  final Duration duration;
  final Color? sideColor;
  final String title;
  final String? description;
  final List<ButtonAction> actions;

  const BasicActivityView(
      {Key? key,
      required this.greyedOut,
      required this.start,
      required this.duration,
      this.sideColor,
      required this.title,
      this.description,
      required this.actions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final description = this.description;

    final startFormatted = DateFormat.Hm().format(start) + " Uhr";
    final durationFormatted = duration.formatShort();

    const padding = EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0);

    final buttons = Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: actions
            .map((action) => ElevatedButton(
                onPressed: action.handler,
                child: Text(action.label),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(action.color))))
            .toList());

    final item = Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            width: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(startFormatted),
                Text(durationFormatted),
              ],
            )),
        const SizedBox(width: 8),
        Expanded(
          child: Surface(
              padding: padding,
              sideColor: sideColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: textTheme.headline6),
                      if (description != null)
                        Text(
                          description,
                          style: textTheme.bodyText2,
                        )
                    ],
                  ),
                  buttons
                ],
              )),
        )
      ],
    );

    if (greyedOut) {
      return Stack(
        children: [
          Opacity(opacity: 0.4, child: item),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(padding: padding, child: buttons),
          )
        ],
      );
    }

    return item;
  }
}
