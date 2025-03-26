import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/deactivate_health_plan_bottom_sheet.dart';
import 'package:genius_app/models/screen_prop_models/auto_plan_details_model.dart';
import 'package:genius_app/models/screen_prop_models/buy_auto_plan_form_model.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AutoPlanDetailsScreen extends StatefulHookConsumerWidget {
  final AutoPlanDetailsModel data;
  const AutoPlanDetailsScreen({
    super.key,
    required this.data,
  });

  @override
  ConsumerState<AutoPlanDetailsScreen> createState() =>
      _AutoPlanDetailsScreenState();
}

class _AutoPlanDetailsScreenState extends ConsumerState<AutoPlanDetailsScreen> {
  HospitalCategory selectedCategory = HospitalCategory.all;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
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
                    widget.data.selectedPlan.description,
                    // widget.data.selectedPlan == AutoPlans.comprehensiveAuto
                    //     ? 'Comprehensive Auto'
                    //     : widget.data.selectedPlan ==
                    //             AutoPlans.miniComprehensive
                    //         ? 'Mini Comprehensive'
                    //         : 'Third Party',
                    fontSize: 20.sp,
                    color: CustomColors.primaryGreenColor,
                  ),
                  verticalSpacer(8.h),
                  mediumText(
                    'Covers you and others.',
                    fontSize: 14.sp,
                    color: CustomColors.primaryGreenColor,
                  ),
                  verticalSpacer(43.h),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CustomColors.green200Color,
                      ),
                      color: CustomColors.green25Color,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 22.h,
                        horizontal: 16.w,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                ConstantString.moneyIcon,
                                height: 20,
                              ),
                              horizontalSpacer(12.w),
                              widget.data.selectedPlan ==
                                      AutoPlans.comprehensiveAuto
                                  ? RichText(
                                      // textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "5% ",
                                            style: CustomTextStyles.bold(
                                              fontSize: 16.sp,
                                              color:
                                                  CustomColors.blackTextColor,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "of vehicle value",
                                            style: CustomTextStyles.semiBold(
                                              fontSize: 14.sp,
                                              color:
                                                  CustomColors.blackTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : RichText(
                                      // textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "₦",
                                            style: CustomTextStyles.bold(
                                              fontSize: 16.sp,
                                              color:
                                                  CustomColors.blackTextColor,
                                            ),
                                          ),
                                          TextSpan(
                                            text: widget.data.selectedPlan ==
                                                    AutoPlans.miniComprehensive
                                                ? "25,000"
                                                : '15,000',
                                            style: CustomTextStyles.bold(
                                              fontSize: 16.sp,
                                              color:
                                                  CustomColors.blackTextColor,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "/ vehicle annually  ",
                                            style: CustomTextStyles.semiBold(
                                              fontSize: 14.sp,
                                              color:
                                                  CustomColors.blackTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                            ],
                          ),
                          verticalSpacer(16.h),
                          DetailsRow(
                            title: "",
                            cicleColor: CustomColors.green500Color,
                            titleBody: RichText(
                              // textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "NIID: ",
                                    style: CustomTextStyles.semiBold(
                                      fontSize: 14.sp,
                                      color: CustomColors.blackTextColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "Policy is registered on NIID database.",
                                    style: CustomTextStyles.medium(
                                      fontSize: 14.sp,
                                      color: CustomColors.blackTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          verticalSpacer(12.h),
                          DetailsRow(
                            title: "",
                            cicleColor: CustomColors.green500Color,
                            titleBody: RichText(
                              // textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Plan Active: ",
                                    style: CustomTextStyles.semiBold(
                                      fontSize: 14.sp,
                                      color: CustomColors.blackTextColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "Plan activates after vehicle inspection.",
                                    style: CustomTextStyles.medium(
                                      fontSize: 14.sp,
                                      color: CustomColors.blackTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpacer(24.h),
                  PlanDetailsOptions(
                    icon: ConstantString.planBenefitIcon2,
                    title: 'Plan Benefits',
                  ),
                  PlanDetailsOptions(
                    icon: ConstantString.planHowItWorksIcon,
                    title: 'How it works',
                  ),
                  PlanDetailsOptions(
                    icon: ConstantString.planNeedToKnowIcon,
                    title: 'Need to know',
                  ),
                  PlanDetailsOptions(
                    icon: ConstantString.planHowToClaimIcon,
                    title: 'How to claim',
                  ),
                  verticalSpacer(24.h),
                  CustomButton(
                    title: 'Continue',
                    onTap: () {
                      context.pushNamed(
                        RouteConstants.buyAutoPlanFormScreen,
                        extra: BuyAutoPlanFormModel(
                          autoPlans: widget.data.selectedPlan,
                        ),
                      );
                    },
                  ),
                  verticalSpacer(24.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlanDetailsOptions extends StatelessWidget {
  final String title, icon;
  const PlanDetailsOptions({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.005), // Subtle shadow color
              blurRadius: 2, // Softness of the shadow
              spreadRadius: 1, // Slight expansion
              offset: Offset(0, 1), // Vertical movement of the shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 20.h,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
              ),
              horizontalSpacer(8.w),
              Expanded(
                child: mediumText(
                  title,
                  fontSize: 14.sp,
                  color: CustomColors.blackTextColor,
                ),
              ),
              SvgPicture.asset(
                ConstantString.chevronRight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
