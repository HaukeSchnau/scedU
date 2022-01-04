import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:scedu/model/activity.dart';
import 'package:scedu/widgets/activity_view.dart';
import 'package:scedu/widgets/free_time_view.dart';

class ActivityList extends StatelessWidget {
  final List<Activity> activities;

  const ActivityList(this.activities, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final nextUpIndex =
          activities.indexWhere((activity) => !activity.isDone) * 2;
      return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: activities.length * 2 - 1,
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(top: index == 0 ? 0.0 : 8.0),
                child: index % 2 == 0
                    ? ActivityView(
                        activities[index ~/ 2],
                        isNextUp: index == nextUpIndex,
                      )
                    : FreeTimeView(
                        start: activities[index ~/ 2].plannedEnd,
                        duration: activities[index ~/ 2 + 1]
                            .plannedStart
                            .difference(activities[index ~/ 2].plannedEnd)),
              ));
    });
  }
}
