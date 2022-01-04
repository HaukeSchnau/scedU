import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:scedu/store/date_store.dart';
import 'package:scedu/theme.dart';
import 'package:scedu/widgets/basic_activity_view.dart';

class FreeTimeView extends StatelessWidget {
  final DateTime start;
  final Duration duration;

  const FreeTimeView({Key? key, required this.start, required this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (duration.inMinutes <= 2 ||
          dateStore.currentDate.isAfter(start.add(duration))) {
        return Container();
      }

      return BasicActivityView(
          greyedOut: true,
          start: start,
          duration: duration,
          title: "Freier Zeitslot",
          actions: [
            ButtonAction(label: "Belegen", handler: () {}, color: dynamicPixie)
          ]);
    });
  }
}
