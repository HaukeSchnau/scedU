import 'package:flutter/material.dart';

class PageData {
  final String label;
  final IconData icon;
  final Widget page;
  final bool scrollable;

  PageData(
      {required this.label,
      required this.icon,
      required this.page,
      this.scrollable = true});
}
