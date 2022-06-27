import 'package:flutter/material.dart';
import 'package:ryspar/core/constants/colors.dart';

class CustomThemeData {
  static ThemeData themeData() {
    return ThemeData(
      primarySwatch: Colors.lightBlue,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: CustomColors.green),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      textTheme: TextTheme(
          headline1: TextStyle(
            color: CustomColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          headline2: TextStyle(
            color: CustomColors.green,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          bodyText1: TextStyle(
            color: CustomColors.black,
            fontWeight: FontWeight.w300,
            fontSize: 16,
          ),
          bodyText2: TextStyle(
            color: CustomColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          headline3: TextStyle(
            color: CustomColors.green,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          headline4: TextStyle(
            color: CustomColors.greyDark,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          )),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
            CustomColors.green,
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              color: CustomColors.green,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            CustomColors.green,
          ),
          foregroundColor: MaterialStateProperty.all<Color>(
            Colors.white,
          ),
          minimumSize: MaterialStateProperty.all<Size>(
            const Size(double.infinity, 50),
          ),
          maximumSize: MaterialStateProperty.all<Size>(
            const Size(double.infinity, 50),
          ),
          fixedSize: MaterialStateProperty.all<Size>(
            const Size(double.infinity, 50),
          ),
        ),
      ),
      iconTheme: IconThemeData(
        color: CustomColors.green,
      ),
    );
  }
}
