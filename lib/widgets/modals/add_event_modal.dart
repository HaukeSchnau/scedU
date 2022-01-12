import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:scedu/db.dart';
import 'package:scedu/model/abstract_event.dart';
import 'package:scedu/model/activity.dart';
import 'package:scedu/model/recurring_event.dart';
import 'package:scedu/model/recurring_time.dart';
import 'package:scedu/pages/root_page.dart';
import 'package:scedu/store/agenda_store.dart';
import 'package:scedu/store/root_store.dart';
import 'package:scedu/theme.dart';
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
  final AbstractEvent? activity;

  const AddEventModal({Key? key, this.activity}) : super(key: key);

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

  @override
  void initState() {
    super.initState();
    final existingActivity = widget.activity;
    if (existingActivity != null) {
      title.text = existingActivity.name;
      if (existingActivity is RecurringEvent) {
        type = EventType.recurring;
        times = existingActivity.times;
        isFlexible = existingActivity.flexible;
        if (times.isNotEmpty) {
          start.value = times[0].start;
          duration.value = Duration(minutes: times[0].duration);
        }
      } else if (existingActivity is Activity) {
        type = EventType.once;
        start.value = existingActivity.plannedStart;
        duration.value = Duration(minutes: existingActivity.plannedDuration);
        isFlexible = existingActivity.flexible;
      }
    }
  }

  Future<void> onDelete() async {
    final existingActivity = widget.activity;
    if (existingActivity != null) {
      if (existingActivity is RecurringEvent) {
        rootStore.agendaStore.recurringEvents
            .removeWhere((element) => element.id == existingActivity.id);
      } else if (existingActivity is Activity) {
        rootStore.agendaStore.activities
            .removeWhere((element) => element.id == existingActivity.id);
      }
      await deleteEntity(existingActivity);
    }
    Navigator.pop(context);
  }

  Future<void> onSave() async {
    final id = widget.activity?.id;
    if (type == EventType.once) {
      final event = Activity(
          flexible: isFlexible,
          id: id ?? const Uuid().v4(),
          name: title.text,
          plannedDuration: duration.value.inMinutes,
          plannedStart: start.value);
      if (id == null) {
        await saveEntity(event);
      } else {
        await updateEntity(event);
      }
      rootStore.agendaStore.activities
          .removeWhere((element) => element.id == id);
      rootStore.agendaStore.activities.add(event);
    } else {
      final event = RecurringEvent(
          id: id ?? const Uuid().v4(),
          name: title.text,
          times: ObservableList.of(times),
          flexible: isFlexible);
      if (id == null) {
        await saveEntity(event);
      } else {
        await updateEntity(event);
      }
      rootStore.agendaStore.recurringEvents
          .removeWhere((element) => element.id == id);
      rootStore.agendaStore.recurringEvents.add(event);
    }

    Navigator.pop(context);
  }

  Future<void> openAddTimeModal() async {
    showDialog(
      context: context,
      builder: (context) => Container(
        padding: MediaQuery.of(context).viewInsets,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: Material(
              color: Colors.transparent,
              child: Surface(
                padding: const EdgeInsets.all(24),
                child: RecurringTimeForm(
                  onSubmit: (value) => setState(() {
                    times.add(value);
                  }),
                ),
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
                    icon: const Icon(CupertinoIcons.xmark)),
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
          Text(widget.activity == null ? "Neuer Termin" : "Termin bearbeiten",
              style: textTheme.headline2),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (widget.activity != null)
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(strawberryFix)),
                    onPressed: onDelete,
                    child: const Text("Löschen")),
              const SizedBox(width: 16),
              ElevatedButton(onPressed: onSave, child: const Text("Speichern")),
            ],
          )
        ],
      ),
    );
  }
}
