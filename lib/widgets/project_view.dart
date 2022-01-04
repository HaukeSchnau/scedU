import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scedu/model/project.dart';
import 'package:scedu/theme.dart';
import 'package:scedu/widgets/arc.dart';
import 'package:scedu/widgets/outline_text.dart';
import 'package:scedu/widgets/surface.dart';

class ProjectView extends StatelessWidget {
  final Project project;

  const ProjectView(this.project, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final percent = project.percentCompleted;
    final description = project.description;
    final deadline = project.deadline;

    return Surface(
        child: SizedBox(
      width: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Arc(diameter: 75, percent: percent),
                  Text((percent * 100).toStringAsFixed(0) + "%")
                ],
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(project.name,
                      style: Theme.of(context).textTheme.headline3),
                  const SizedBox(height: 8),
                  Text(
                      "${project.numCompleted} / ${project.tasks.length} Aufgaben erledigt",
                      style: Theme.of(context).textTheme.subtitle1),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          if (description != null) Text(description),
          Expanded(child: Container()),
          if (deadline != null)
            Align(
                alignment: Alignment.bottomLeft,
                child: OutlineText(
                    "Deadline: ${DateFormat.yMd().format(deadline)}",
                    color: strawberryFix)),
        ],
      ),
    ));
  }
}
