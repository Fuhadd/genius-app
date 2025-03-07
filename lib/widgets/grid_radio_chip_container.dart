import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

class GridRadioChipContainer extends StatelessWidget {
  final String title, icon, subtitle;
  final Color? textColor;
  final bool isSelected;
  final void Function()? onTap;
  const GridRadioChipContainer({
    super.key,
    this.onTap,
    required this.title,
    required this.subtitle,
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
          // height: 180.h,
          // width: 10.w,
          decoration: BoxDecoration(
            color: isSelected
                ? CustomColors.green25Color
                : CustomColors.whiteColor,
            borderRadius: BorderRadius.circular(8.r),
            border: isSelected
                ? Border.all(color: CustomColors.green500Color, width: 1)
                : Border.all(color: CustomColors.grey100Color, width: 1),
          ),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  isSelected
                      ? ConstantString.checkedRadioIcon
                      : ConstantString.uncheckedRadioIcon,
                  height: 19,
                ),
                verticalSpacer(8.h),
                semiBoldText(
                  title,
                  fontSize: 14.sp,
                  color: CustomColors.blackTextColor,
                ),
                verticalSpacer(4.h),
                mediumText('$subtitle\n\n',
                    fontSize: 12.sp,
                    color: CustomColors.grey600Color,
                    maxLines: 5),
                verticalSpacer(10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
