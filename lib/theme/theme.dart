import 'package:flutter/material.dart';

final myTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.indigo,
  scaffoldBackgroundColor: Colors.grey[500],
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.indigo),
    ),
  ),
  secondaryHeaderColor: Colors.red,
);
