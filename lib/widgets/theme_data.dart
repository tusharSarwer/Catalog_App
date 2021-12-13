// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData lightTheme() => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      );

  static ThemeData darkTheme() => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
      );

  static Color darkBluishColor = Color(0xff403b58);
  static Color creamColor = Color(0xffFFFDD0);
  static Color blue600 = Color(0xff4A6572);
  static Color blue700 = Color(0xff344955);
  static Color blue800 = Color(0xff232F34);
  static Color orange500 = Color(0xffF9AA33);
}
