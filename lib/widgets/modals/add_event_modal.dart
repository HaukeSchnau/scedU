import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:scedu/db.dart';
import 'package:scedu/model/activity.dart';
import 'package:scedu/model/recurring_event.dart';
import 'package:scedu/model/recurring_time.dart';
import 'package:scedu/pages/root_page.dart';
import 'package:scedu/store/root_store.dart';
import 'package:scedu/util/date.dart';
import 'package:scedu/util/indexed_iterable.dart';
import 'package:scedu/widgets/form/date_controller.dart';
import 'package:scedu/widgets/form/date_field.dart';
import 'package:scedu/widgets/form/duration_controller.dart';
import 'package:scedu/widgets/form/duration_field.dart';
import 'package:scedu/widgets/form/label.dart';
import 'package:scedu/widgets/form/recurring_time_form.dart';
import 'package:scedu/widgets/form/tab_select.dart';
import 'package:scedu/widgets/surface.dart';
import 'package:uuid/uuid.dart';

enum EventType { once, recurring }

class AddEventModal extends StatefulWidget {
  const AddEventModal({Key? key}) : super(key: key);

  @override
  State<AddEventModal> createState() => _AddEventModalState();
}

class _AddEventModalState extends State<AddEventModal> {
  EventType type = EventType.once;
  TextEditingController title = TextEditingController();
  DateController start =
      DateController(pageStore.selectedDate.withTime(hour: 8));
  DurationController duration = DurationController(const Duration(hours: 1));
  bool isFlexible = false;
  List<RecurringTime> times = [];

  Future<void> onSave() async {
    if (type == EventType.once) {
      final event = Activity(
          flexible: isFlexible,
          id: const Uuid().v4(),
          name: title.text,
          plannedDuration: duration.value.inMinutes,
          plannedStart: start.value);
      await saveEntity(event);
      rootStore.agendaStore.activities.add(event);
    } else {
      final event = RecurringEvent(
          id: const Uuid().v4(),
          name: title.text,
          times: ObservableList.of(times),
          flexible: isFlexible);
      await saveEntity(event);
      rootStore.agendaStore.recurringEvents.add(event);
    }
    Navigator.pop(context);
  }

  Future<void> openAddTimeModal() async {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(64.0),
          child: Material(
            color: Colors.transparent,
            child: Surface(
              child: RecurringTimeForm(
                onSubmit: (value) => setState(() {
                  times.add(value);
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final onceForm = Row(
      children: [
        Expanded(
          child: Label(
            label: "Beginn",
            child: DateField(
              controller: start,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Label(
            label: "Dauer",
            child: DurationField(
              controller: duration,
            ),
          ),
        ),
      ],
    );

    final recurringForm = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Zeiten", style: textTheme.subtitle1),
        ...times.mapIndexed((time, i) => ListTile(
              title: Text(time.friendlyFormat),
              subtitle: Text(time.friendlyFormatDuration),
              contentPadding: EdgeInsets.zero,
              trailing: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(999),
                clipBehavior: Clip.antiAlias,
                child: IconButton(
                    onPressed: () => setState(() {
                          times.removeAt(i);
                        }),
                    icon: Icon(CupertinoIcons.xmark)),
              ),
            )),
        ElevatedButton(
            onPressed: openAddTimeModal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(CupertinoIcons.add, size: 16),
                Text("Hinzufügen")
              ],
            ))
      ],
    );

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Neuer Termin", style: textTheme.headline2),
          const SizedBox(height: 16),
          Label(
            label: "Titel",
            child: TextField(
              controller: title,
            ),
          ),
          const SizedBox(height: 16),
          TabSelect<EventType>(
            values: const [EventType.once, EventType.recurring],
            labelBuilder: (value) =>
                value == EventType.once ? "einmalig" : "wiederkehrend",
            selectedValue: type,
            onSelect: (value) => setState(() {
              type = value;
            }),
          ),
          const SizedBox(height: 16),
          if (type == EventType.once) onceForm,
          if (type == EventType.recurring) recurringForm,
          const SizedBox(height: 16),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text("Flexibler Termin?"),
            value: isFlexible,
            onChanged: (value) => setState(() {
              if (value != null) isFlexible = value;
            }),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
                onPressed: onSave, child: const Text("Speichern")),
          )
        ],
      ),
    );
  }
}
