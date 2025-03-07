import 'package:flutter/material.dart';

class CustomTextStyles {
  static TextStyle extraBoldText({
    double? fontSize = 13,
    Color? color,
    double? height = 1.40,
    double? letterSpacing = 0,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: "VisbyExtrabold",
        // fontWeight: FontWeight.w600,
        fontSize: fontSize,
        color: color,
        height: height,
        letterSpacing: letterSpacing,
        decoration: decoration,
      );

  static TextStyle bold({
    double? fontSize = 13,
    Color? color,
    double? height = 1.40,
    double? letterSpacing = 0,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: "VisbyBold",
        // fontWeight: FontWeight.w600,
        fontSize: fontSize,
        color: color,
        height: height,
        letterSpacing: letterSpacing,
        decoration: decoration,
      );

  static TextStyle semiBold({
    double? fontSize = 13,
    Color? color,
    double? height = 1.40,
    double? letterSpacing = 0,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: "VisbySemibold",
        // fontWeight: FontWeight.w600,
        fontSize: fontSize,
        color: color,
        height: height,
        letterSpacing: letterSpacing,
        decoration: decoration,
      );

  static TextStyle regular({
    double? fontSize = 13,
    Color? color,
    double? height = 1.40,
    double? letterSpacing = 0,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: "VisbyRegular",
        fontSize: fontSize,
        color: color,
        height: height,
        letterSpacing: letterSpacing,
        decoration: decoration,
      );

  static TextStyle medium({
    double? fontSize = 13,
    Color? color,
    double? height = 1.40,
    double? letterSpacing = 0,
    TextDecoration? decoration,
  }) =>
      TextStyle(
        fontFamily: "VisbyMedium",
        // fontWeight: FontWeight.w500,
        fontSize: fontSize,
        color: color,
        height: height,
        letterSpacing: letterSpacing,
        decoration: decoration,
      );
}
