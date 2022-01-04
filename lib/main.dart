import 'package:flutter/material.dart';
import 'package:scedu/pages/root_page.dart';
import 'package:scedu/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'scedU',
      theme: theme,
      home: const RootPage(),
    );
  }
}
