import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl_standalone.dart';
import 'package:scedu/pages/root_page.dart';
import 'package:scedu/theme.dart';

Future<void> main() async {
  final locale = await findSystemLocale();
  await initializeDateFormatting(locale, null);

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
