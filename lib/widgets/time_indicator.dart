import 'package:flutter/material.dart';

class TimeIndicator extends StatelessWidget {
  final double percent;

  const TimeIndicator(
    this.percent, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: TimeIndicatorPainer(percent),
        willChange: true,
        child: Container());
  }
}

class TimeIndicatorPainer extends CustomPainter {
  final double percent;

  TimeIndicatorPainer(this.percent);

  @override
  void paint(Canvas canvas, Size size) {
    const indicatorHeight = 2.0;
    const circleRadius = 5.0;
    final paint = Paint()..color = Colors.white;
    final left = size.width * .18;
    final top = size.height * percent;

    canvas.drawRect(Rect.largest, Paint()..color = Colors.transparent);
    canvas.drawRect(
        Rect.fromLTRB(left, top, size.width * 2, top + indicatorHeight), paint);
    canvas.drawCircle(
        Offset(left, top + indicatorHeight / 2), circleRadius, paint);
  }

  @override
  bool shouldRepaint(covariant TimeIndicatorPainer oldDelegate) {
    return percent != oldDelegate.percent;
  }
}
