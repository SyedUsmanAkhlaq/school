import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppTheme {
  static const primaryColor = Color(0xFF8957DF);
  static const accentColor = Colors.white;

  static Color _errorColor = Colors.red[600];

  static ThemeData data() => ThemeData(
        primaryColor: primaryColor,
        accentColor: Colors.green,
        appBarTheme: _appBarTheme(),
        textTheme: _textTheme(),
        tabBarTheme: _tabBarTheme(),
        inputDecorationTheme: _inputDecorationTheme(),
        popupMenuTheme: _popUpMenuThemeData(),
        scaffoldBackgroundColor: Color(0xFFf6f5f5),
        backgroundColor: Colors.white70,
        errorColor: _errorColor,
        cardColor: Color(0xFFF5F7F9),
        splashColor: Colors.blueGrey[100].withOpacity(.05),
        highlightColor: Colors.blueGrey[200].withOpacity(.25),
        dividerColor: Color(0xAAE4E9E7),
        cupertinoOverrideTheme: _cupertinoOverrideTheme(),
        textSelectionTheme: _textSelectionTheme(),
        textButtonTheme: _textButtonTheme(),
        elevatedButtonTheme: _elevatedButtonTheme(),
        canvasColor:
            Colors.transparent, //This is necessary for bottomSheet to work.
      );

  static ElevatedButtonThemeData _elevatedButtonTheme() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          // shape:
        ),
      );

  static TextButtonThemeData _textButtonTheme() => TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: primaryColor,
        ),
      );

  static AppBarTheme _appBarTheme() => AppBarTheme(
        elevation: 0,
        color: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
        textTheme: _textTheme(),
      );

  static TextTheme _textTheme() => TextTheme(
        headline5: TextStyle(
          fontFamily: "Avenir",
          color: Color(0xFF9BA4A1),
        ),
        headline6: TextStyle(
          fontFamily: "Avenir",
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 18,
          height: 1.2,
        ),
        subtitle1: TextStyle(
          fontWeight: FontWeight.w700,
          fontFamily: "Avenir",
        ),
        subtitle2: TextStyle(
          color: Colors.black,
          fontFamily: "Avenir",
        ),
        caption: TextStyle(
          color: Colors.grey,
          fontFamily: "Avenir",
          height: 1.2,
          fontWeight: FontWeight.w500,
        ),
        bodyText1: TextStyle(
          fontFamily: "Avenir",
          color: Colors.grey[800],
          fontWeight: FontWeight.w500,
        ),
        button: TextStyle(
          fontFamily: "Avenir",
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
          color: Colors.white,
        ),
      );

  static TabBarTheme _tabBarTheme() => TabBarTheme(
        labelColor: primaryColor,
        unselectedLabelColor: Colors.black,
        labelStyle: TextStyle(
          fontFamily: "Avenir",
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: "Avenir",
          color: Colors.grey[500],
          fontWeight: FontWeight.w500,
        ),
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: primaryColor, width: 4),
          ),
        ),
      );

  static InputDecorationTheme _inputDecorationTheme() => InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        errorStyle: TextStyle(
          color: _errorColor,
          fontSize: 13,
          fontFamily: 'Avenir',
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        labelStyle: TextStyle(
          color: Colors.grey[600],
          fontSize: 14.5,
          fontFamily: 'Avenir',
        ),
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      );

  static CupertinoThemeData _cupertinoOverrideTheme() => CupertinoThemeData(
        primaryColor: primaryColor,
        textTheme: CupertinoTextThemeData(
          primaryColor: primaryColor,
          actionTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  static PopupMenuThemeData _popUpMenuThemeData() => PopupMenuThemeData(
        elevation: 15,
        color: Colors.white,
        textStyle: TextStyle(
          color: Colors.grey[800],
          fontWeight: FontWeight.w500,
          fontSize: 12,
          fontFamily: "Avenir",
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(
            color: Colors.grey[300],
            width: 2,
          ),
        ),
      );

  static TextSelectionThemeData _textSelectionTheme() => TextSelectionThemeData(
        cursorColor: accentColor,
        selectionHandleColor: accentColor,
        selectionColor: accentColor.withOpacity(.1),
      );
}
