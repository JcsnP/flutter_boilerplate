import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const FlexSchemeData flexSchemeData = FlexSchemeData(
    name: 'Red & Blue',
    description: 'https://rydmike.com/flexcolorscheme/themesplayground-latest/',
    light: FlexSchemeColor(
      primary: Color(0xff1145a4),
      primaryContainer: Color(0xffacc7f6),
      secondary: Color(0xffb61d1d),
      secondaryContainer: Color(0xffec9f9f),
      tertiary: Color(0xff376bca),
      tertiaryContainer: Color(0xffcfdbf2),
      appBarColor: Color(0xffcfdbf2),
      error: Color(0xffb00020),
    ),
    dark: FlexSchemeColor(
      primary: Color(0xffc4d7f8),
      primaryContainer: Color(0xff577cbf),
      secondary: Color(0xfff1bbbb),
      secondaryContainer: Color(0xffcb6060),
      tertiary: Color(0xffdde5f5),
      tertiaryContainer: Color(0xff7297d9),
      appBarColor: Color(0xffdde5f5),
      error: null,
    ),
  );
}
