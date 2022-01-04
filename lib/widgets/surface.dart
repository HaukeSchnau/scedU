import 'package:flutter/material.dart';

class Surface extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color? sideColor;
  final borderRadius = 8.0;
  final sideWidth = 8.0;

  const Surface(
      {Key? key,
      required this.child,
      this.padding = const EdgeInsets.all(16),
      this.sideColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sideColor = this.sideColor;

    if (sideColor != null) {
      return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: Theme.of(context).colorScheme.surface),
          child: Container(
              padding: padding - EdgeInsets.only(left: sideWidth),
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(color: sideColor, width: sideWidth))),
              child: child));
    }

    return Container(
        padding: padding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Theme.of(context).colorScheme.surface),
        child: child);
  }
}
