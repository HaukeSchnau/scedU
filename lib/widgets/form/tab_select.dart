import 'package:flutter/material.dart';
import 'package:scedu/theme.dart';

class TabSelect<T> extends StatelessWidget {
  final List<T> values;
  final String Function(T value) labelBuilder;
  final T selectedValue;
  final void Function(T value) onSelect;

  const TabSelect(
      {Key? key,
      required this.values,
      required this.labelBuilder,
      required this.selectedValue,
      required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: onSurface, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: values
            .map((value) => Expanded(
                    child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => onSelect(value),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      color: value == selectedValue
                          ? dynamicPixie
                          : Colors.transparent,
                      child: Text(
                        labelBuilder(value),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )))
            .toList(),
      ),
    );
  }
}
