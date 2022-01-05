import 'package:flutter/material.dart';
import 'package:scedu/theme.dart';

class BasicBar extends StatelessWidget {
  final Gradient? gradient;
  final Color? backgroundColor;
  final double fraction;

  const BasicBar(
      {Key? key, this.gradient, this.backgroundColor, this.fraction = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 1,
      widthFactor: fraction,
      child: Container(
        decoration: BoxDecoration(
            gradient: gradient,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(9999)),
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final double progress;

  const ProgressBar(this.progress, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const BasicBar(
            backgroundColor: onSurface,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: BasicBar(
              fraction: progress,
              gradient: const LinearGradient(
                  colors: [dynamicPixie, strawberryFix],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
            ),
          )
        ],
      ),
    );
  }
}
