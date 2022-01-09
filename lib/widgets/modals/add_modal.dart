import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scedu/theme.dart';
import 'package:scedu/widgets/modals/add_event_modal.dart';
import 'package:scedu/widgets/modals/custom_modal_wrapper.dart';

class AddButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback handler;

  const AddButton(
      {Key? key,
      required this.label,
      required this.icon,
      required this.handler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                  color: background, borderRadius: BorderRadius.circular(16)),
              child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                        handler();
                      },
                      child: Icon(icon, size: 48)))),
        ),
        Expanded(
            child: Center(
                child:
                    Text(label, style: Theme.of(context).textTheme.subtitle1)))
      ],
    );
  }
}

class AddModal extends StatelessWidget {
  const AddModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(32.0),
      crossAxisCount: 2,
      childAspectRatio: 1 / 1.2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 32,
      children: [
        AddButton(
            label: "Termin",
            icon: CupertinoIcons.calendar,
            handler: () => openCustomModal(context, const AddEventModal())),
        AddButton(
            label: "Projekt", icon: CupertinoIcons.folder, handler: () {}),
        AddButton(label: "Habit", icon: CupertinoIcons.bolt, handler: () {}),
        AddButton(
            label: "Tägliches Ziel",
            icon: CupertinoIcons.rocket,
            handler: () {}),
      ],
    );
  }
}
