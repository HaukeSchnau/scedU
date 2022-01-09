import 'package:flutter/material.dart';

class Surface extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color? sideColor;
  final borderRadius = 8.0;
  final sideWidth = 8.0;
  final VoidCallback? onTap;

  const Surface(
      {Key? key,
      required this.child,
      this.padding = const EdgeInsets.all(16),
      this.sideColor,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sideColor = this.sideColor;
    final item = onTap == null
        ? child
        : Material(
            color: Colors.transparent,
            child: InkWell(onTap: onTap, child: child),
          );

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
              child: item));
    }

    return Container(
        clipBehavior: Clip.antiAlias,
        padding: padding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Theme.of(context).colorScheme.surface),
        child: item);
  }
}
