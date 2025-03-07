import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

class PlansContainer extends StatelessWidget {
  final String title, subtitle, minPrice, period, icon;
  final Color bgColor;
  final bool isCurrency;
  const PlansContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.minPrice,
    required this.period,
    required this.icon,
    required this.bgColor,
    this.isCurrency = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Container(
        height: 240.h,
        width: 240.w,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(
            color: CustomColors.whiteColor,
            width: 2.w,
          ),
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
                horizontal: 14.w,
                vertical: 24.h,
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  semiBoldText(
                    title,
                    fontSize: 16.sp,
                    color: CustomColors.orange950Color,
                  ),
                  verticalSpacer(8),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "From ",
                          style: CustomTextStyles.semiBold(
                            fontSize: 16.sp,
                            color: CustomColors.orange950Color,
                          ),
                        ),
                        TextSpan(
                            text: isCurrency ? '₦' : '',
                            style: TextStyle(
                              fontFamily: '',
                              fontWeight: FontWeight.w800,
                              fontSize: 18.sp,
                              color: CustomColors.orange950Color,
                            )),
                        TextSpan(
                          text: minPrice,
                          style: CustomTextStyles.extraBoldText(
                            fontSize: 18.sp,
                            color: CustomColors.orange950Color,
                          ),
                        ),
                        TextSpan(
                          text: period,
                          style: CustomTextStyles.semiBold(
                            fontSize: 16.sp,
                            color: CustomColors.orange950Color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(10.h),
                  Divider(
                    color: CustomColors.lightOrangeColor,
                  ),
                  verticalSpacer(10.h),
                  mediumText(
                    subtitle,
                    fontSize: 12.sp,
                    color: CustomColors.orange900Color,
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
      ),
    );
  }
}
