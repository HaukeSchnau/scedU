import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scedu/widgets/form/time_controller.dart';

class TimeField extends StatefulWidget {
  final TimeController controller;

  const TimeField({Key? key, required this.controller}) : super(key: key);

  @override
  State<TimeField> createState() => _TimeFieldState();
}

class _TimeFieldState extends State<TimeField> {
  final TextEditingController textController = TextEditingController();

  void syncControllers() {
    DateTime date = DateTime(
        1, 1, 1, widget.controller.value.hour, widget.controller.value.minute);
    textController.value =
        TextEditingValue(text: DateFormat("HH:mm 'Uhr'").format(date));
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(syncControllers);
    syncControllers();
  }

  Future<void> openDatePicker(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: widget.controller.value,
    );

    if (selectedTime != null) {
      widget.controller.value = selectedTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: textController,
      onTap: () => openDatePicker(context),
    );
  }
}
