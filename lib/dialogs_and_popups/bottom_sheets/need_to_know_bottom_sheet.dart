import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:genius_app/widgets/dotted_separator.dart';

class NeedToKnowBottomSheet extends StatelessWidget {
  const NeedToKnowBottomSheet({super.key});

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
                SvgPicture.asset(
                  ConstantString.needToKnowIcon,
                ),
                horizontalSpacer(12.w),
                Column(
                  children: [
                    Text(
                      'Need to know',
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
                semiBoldText('H.M.O ID is a requirement at the hospital',
                    fontSize: 14.sp),
                verticalSpacer(10.h),
                mediumText(
                    'Your H.M.O ID contains an enrolment number that you present at the hospital to access care. Always keep it handy, as it is required for treatment at any listed hospital.',
                    fontSize: 12.sp),
                verticalSpacer(12.h),
                DottedSeparator(
                  color: CustomColors.grey100Color,
                ),
                verticalSpacer(12.h),
                semiBoldText('Unlock more benefits with consistent renewal',
                    fontSize: 14.sp),
                mediumText(
                    "The longer you stay on your plan, the more benefits you unlock! Keeping your subscription active ensures continuous access to valuable perks. If you miss a renewal, your benefits will reset, and you'll only have access to the base benefits available from the first month of your plan.",
                    fontSize: 12.sp),
                verticalSpacer(12.h),
                DottedSeparator(
                  color: CustomColors.grey100Color,
                ),
                verticalSpacer(12.h),
                semiBoldText('Plan renewal', fontSize: 14.sp),
                mediumText(
                    "To keep your coverage seamless, renew your plan before it expires or on the expiry date.",
                    fontSize: 12.sp),
                verticalSpacer(12.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      ConstantString.ellipseIcon,
                      colorFilter: ColorFilter.mode(
                          CustomColors.orange500Color, BlendMode.srcIn),
                    ),
                    horizontalSpacer(5.w),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'If you renew within 7 days after expiry, your plan will reactivate within',
                              style: CustomTextStyles.medium(
                                  color: CustomColors.grey800Color,
                                  fontSize: 12.sp),
                            ),
                            TextSpan(
                              text: ' 24 hours ',
                              style: CustomTextStyles.medium(
                                  color: CustomColors.orange500Color,
                                  fontSize: 12.sp),
                            ),
                            TextSpan(
                              text: '.',
                              style: CustomTextStyles.medium(
                                  color: CustomColors.grey800Color,
                                  fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                verticalSpacer(12.h),
                Row(
                  children: [
                    SvgPicture.asset(
                      ConstantString.ellipseIcon,
                      colorFilter: ColorFilter.mode(
                          CustomColors.orange500Color, BlendMode.srcIn),
                    ),
                    horizontalSpacer(5.w),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'If you renew within 7 days after expiry, your plan will have a',
                              style: CustomTextStyles.medium(
                                  color: CustomColors.grey800Color,
                                  fontSize: 12.sp),
                            ),
                            TextSpan(
                              text: ' 7-day waiting period ',
                              style: CustomTextStyles.medium(
                                  color: CustomColors.orange500Color,
                                  fontSize: 12.sp),
                            ),
                            TextSpan(
                              text: 'before it becomes active.',
                              style: CustomTextStyles.medium(
                                  color: CustomColors.grey800Color,
                                  fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                verticalSpacer(10.h),
                mediumText(
                    "During this waiting time, you won't be able to access care. Also, some valuable benefits may not be available immediately. To enjoy uninterrupted coverage and maintain all your benefits, it's best to renew on time!",
                    fontSize: 12.sp),
                verticalSpacer(12.h),
                DottedSeparator(
                  color: CustomColors.grey100Color,
                ),
                verticalSpacer(12.h),
                semiBoldText('Treatments not listed are not covered',
                    fontSize: 14.sp),
                mediumText(
                    "Only listed treatments, tests, procedures, and benefits are covered under your plan. Any exclusions will not be the insurer's responsibility.",
                    fontSize: 12.sp),
                verticalSpacer(12.h),
                DottedSeparator(
                  color: CustomColors.grey100Color,
                ),
                verticalSpacer(12.h),
                semiBoldText('Telemedicine', fontSize: 14.sp),
                mediumText(
                    "You can easily consult a doctor anytime using the telemedicine feature on the platform.",
                    fontSize: 12.sp),
                verticalSpacer(12.h),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
