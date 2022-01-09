import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String label;
  final Widget child;

  const Label({Key? key, required this.label, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(label),
        ),
        child
      ],
    );
  }
}
