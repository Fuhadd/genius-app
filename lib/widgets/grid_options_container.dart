import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

class GridOptionsContainer extends StatelessWidget {
  final String title, icon;
  final Color? textColor;
  final bool isSelected;
  final void Function()? onTap;
  const GridOptionsContainer({
    super.key,
    this.onTap,
    required this.title,
    required this.icon,
    required this.isSelected,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 150.h,
          width: 150.w,
          decoration: BoxDecoration(
            color: isSelected
                ? CustomColors.green50Color
                : CustomColors.formBgColor,
            borderRadius: BorderRadius.circular(10.r),
            border: isSelected
                ? Border.all(color: CustomColors.green500Color, width: 1)
                : Border.all(color: CustomColors.grey100Color, width: 1),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon,
                  color: (isSelected ? CustomColors.green500Color : null),
                ),
                verticalSpacer(5),
                semiBoldText(
                  title,
                  fontSize: 16.sp,
                  color: textColor ??
                      (isSelected
                          ? CustomColors.green500Color
                          : CustomColors.blackTextColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
