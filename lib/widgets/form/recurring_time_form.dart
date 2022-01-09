import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scedu/model/recurring_time.dart';
import 'package:scedu/util/date.dart';
import 'package:scedu/widgets/form/date_controller.dart';
import 'package:scedu/widgets/form/duration_controller.dart';
import 'package:scedu/widgets/form/duration_field.dart';
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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Regelmäßige Zeit hinzufügen"),
        TimeField(controller: controller),
        DurationField(controller: durationController),
        RecurringDateField(controller: startDate),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text("Wiederholen: Alle "),
            SizedBox(
                width: 50,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: repeatController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                )),
            const Text(" Wochen")
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                widget.onSubmit(RecurringTime(
                    duration: durationController.value.inMinutes,
                    id: const Uuid().v4(),
                    nthDay: 7 * int.parse(repeatController.text),
                    start: startDate.value.withTime(hour: controller.value.hour, minute: controller.value.minute)));
              },
              child: const Text("Hinzufügen")),
        )
      ],
    );
  }
}
