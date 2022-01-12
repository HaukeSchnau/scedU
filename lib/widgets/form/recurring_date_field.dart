import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scedu/util/date.dart';
import 'package:scedu/widgets/form/date_controller.dart';

class RecurringDateField extends StatefulWidget {
  final DateController controller;

  const RecurringDateField({Key? key, required this.controller})
      : super(key: key);

  @override
  State<RecurringDateField> createState() => _RecurringDateFieldState();
}

class _RecurringDateFieldState extends State<RecurringDateField> {
  final TextEditingController textController = TextEditingController();

  void syncControllers() {
    textController.value = TextEditingValue(
        text: DateFormat("EEEE").format(widget.controller.value) +
            ", KW ${widget.controller.value.weekNumber}");
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
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      widget.controller.value = selectedDate;
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
