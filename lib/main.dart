import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl_standalone.dart';
import 'package:scedu/db.dart';
import 'package:scedu/gen/meta.dart';
import 'package:scedu/pages/root_page.dart';
import 'package:scedu/theme.dart';
import 'package:schema_util/schema_util.dart' show Schema;
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await findSystemLocale();

  final schema = Schema.fromJson(
      jsonDecode(await rootBundle.loadString("schema.json")), creators);
  await initDatabase(schema);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'scedU',
      theme: theme,
      supportedLocales: const [
        Locale('de', 'DE'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const RootPage(),
    );
  }
}
