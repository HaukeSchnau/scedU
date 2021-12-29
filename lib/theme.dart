import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xFF1F2242);

const basicTextStyle = TextStyle(color: Colors.white);

final textTheme = TextTheme(headline1: basicTextStyle.copyWith(fontSize: 32, fontWeight: FontWeight.bold));

final theme = ThemeData(fontFamily: "Poppins", textTheme: GoogleFonts.poppinsTextTheme(textTheme));
