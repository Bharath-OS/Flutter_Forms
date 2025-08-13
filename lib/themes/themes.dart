import 'package:flutter/material.dart';

class CustomTheme{
  static final myTheme = ThemeData(
    useMaterial3: false,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'Sora',
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
      centerTitle: true
    ),
  );
}