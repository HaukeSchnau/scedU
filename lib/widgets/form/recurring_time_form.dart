import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scedu/model/recurring_time.dart';
import 'package:scedu/util/date.dart';
import 'package:scedu/widgets/form/date_controller.dart';
import 'package:scedu/widgets/form/duration_controller.dart';
import 'package:scedu/widgets/form/duration_field.dart';
import 'package:scedu/widgets/form/label.dart';
import 'package:scedu/widgets/form/recurring_date_field.dart';
import 'package:scedu/widgets/form/time_controller.dart';
import 'package:scedu/widgets/form/time_field.dart';
import 'package:uuid/uuid.dart';

class RecurringTimeForm extends StatefulWidget {
  final void Function(RecurringTime value) onSubmit;

  const RecurringTimeForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _RecurringTimeFormState createState() => _RecurringTimeFormState();
}

class _RecurringTimeFormState extends State<RecurringTimeForm> {
  TimeController controller =
      TimeController(const TimeOfDay(hour: 8, minute: 0));
  TextEditingController repeatController = TextEditingController(text: "1");
  DateController startDate = DateController(DateTime.now().toDate());
  DurationController durationController =
      DurationController(const Duration(hours: 1));
  FocusNode repeatFocusNode = FocusNode();

  @override
  initState() {
    super.initState();
    repeatFocusNode.addListener(() {
      if (repeatFocusNode.hasFocus) {
        repeatController.selection = TextSelection(
            baseOffset: 0, extentOffset: repeatController.text.length);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Regelmäßige Zeit hinzufügen",
          style: textTheme.headline3,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Label(
                    label: "Uhrzeit",
                    child: TimeField(controller: controller))),
            const SizedBox(width: 16),
            Expanded(
              child: Label(
                  label: "Dauer",
                  child: DurationField(controller: durationController)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Label(
            label: "Erster Termin",
            child: RecurringDateField(controller: startDate)),
        const SizedBox(height: 16),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text("Wiederholen: Alle "),
            SizedBox(
                width: 50,
                child: TextField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    controller: repeatController,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    focusNode: repeatFocusNode)),
            const Text(" Wochen")
          ],
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                widget.onSubmit(RecurringTime(
                    duration: durationController.value.inMinutes,
                    id: const Uuid().v4(),
                    nthDay: 7 * int.parse(repeatController.text),
                    start: startDate.value.withTime(
                        hour: controller.value.hour,
                        minute: controller.value.minute)));
              },
              child: const Text("Hinzufügen")),
        )
      ],
    );
  }
}
