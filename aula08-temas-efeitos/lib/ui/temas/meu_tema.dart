import 'package:flutter/material.dart';

ThemeData meuTema() {
  const primaryColor = Color(0xFF12209F);
  const primaryColorDark = Color(0xFF000A4E);
  const primaryColorLight = Color(0xFF3F59FF);

  final campoTextoDecoration = InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: primaryColorDark),
      borderRadius: BorderRadius.circular(20)
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: primaryColorLight),
      borderRadius: BorderRadius.circular(40)
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade500),
      borderRadius: BorderRadius.circular(20)
    )
  );

  final botaoQuadradoTema = ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(primaryColorDark),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 28, vertical: 18)
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
      ),
    ),
  );

  const appBarTema = AppBarTheme(
    color: primaryColorDark,
    titleTextStyle: TextStyle(fontSize: 28, color: Colors.white),
    centerTitle: true
  );

  const textoTema = TextTheme(
    displayLarge: TextStyle(
      fontSize: 34,
      fontWeight: FontWeight.bold,
      color: primaryColorDark
    ),
  );

  return ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColorLight,
    inputDecorationTheme: campoTextoDecoration,
    elevatedButtonTheme: botaoQuadradoTema,
    appBarTheme: appBarTema,
    textTheme: textoTema
  );
}