import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

class OtherProductContainer extends StatelessWidget {
  final String title, icon;
  const OtherProductContainer({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: Container(
        height: 105.h,
        width: 115.w,
        decoration: BoxDecoration(
          color: CustomColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: CustomColors.grey50Color,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    );
  }
}
