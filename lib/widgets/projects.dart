import 'package:flutter/material.dart';
import 'package:scedu/store/root_store.dart';
import 'package:scedu/widgets/project_view.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final heading =
        Text("Deine aktuellen Projekte:", style: textTheme.headline4);
    final projects = rootStore.projectsStore.projects;

    if (projects.isEmpty) return Container();

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
