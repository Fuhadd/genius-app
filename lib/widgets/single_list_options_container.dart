import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

class SingleListOptionsContainer extends StatelessWidget {
  final String title, icon;
  final String? selectedIcon;
  final Color? textColor, bgColor;
  final bool isSelected;
  final void Function()? onTap;
  final bool boldenText;
  final double? padding;
  const SingleListOptionsContainer({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
    required this.isSelected,
    this.textColor,
    this.selectedIcon,
    this.boldenText = true,
    this.padding,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        // height: 85,
        decoration: BoxDecoration(
          color: bgColor ??
              (isSelected
                  ? CustomColors.green50Color
                  : CustomColors.formBgColor),
          borderRadius: BorderRadius.circular(10.r),
          border: isSelected
              ? Border.all(color: CustomColors.green500Color, width: 1)
              : Border.all(color: CustomColors.grey100Color, width: 1),
        ),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 15.w, vertical: padding ?? 20.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isSelected && selectedIcon != null
                  ? SvgPicture.asset(
                      selectedIcon!,
                    )
                  : SvgPicture.asset(
                      icon,
                      color: (isSelected ? CustomColors.green500Color : null),
                    ),
              horizontalSpacer(10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isSelected && boldenText
                        ? semiBoldText(
                            title,
                            fontSize: 16.sp,
                            color: (isSelected
                                ? CustomColors.green500Color
                                : textColor ?? CustomColors.green400Color),
                          )
                        : mediumText(
                            title,
                            fontSize: 16.sp,
                            color: (textColor ?? CustomColors.green400Color),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
