import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xFF1F2242);

const background = Color(0xFF1F2242);
const surface = Color(0xFF39416F);
const strawberryFix = Color(0xFFE36F6F);
const dynamicPixie = Color(0xFF9163BE);
const green = Color(0xFF27AE60);
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

const basicTextStyle = TextStyle(color: highEmphColor);

final textTheme = TextTheme(
  headline1: basicTextStyle.copyWith(fontSize: 32),
  headline2: basicTextStyle.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
  headline3: basicTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
  headline4: basicTextStyle.copyWith(fontSize: 18),
  headline6: basicTextStyle.copyWith(fontSize: 14),
  bodyText1: basicTextStyle.copyWith(fontSize: 14, color: mediumEmphColor),
  bodyText2: basicTextStyle.copyWith(fontSize: 12, color: mediumEmphColor),
  subtitle1: basicTextStyle.copyWith(fontSize: 14, color: mediumEmphColor),
  subtitle2: basicTextStyle.copyWith(fontSize: 14, color: lowEmphColor),
);

final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        minimumSize: MaterialStateProperty.all(const Size(80, 36)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ))));

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
        unselectedItemColor: colorScheme.onSurface.withAlpha(102)),
    elevatedButtonTheme: elevatedButtonTheme);
