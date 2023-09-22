import 'package:flutter/material.dart';

import 'color.dart';

class ThemeArabe {
  static ThemeData themeAr = ThemeData(
    textTheme: TextTheme(
      headline1: TextStyle(
        color: AppColor.black,
        fontSize: 20, //20
        fontWeight: FontWeight.bold,
        fontFamily: "Cairo",
      ),
      headline2: TextStyle(
        color: AppColor.black,
        fontSize: 24, //24
        fontWeight: FontWeight.bold,
        fontFamily: "Cairo",
      ),
      bodyText1: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontWeight: FontWeight.bold,
        fontSize: 14, //14
        // fontFamily: "Cairo",
      ),
      bodyText2: TextStyle(
        height: 2,
        color: AppColor.grey,
        fontSize: 14, //14
        // fontFamily: "Cairo",
      ),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  );
}
