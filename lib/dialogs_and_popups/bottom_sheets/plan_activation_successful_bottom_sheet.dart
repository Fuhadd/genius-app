import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/hospital_list_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/plan_benefits_bottom_sheet.dart';
import 'package:genius_app/models/screen_prop_models/health_plans_model.dart';
import 'package:genius_app/screens/homepage/widgets/count_down_timer.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:genius_app/widgets/dotted_separator.dart';
import 'package:go_router/go_router.dart';

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                            text: 'This plan becomes active in ',
                            style: CustomTextStyles.medium(
                              color: CustomColors.primaryGreenColor,
                              fontSize: 14.sp,
                            )),
                        TextSpan(
                            text: '23:40:30. ',
                            style: CustomTextStyles.semiBold(
                              color: CustomColors.primaryGreenColor,
                              fontSize: 14.sp,
                            )),
                        TextSpan(
                            text: 'hours. ',
                            style: CustomTextStyles.medium(
                              color: CustomColors.primaryGreenColor,
                              fontSize: 14.sp,
                            )),
                      ]),
                    ),
                  ],
                ),
                PlanBenefitSectionSingleItemWidget(
                    titleWidget: SizedBox.shrink(),
                    bulletPointPadding: EdgeInsets.only(bottom: 14.h),
                    bulletPointsfontSize: 14.sp,
                    bulletPoints: [
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
                ),
                Center(
                  child: CountdownTimer(
                    duration: const Duration(hours: 24),
                  ),
                ),
                verticalSpacer(16.h),
                CustomButton(
                    title: 'Go to my plan',
                    onTap: () {
                      context.pushReplacementNamed(
                        RouteConstants.healthPlansScreen,
                        extra: HealthPlansModel(
                          isExpired: false,
                        ),
                      );
                    }),
                verticalSpacer(16.h),
                Center(
                  child: boldText(
                    'Learn about your new plan',
                    fontSize: 16.sp,
                    color: CustomColors.green500Color,
                  ),
                ),
                verticalSpacer(MediaQuery.of(context).padding.bottom + 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
