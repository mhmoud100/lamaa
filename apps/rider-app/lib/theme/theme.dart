import 'package:flutter/material.dart';
import '../theme/pallete.dart';

mixin CustomTheme {
  static final ThemeData theme1 = ThemeData(
    primarySwatch: Palette.kToDark,
    fontFamily: 'Inter',
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 0, padding: const EdgeInsets.all(16))),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade200))),
  );
}
