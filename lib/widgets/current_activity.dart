import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:scedu/model/activity.dart';
import 'package:scedu/util/time.dart';
import 'package:scedu/widgets/surface.dart';

class CurrentActivity extends StatelessWidget {
  final Activity? activity;

  const CurrentActivity(
    this.activity, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final activity = this.activity;
    if (activity == null) return Container();

    final description = activity.description;

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Surface(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Aktuelle Tätigkeit", style: textTheme.subtitle1),
        Text(activity.name, style: textTheme.headline2),
        if (description != null) Text(description, style: textTheme.bodyText1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Observer(builder: (_) {
              final checkedInDuration = activity.checkedInDuration;

              if (checkedInDuration != null) {
                return Text(
                    "${checkedInDuration.format()} / ${Duration(minutes: activity.plannedDuration).format()}");
              } else {
                return Container();
              }
            }),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Auschecken"),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(colorScheme.error)),
            )
          ],
        )
      ],
    ));
  }
}
