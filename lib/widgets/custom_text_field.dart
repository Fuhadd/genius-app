import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

FormBuilderTextField customTextField(String name, String labelText,
    {String? hintText,
    Widget? prefix,
    IconData? prefixIcon,
    IconData? suffixIcon,
    String? initialValue,
    bool isHint = false,
    bool obscureText = false,
    String? helperText,
    Widget? suffix,
    String? Function(String?)? validator,
    void Function()? onSuffixTap,
    void Function(String?)? onChanged}) {
  return FormBuilderTextField(
    initialValue: initialValue,
    // cursorColor: CustomColors.green500Color,
    name: name,
    obscuringCharacter: "*",
    obscureText: obscureText,
    validator: validator,
    onChanged: onChanged,
    style: CustomTextStyles.semiBold(
      fontSize: 16.sp,
      color: CustomColors.greenTextColor,
    ),
    decoration: customFormDecoration(
      hintText,
      labelText,
      prefixIcon,
      suffixIcon,
      prefix: prefix,
      helperText: helperText,
      onSuffixTap: onSuffixTap,
      suffix: suffix,
    ),
  );
}

InputDecoration customFormDecoration(
  String? hintText,
  String labelText,
  IconData? prefixIcon,
  IconData? suffixIcon, {
  String? helperText,
  Widget? prefix,
  bool isHint = false,
  void Function()? onSuffixTap,
  Widget? suffix,
}) {
  return InputDecoration(
    // hintText: isHint ? '' : hintText,
    hintText: labelText,
    prefix: prefix,
    helperText: helperText,

    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    helperMaxLines: 7,
    helperStyle: const TextStyle(fontSize: 13),
    // floatingLabelStyle: CustomTextStyles.regular(
    //   fontSize: 15.sp,
    //   color: CustomColors.grey600Color,
    // ),

    filled: true,
    fillColor: CustomColors.formBgColor,

    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: CustomColors.green500Color,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),

    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),

    prefixIcon: prefixIcon == null
        ? null
        : Icon(
            prefixIcon,
            size: 16,
            color: CustomColors.blackColor.withOpacity(0.6),
          ),
    // prefixIconColor: Colors.red,
    // suffixIcon: GestureDetector(
    //   onTap: onSuffixTap,
    //   child: Icon(
    //     suffixIcon,
    //     size: 20,
    //     color: CustomColors.blackTextColor,
    //   ),
    // ),
    suffixIcon: suffix == null
        ? null
        : GestureDetector(
            onTap: onSuffixTap,
            child: suffix,
          ),
    labelText: labelText,
    hintStyle: CustomTextStyles.medium(
      fontSize: 16.sp,
      color: CustomColors.grey600Color,
    ),
    labelStyle: CustomTextStyles.medium(
      fontSize: 16.sp,
      color: CustomColors.grey600Color,
    ),
  );
}

Widget customTextFieldWithText(String name, String labelText,
    {required String title,
    String? hintText,
    Widget? prefix,
    IconData? prefixIcon,
    IconData? suffixIcon,
    String? initialValue,
    bool isHint = false,
    bool obscureText = false,
    bool showTitle = true,
    String? helperText,
    Widget? suffix,
    int? maxLines = 1,
    String? Function(String?)? validator,
    void Function()? onSuffixTap,
    void Function(String?)? onChanged}) {
  return Column(
    children: [
      showTitle
          ? Row(
              children: [
                mediumText(
                  title,
                  fontSize: 16.sp,
                  color: CustomColors.greenTextColor,
                ),
              ],
            )
          : SizedBox.shrink(),
      showTitle ? verticalSpacer(12.sp) : SizedBox.shrink(),
      FormBuilderTextField(
        initialValue: initialValue,
        // cursorColor: CustomColors.green500Color,
        name: name,
        obscuringCharacter: "*",
        maxLines: maxLines,
        obscureText: obscureText,
        validator: validator,
        onChanged: onChanged,
        style: CustomTextStyles.semiBold(
          fontSize: 16.sp,
          color: CustomColors.greenTextColor,
        ),
        decoration: customFormDecorationWithText(
          hintText,
          labelText,
          prefixIcon,
          suffixIcon,
          prefix: prefix,
          helperText: helperText,
          onSuffixTap: onSuffixTap,
          suffix: suffix,
        ),
      ),
    ],
  );
}

InputDecoration customFormDecorationWithText(
  String? hintText,
  String labelText,
  IconData? prefixIcon,
  IconData? suffixIcon, {
  String? helperText,
  Widget? prefix,
  bool isHint = false,
  void Function()? onSuffixTap,
  Widget? suffix,
}) {
  return InputDecoration(
    // hintText: isHint ? '' : hintText,
    hintText: labelText,
    prefix: prefix,
    helperText: helperText,

    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    helperMaxLines: 7,
    helperStyle: const TextStyle(fontSize: 13),
    // floatingLabelStyle: CustomTextStyles.regular(
    //   fontSize: 15.sp,
    //   color: CustomColors.grey600Color,
    // ),

    filled: true,
    fillColor: CustomColors.formBgColor,

    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: CustomColors.grey100Color,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: CustomColors.green500Color,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),

    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),

    prefixIcon: prefixIcon == null
        ? null
        : Icon(
            prefixIcon,
            size: 16,
            color: CustomColors.blackColor.withOpacity(0.6),
          ),
    // prefixIconColor: Colors.red,
    // suffixIcon: GestureDetector(
    //   onTap: onSuffixTap,
    //   child: Icon(
    //     suffixIcon,
    //     size: 20,
    //     color: CustomColors.blackTextColor,
    //   ),
    // ),
    suffixIcon: suffix == null
        ? null
        : GestureDetector(
            onTap: onSuffixTap,
            child: suffix,
          ),
    labelText: labelText,
    hintStyle: CustomTextStyles.medium(
      fontSize: 16.sp,
      color: CustomColors.grey600Color,
    ),
    labelStyle: CustomTextStyles.medium(
      fontSize: 16.sp,
      color: CustomColors.grey600Color,
    ),
  );
}
