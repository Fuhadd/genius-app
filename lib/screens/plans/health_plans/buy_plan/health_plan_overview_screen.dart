import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/hospital_list_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/need_to_know_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/plan_actions_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/plan_benefits_bottom_sheet.dart';
import 'package:genius_app/screens/plans/health_plans/health_plans_screen.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

class HealthPlanOverviewScreen extends StatefulWidget {
  const HealthPlanOverviewScreen({super.key});

  @override
  State<HealthPlanOverviewScreen> createState() => _HealthPlanOverviewScreenState();
}

class _HealthPlanOverviewScreenState extends State<HealthPlanOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacer(MediaQuery.of(context).padding.top + 20.h),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: SvgPicture.asset(
                    ConstantString.backButtonIcon,
                  ),
                ),
              ],
            ),
            verticalSpacer(23.h),
            semiBoldText(
              'FlexiCare',
              fontSize: 20.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(8.h),
            mediumText(
              'Covers you and your loved ones',
              fontSize: 14.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(43.h),
            Container(
              height: 45.h,
              constraints: BoxConstraints(maxWidth: 335.w, minHeight: 140.h),
              decoration: BoxDecoration(
                color: CustomColors.green25Color,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          ConstantString.moneyIcon,
                        ),
                        horizontalSpacer(4.w),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "₦",
                                  style: TextStyle(
                                    fontFamily: '',
                                    fontWeight: FontWeight.w600,
                                    color: CustomColors.greenText100Color,
                                    fontSize: 14.sp,
                                  )),
                              TextSpan(
                                text: '3,500',
                                style: CustomTextStyles.semiBold(
                                  color: CustomColors.greenText100Color,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    verticalSpacer(12.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          ConstantString.ellipseIcon,
                        ),
                        horizontalSpacer(4.w),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Age band: ',
                                style: CustomTextStyles.bold(
                                  color: CustomColors.greenText100Color,
                                  fontSize: 14.sp,
                                ),
                              ),
                              TextSpan(
                                text: 'Between 0 - 65 years',
                                style: CustomTextStyles.medium(
                                  color: CustomColors.greenText100Color,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    verticalSpacer(12.h),
                    Row(
                      children: [
                        SvgPicture.asset(
                          ConstantString.ellipseIcon,
                        ),
                        horizontalSpacer(4.w),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Plan Active: ',
                                style: CustomTextStyles.bold(
                                  color: CustomColors.greenText100Color,
                                  fontSize: 14.sp,
                                ),
                              ),
                              TextSpan(
                                text: 'After 24 hours of activation.',
                                style: CustomTextStyles.medium(
                                  color: CustomColors.greenText100Color,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            verticalSpacer(24.h),
            GestureDetector(
              onTap: () => showBuyPlanOptionsBottomSheet(
                context,
                child: PlanBenefitsBottomSheet(),
              ),
              child: PlanOptionSingleItemWidget(
                title: 'Plan benefits',
                subtitle: '',
                icon: ConstantString.medalIcon,
              ),
            ),
            verticalSpacer(12.h),
            GestureDetector(
              onTap: () => showBuyPlanOptionsBottomSheet(
                context,
                child: HosipitalListBottomsheet(),
              ),
              child: PlanOptionSingleItemWidget(
                title: 'Hospital List',
                subtitle: '',
                icon: ConstantString.greenHospitalIcon,
              ),
            ),
            verticalSpacer(12.h),
            GestureDetector(
              onTap: () => showBuyPlanOptionsBottomSheet(
                context,
                child: NeedToKnowBottomSheet(),
              ),
              child: PlanOptionSingleItemWidget(
                title: 'Need to Know',
                subtitle: '',
                icon: ConstantString.noteIcon,
              ),
            ),
            verticalSpacer(64.h),
            CustomButton(
              title: 'Continue',
              onTap: () {
                context.pushNamed(
                  RouteConstants.selectCoverageTypeScreen,
                );
              },
            ),
            verticalSpacer(MediaQuery.of(context).padding.bottom + 20),
          ],
        ),
      ),
    );
  }
}

class PlanOptionSingleItemWidget extends StatelessWidget {
  const PlanOptionSingleItemWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String title, subtitle, icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.005), // Subtle shadow color
            blurRadius: 2, // Softness of the shadow
            spreadRadius: 1, // Slight expansion
            offset: Offset(0, 1), // Vertical movement of the shadow
          ),
          // BoxShadow(
          //   color: Colors.black
          //       .withOpacity(0.05), // Subtle shadow color
          //   blurRadius: 4, // Softness of the shadow
          //   spreadRadius: 1, // Slight expansion
          //   offset: Offset(
          //       0, 2), // Vertical movement of the shadow
          // ),
        ],
      ),
      child: OptionsWidget(
        title: title,
        subtitle: subtitle,
        icon: icon,
      ),
    );
  }
}
