import 'package:flutter/material.dart';
import 'package:funny_macro/Constants/style.dart';

ThemeData kThemeData = ThemeData(
  primaryColor: kPrimaryColor,
  primaryColorDark: kPrimaryColor,
  colorScheme: const ColorScheme.dark(
      background: kSecondaryColor,
      onBackground: kSecondaryColor,
      primary: kPrimaryColor,
      onPrimary: Colors.white),
  scaffoldBackgroundColor: kSecondaryColor,
  primarySwatch: const MaterialColor(
    0xffc11489, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xfffce6f5), //10%
      100: Color(0xfff8c1e6), //20%
      200: Color(0xfff897d6), //30%
      300: Color(0xfffb6bc3), //40%
      400: Color(0xfffe45b2), //50%
      500: Color(0xffff0c9e), //60%
      600: Color(0xfff01099), //70%
      700: Color(0xffd81390), //80%
      800: Color(0xffc1148a), //90%
      900: Color(0xff981380), //100%
    },
  ),
);
