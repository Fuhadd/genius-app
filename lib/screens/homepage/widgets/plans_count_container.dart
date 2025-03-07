import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

class PlansCountContainer extends StatelessWidget {
  final String title, count, icon;
  final Color bgColor;
  final bool isCurrency;
  const PlansCountContainer({
    super.key,
    required this.title,
    required this.count,
    required this.icon,
    required this.bgColor,
    this.isCurrency = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 184.h,
      width: 160.w,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SvgPicture.asset(
                icon,
                // color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                mediumText(
                  title,
                  fontSize: 16.sp,
                  color: CustomColors.blackTextColor,
                ),
                verticalSpacer(8.h),
                extraBoldText(
                  count,
                  fontSize: 32.sp,
                  color: CustomColors.blackTextColor,
                ),
                Spacer(),
                Container(
                  height: 28.h,
                  width: 28.w,
                  decoration: BoxDecoration(
                    color: CustomColors.whiteColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      ConstantString.chevronRight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
