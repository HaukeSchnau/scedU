import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scedu/widgets/form/date_controller.dart';

class DateField extends StatefulWidget {
  final DateController controller;

  const DateField({Key? key, required this.controller}) : super(key: key);

  @override
  State<DateField> createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  final TextEditingController textController = TextEditingController();

  void syncControllers() {
    textController.value = TextEditingValue(
        text: DateFormat("d.MM.y, HH:mm").format(widget.controller.value));
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(syncControllers);
    syncControllers();
  }

  Future<void> openDatePicker(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: widget.controller.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    TimeOfDay? selectedTime;
    if (selectedDate != null) {
      selectedTime = await showTimePicker(
        context: context,
        initialTime: const TimeOfDay(hour: 8, minute: 0),
      );
    }

    if (selectedDate != null && selectedTime != null) {
      final selectedDateTime = DateTime(selectedDate.year, selectedDate.month,
          selectedDate.day, selectedTime.hour, selectedTime.minute);
      widget.controller.value = selectedDateTime;
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
