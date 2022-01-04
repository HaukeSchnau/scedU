import 'package:flutter/material.dart';

class OutlineText extends StatelessWidget {
  final String text;
  final Color color;
  final TextStyle textStyle;
  final EdgeInsets padding;

  const OutlineText(this.text,
      {Key? key,
      this.color = Colors.white,
      this.textStyle = const TextStyle(),
      this.padding =
          const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: color, width: 1)),
        child: Text(text, style: textStyle.copyWith(color: color)));
  }
}
