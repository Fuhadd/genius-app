import 'package:flutter/material.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/utils/custom_text_styles.dart';

Widget extraBoldText(
  String title, {
  Key? key,
  double? fontSize = 13,
  Color? color = CustomColors.blackTextColor,
  TextAlign? textAlign,
  int? maxLines,
  double? height = 1.40,
  double? letterSpacing = 0,
  TextDecoration? decoration,
}) =>
    Text(
      title,
      key: key,
      textAlign: textAlign,
      maxLines: maxLines,
      style: CustomTextStyles.extraBoldText(
        height: height,
        fontSize: fontSize,
        color: color,
        letterSpacing: letterSpacing,
        decoration: decoration,
      ),
    );

Widget boldText(
  String title, {
  Key? key,
  double? fontSize = 13,
  Color? color = CustomColors.blackTextColor,
  TextAlign? textAlign,
  int? maxLines,
  double? height = 1.40,
  double? letterSpacing = 0,
  TextDecoration? decoration,
}) =>
    Text(
      title,
      key: key,
      textAlign: textAlign,
      maxLines: maxLines,
      style: CustomTextStyles.bold(
        height: height,
        fontSize: fontSize,
        color: color,
        letterSpacing: letterSpacing,
        decoration: decoration,
      ),
    );

Widget semiBoldText(
  String title, {
  Key? key,
  double? fontSize = 13,
  Color? color = CustomColors.blackTextColor,
  TextAlign? textAlign,
  int? maxLines,
  double? height = 1.40,
  double? letterSpacing = 0,
  TextDecoration? decoration,
}) =>
    Text(
      title,
      key: key,
      textAlign: textAlign,
      maxLines: maxLines,
      style: CustomTextStyles.semiBold(
        height: height,
        fontSize: fontSize,
        color: color,
        letterSpacing: letterSpacing,
        decoration: decoration,
      ),
    );

Widget regularText(
  String title, {
  Key? key,
  double? fontSize = 13,
  Color? color = CustomColors.blackTextColor,
  TextAlign? textAlign,
  int? maxLines,
  double? height = 1.40,
  double? letterSpacing = 0,
  TextDecoration? decoration,
}) =>
    Text(
      title,
      key: key,
      textAlign: textAlign,
      maxLines: maxLines,
      style: CustomTextStyles.regular(
        fontSize: fontSize,
        color: color,
        height: height,
        letterSpacing: letterSpacing,
        decoration: decoration,
      ),
    );

Widget mediumText(
  String title, {
  Key? key,
  double? fontSize = 13,
  Color? color,
  TextAlign? textAlign,
  int? maxLines,
  double? height = 1.40,
  double? letterSpacing = 0,
  TextDecoration? decoration,
}) =>
    Text(
      title,
      key: key,
      textAlign: textAlign,
      maxLines: maxLines,
      style: CustomTextStyles.medium(
        fontSize: fontSize,
        color: color,
        height: height,
        letterSpacing: letterSpacing,
        decoration: decoration,
      ),
    );
