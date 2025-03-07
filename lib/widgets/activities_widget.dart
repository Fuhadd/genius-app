import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

class ActivitiesWidget extends StatelessWidget {
  final String icon, title, subTitle, date;
  final Color color;
  final bool showDivider;
  const ActivitiesWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.date,
    required this.color,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
          child: Row(
            children: [
              Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    icon,
                  ),
                ),
              ),
              horizontalSpacer(10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    semiBoldText(
                      title,
                      fontSize: 14.sp,
                      color: CustomColors.blackTextColor,
                    ),
                    verticalSpacer(2.h),
                    mediumText(
                      subTitle,
                      fontSize: 12.sp,
                      color: CustomColors.grey600Color,
                    ),
                  ],
                ),
              ),
              mediumText(
                date,
                fontSize: 12.sp,
                color: CustomColors.grey500Color,
              ),
            ],
          ),
        ),
        showDivider
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Divider(),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
