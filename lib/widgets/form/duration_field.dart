import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:scedu/util/time.dart';
import 'package:scedu/widgets/form/duration_controller.dart';

class DurationField extends StatefulWidget {
  final DurationController controller;

  const DurationField({Key? key, required this.controller}) : super(key: key);

  @override
  State<DurationField> createState() => _DurationFieldState();
}

class _DurationFieldState extends State<DurationField> {
  final TextEditingController textController = TextEditingController();

  void syncControllers() {
    textController.value =
        TextEditingValue(text: widget.controller.value.formatShort());
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(syncControllers);
    syncControllers();
  }

  Future<void> openDurationPicker(BuildContext context) async {
    final selectedDuration = await showDurationPicker(
        context: context, initialTime: widget.controller.value);

    if (selectedDuration != null) {
      widget.controller.value = selectedDuration;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
      controller: textController,
      onTap: () => openDurationPicker(context),
    );
  }
}
