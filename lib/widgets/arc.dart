import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scedu/theme.dart';

class Arc extends StatelessWidget {
  final double diameter;
  final double percent;

  const Arc({Key? key, this.diameter = 200, required this.percent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: diameter,
      height: diameter,
      child: CustomPaint(
        painter: ArcPainter(percent),
        size: Size(diameter, diameter),
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  final double percent;

  ArcPainter(this.percent);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = dynamicPixie;
    Paint circlePaint = Paint()..color = background;
    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawArc(
      Rect.fromCenter(
        center: center,
        height: size.height,
        width: size.width,
      ),
      -pi / 2,
      2 * pi * percent,
      true,
      paint,
    );
    canvas.drawCircle(center, size.width / 2 - 5, circlePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
