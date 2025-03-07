import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

class MoreActionsWidget extends StatelessWidget {
  final String title, icon;
  final Color? textColor;
  final void Function()? onTap;
  const MoreActionsWidget({
    super.key,
    required this.title,
    required this.icon,
    this.textColor = CustomColors.blackTextColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  icon,
                ),
                horizontalSpacer(12.w),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        semiBoldText(
                          title,
                          fontSize: 14.sp,
                          color: textColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            verticalSpacer(16.h),
            DottedLine(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              lineLength: double.infinity,
              lineThickness: 1.0,
              dashLength: 4.0,
              dashColor: CustomColors.grey100Color,
              dashRadius: 0.0,
              dashGapLength: 4.0,
              // dashGapColor: CustomColors.grey100Color,
              dashGapRadius: 0.0,
            ),
            verticalSpacer(20.h),
          ],
        ),
      ),
    );
  }
}
