import 'dart:ui';
import 'package:flutter/material.dart';
class AppTheme {
  static const Color PRIMARY_COLOR = Color(0xFF0A3B8C);
  static const Color SECONDARY_COLOR = Color(0xFF889DD6);
  static const Color WHITE_COLOR = Color(0xFFFFFFFF);
  static const Color CANCEL_BUTTON_COLOR = Color(0xFFFF3030);
  static const Color CARD_COLOR = Color(0xFF1E3E94);

  // ignore: non_constant_identifier_names
  static final LIGHT = ThemeData.light().copyWith(
    primaryColor: PRIMARY_COLOR,
    accentColor: SECONDARY_COLOR,
    cardTheme: const CardTheme(color: CARD_COLOR),
    primaryTextTheme: _createConsistentTextThemeWithColor(SECONDARY_COLOR),
    accentTextTheme: _createConsistentTextThemeWithColor(WHITE_COLOR),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: PRIMARY_COLOR,
    ),
    primaryIconTheme: IconThemeData(
      size: 16,
      color: PRIMARY_COLOR),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: PRIMARY_COLOR,
          fontSize: 24.0,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
        ),
      ),
      color: PRIMARY_COLOR,
    ),
  );

  static TextTheme _createConsistentTextThemeWithColor(Color color) {
    var defaultTextStyle = TextStyle(
      color: color,
      fontFamily: 'Montserrat',
      fontSize: 14.0
    );
    return TextTheme(
      subtitle1: defaultTextStyle,
      bodyText1: defaultTextStyle,
    );
  }
}
