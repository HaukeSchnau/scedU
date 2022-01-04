import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:scedu/model/project.dart';
import 'package:scedu/model/task.dart';
import 'package:scedu/widgets/project_view.dart';

final List<Project> projects = [
  Project(
      id: "aefwfasd",
      name: "scedU Mobile App",
      description:
          "asdfkjsadlfa skdlf jas kdfklasjdfklslkaf lkdkjla klkajlklf lkaskl kl skja kj ",
      tasks: ObservableList.of([
        Task(
            done: false,
            title: "TAsedf",
            subtasks: ObservableList(),
            id: "asdf"),
        Task(
            done: true, title: "TAsedf", subtasks: ObservableList(), id: "asdf")
      ])),
  Project(
      id: "aefwfasdasd",
      name: "scedU Mobile App 2",
      tasks: ObservableList.of([]),
      deadline: DateTime(2022, 1, 6))
];

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final heading =
        Text("Deine aktuellen Projekte:", style: textTheme.headline4);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        heading,
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: OverflowBox(
            maxWidth: MediaQuery.of(context).size.width,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: projects.length,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(left: index == 0 ? 0 : 16),
                  child: ProjectView(projects[index])),
            ),
          ),
        ),
      ],
    );
  }
}
