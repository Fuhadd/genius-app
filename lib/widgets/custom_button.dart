// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:genius_app/constants/custom_colors.dart';
// import 'package:genius_app/widgets/custom_text_widget.dart';
// import 'package:shadcn_ui/shadcn_ui.dart';

// class CustomButton extends StatelessWidget {
//   const CustomButton({
//     super.key,
//     required this.title,
//     this.color,
//     this.textColor,
//     this.onTap,
//     this.borderColor,
//   });
//   final String title;
//   final Color? color;
//   final Color? textColor, borderColor;
//   final void Function()? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return ShadButton(
//       hoverBackgroundColor: onTap == null
//           ? CustomColors.grey300Color
//           : color ?? CustomColors.green400Color,
//       height: 60.h,
//       width: double.infinity,
//       decoration: ShadDecoration(
//         color: Colors.red,
//         border: ShadBorder(
//           radius: BorderRadius.circular(200),
//         ),

//       ),
//       backgroundColor: onTap == null
//           ? CustomColors.grey300Color
//           : color ?? CustomColors.green400Color,
//       onPressed: onTap,
//       child: semiBoldText(
//         title,
//         fontSize: 16,
//         color: textColor ?? CustomColors.whiteColor,
//         height: 1.40,
//         letterSpacing: 0,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

import '../constants/custom_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final String? routeName;
  final Color? textColor;
  final bool isLoading;
  final bool isBoldTitle;
  final bool borderButton;
  final double? width, height;
  final void Function()? onTap;
  final Color? buttonColor, borderColor;
  final double? fontSize;
  final double? borderRadius;
  final bool isOutlined;

  const CustomButton({
    super.key,
    required this.title,
    this.routeName,
    this.onTap,
    this.isLoading = false,
    this.isBoldTitle = true,
    this.borderButton = false,
    this.width,
    this.height,
    this.buttonColor = CustomColors.green400Color,
    this.textColor = CustomColors.whiteColor,
    this.borderRadius,
    this.fontSize,
    this.isOutlined = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading
          ? null
          : onTap ??
              () {
                // Navigator.pushNamed(context, routeName!);
                // Navigator.canPop(context) ? Navigator.pop(context) : null;
              },
      child: Container(
        height: height ?? 60.h, //56
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: onTap == null
              ? CustomColors.grey300Color
              : isLoading
                  ? buttonColor!.withOpacity(0.5)
                  : buttonColor,
          border: borderColor != null ? Border.all(color: borderColor!) : null,
          borderRadius: BorderRadius.circular(borderRadius ?? 200),
        ),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            semiBoldText(
              title,
              fontSize: 16,
              color: textColor ?? CustomColors.whiteColor,
              height: 1.40,
              letterSpacing: 0,
            ),
            isLoading
                ? Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: SpinKitFadingCircle(
                        color: textColor ?? CustomColors.whiteColor,
                        size: 25.0,
                      ),

                      // CircularProgressIndicator(
                      //   color: textColor,
                      // ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        )),
      ),
    );
  }
}
