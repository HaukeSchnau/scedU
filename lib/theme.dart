import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xFF1F2242);

const background = Color(0xFF1F2242);
const surface = Color(0xFF39416F);
const strawberryFix = Color(0xFFE36F6F);
const dynamicPixie = Color(0xFF9163BE);
const onSurface = Color(0xFF68709B);
const highEmphColor = Color(0xFFFFFFFF);
const mediumEmphColor = Color(0xCCFFFFFF);
const lowEmphColor = Color(0x99FFFFFF);

const colorScheme = ColorScheme(
    primary: dynamicPixie,
    primaryVariant: dynamicPixie,
    secondary: dynamicPixie,
    secondaryVariant: dynamicPixie,
    surface: surface,
    background: background,
    error: strawberryFix,
    onPrimary: highEmphColor,
    onSecondary: highEmphColor,
    onSurface: highEmphColor,
    onBackground: highEmphColor,
    onError: highEmphColor,
    brightness: Brightness.dark);

const basicTextStyle = TextStyle(color: Colors.white);

final textTheme = TextTheme(
    headline1:
        basicTextStyle.copyWith(fontSize: 32, fontWeight: FontWeight.bold));

final theme = ThemeData(
    fontFamily: "Poppins",
    textTheme: GoogleFonts.poppinsTextTheme(textTheme),
    colorScheme: colorScheme,
    backgroundColor: colorScheme.background,
    cardColor: colorScheme.surface,
    errorColor: colorScheme.error,
    scaffoldBackgroundColor: colorScheme.background,
    bottomAppBarColor: colorScheme.surface,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.onSurface,
        unselectedItemColor: colorScheme.onSurface.withAlpha(102)));
