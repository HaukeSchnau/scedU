import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:scedu/model/activity.dart';
import 'package:scedu/theme.dart';
import 'package:scedu/widgets/basic_activity_view.dart';

class ActivityView extends StatelessWidget {
  final Activity activity;
  final bool isNextUp;

  const ActivityView(this.activity, {Key? key, required this.isNextUp})
      : super(key: key);

  void checkIn() {
    activity.checkIn();
  }

  void checkOut() {
    activity.checkOut();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => BasicActivityView(
                greyedOut: activity.isDone,
                start: activity.plannedStart,
                duration: Duration(minutes: activity.plannedDuration),
                sideColor: activity.flexible ? dynamicPixie : strawberryFix,
                title: activity.name,
                description: activity.description,
                actions: [
                  if (!activity.isDone && activity.flexible)
                    ButtonAction(
                        handler: () {},
                        label: "Verschieben",
                        color: dynamicPixie),
                  if (isNextUp && activity.checkedIn == null)
                    ButtonAction(
                        handler: checkIn, label: "Einchecken", color: green),
                  if (isNextUp && activity.checkedIn != null)
                    ButtonAction(
                        handler: checkOut,
                        label: "Auschecken",
                        color: strawberryFix)
                ]));
  }
}
