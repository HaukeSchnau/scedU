import 'package:flutter/material.dart';

import '../../theme.dart';

void openCustomModal(BuildContext context, Widget widget) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    isScrollControlled: true,
    builder: (context) => Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
            color: surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
        child: widget),
  );
}
