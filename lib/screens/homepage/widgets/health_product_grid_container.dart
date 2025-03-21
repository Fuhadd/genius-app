import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

class HealthProductGridContainer extends StatelessWidget {
  final String title, icon;
  final EdgeInsets? iconPadding;
  const HealthProductGridContainer({
    super.key,
    required this.title,
    required this.icon,
    this.iconPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 156.h,
      width: 156.w,
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: CustomColors.grey50Color,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
          ),
          verticalSpacer(10.h),
          semiBoldText(
            title,
            fontSize: 14.sp,
            color: CustomColors.grey500Color,
          )
        ],
      ),
    );
  }
}
