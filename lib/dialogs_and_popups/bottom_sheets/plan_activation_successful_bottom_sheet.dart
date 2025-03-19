import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:genius_app/widgets/dotted_separator.dart';

// Main widget for the screen
class PlanActivationSuccessfulBottomSheet extends StatefulWidget {
  const PlanActivationSuccessfulBottomSheet({super.key});

  @override
  State<PlanActivationSuccessfulBottomSheet> createState() =>
      _PlanActivationSuccessfulBottomSheetState();
}

class _PlanActivationSuccessfulBottomSheetState
    extends State<PlanActivationSuccessfulBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Section 1: Benefits after 24hrs of purchase
            verticalSpacer(32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Plan activation successful! 🥳',
                      style: CustomTextStyles.bold(fontSize: 20.sp),
                    ),
                  ],
                ),
              ],
            ),
            verticalSpacer(32.h),

            // Section 2: General consultation
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlanBenefitSectionSingleItemWidget(
                    titleWidget: SizedBox.shrink(),
                    bulletPointPadding: EdgeInsets.only(bottom: 14.h),
                    bulletPoints: [
                      'This plan becomes active in 23:40:30 hours.',
                      'You can get quality treatment from any of our listed hospitals under your plan across Nigeria with your HMO I.D.'
                    ]),
                Row(
                  children: [
                    SvgPicture.asset(
                      ConstantString.ellipseIcon,
                      colorFilter: ColorFilter.mode(
                          CustomColors.orange500Color, BlendMode.srcIn),
                    ),
                    horizontalSpacer(10.w),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Contact support ',
                            style: CustomTextStyles.semiBold(
                              color: CustomColors.green500Color,
                              fontSize: 14.sp,
                            )),
                        TextSpan(
                            text: 'if you need assistance. ',
                            style: CustomTextStyles.medium(
                              color: CustomColors.primaryGreenColor,
                              fontSize: 14.sp,
                            )),
                      ]),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PlanBenefitSectionSingleItemWidget extends StatelessWidget {
  const PlanBenefitSectionSingleItemWidget({
    super.key,
    required this.titleWidget,
    required this.bulletPoints,
    this.bulletPointPadding,
  });

  final Widget titleWidget;
  final List<String> bulletPoints;
  final EdgeInsets? bulletPointPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 62.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          titleWidget,
          verticalSpacer(10.h),
          ListView.builder(
            itemCount: bulletPoints.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: bulletPointPadding ?? EdgeInsets.zero,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          ConstantString.ellipseIcon,
                          colorFilter: ColorFilter.mode(
                              CustomColors.orange500Color, BlendMode.srcIn),
                        ),
                        horizontalSpacer(10.w),
                        Expanded(
                          child: mediumText(bulletPoints[index],
                              color: CustomColors.grey800Color,
                              fontSize: 12.sp),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
