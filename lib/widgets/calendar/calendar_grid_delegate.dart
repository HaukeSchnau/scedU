import 'package:flutter/rendering.dart';

class CalendarGridDelegate extends SliverGridDelegate {
  final int rows;
  final int cols;
  final double rowSpacing;
  final double colSpacing;

  const CalendarGridDelegate(
      {this.rows = 6, this.cols = 7, this.rowSpacing = 8, this.colSpacing = 8});

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    return CalendarGridLayout(constraints,
        rows: rows, cols: cols, rowSpacing: rowSpacing, colSpacing: colSpacing);
  }

  @override
  bool shouldRelayout(covariant SliverGridDelegate oldDelegate) {
    return true;
  }
}

class CalendarGridLayout extends SliverGridLayout {
  final SliverConstraints constraints;
  final double rowSpacing;
  final double colSpacing;
  final int rows;
  final int cols;

  const CalendarGridLayout(this.constraints,
      {required this.rows,
      required this.cols,
      required this.rowSpacing,
      required this.colSpacing});

  @override
  double computeMaxScrollOffset(int childCount) {
    return constraints.viewportMainAxisExtent;
  }

  @override
  SliverGridGeometry getGeometryForChildIndex(int index) {
    final crossAxisExtent =
        (constraints.crossAxisExtent - colSpacing * (cols - 1)) / cols;
    final mainAxisExtent =
        (constraints.viewportMainAxisExtent - rowSpacing * (rows - 1)) / rows;
    final colIndex = index % 7;
    final rowIndex = index ~/ cols;
    return SliverGridGeometry(
        crossAxisExtent: crossAxisExtent,
        crossAxisOffset: colIndex * (crossAxisExtent + colSpacing),
        mainAxisExtent: mainAxisExtent,
        scrollOffset: rowIndex * (mainAxisExtent + rowSpacing));
  }

  @override
  int getMaxChildIndexForScrollOffset(double scrollOffset) {
    return rows * cols;
  }

  @override
  int getMinChildIndexForScrollOffset(double scrollOffset) {
    return 0;
  }
}
