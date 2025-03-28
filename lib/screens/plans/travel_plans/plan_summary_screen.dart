import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/cover_period_changed_bottom_sheet%20copy.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/make_payment_bottom_sheet.dart';
import 'package:genius_app/models/screen_prop_models/plan_summary_model.dart';
import 'package:genius_app/screens/plans/health_plans/dependant_screen.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_field.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PlanSummaryScreen extends StatefulHookConsumerWidget {
  final PlanSummaryScreenModel data;
  const PlanSummaryScreen({
    super.key,
    required this.data,
  });

  @override
  ConsumerState<PlanSummaryScreen> createState() => _PlanSummaryScreenState();
}

class _PlanSummaryScreenState extends ConsumerState<PlanSummaryScreen> {
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
                    'Plan Summary',
                    fontSize: 20.sp,
                    color: CustomColors.primaryGreenColor,
                  ),
                  verticalSpacer(8.h),
                  mediumText(
                    widget.data.planSummaryType ==
                            PlanSummaryType.changeCoverPeriod
                        ? 'Confirm the update made on the cover period'
                        : 'Confirm details and proceed to make payment',
                    fontSize: 14.sp,
                    color: CustomColors.primaryGreenColor,
                  ),
                  verticalSpacer(32.h),
                  Container(
                    decoration: BoxDecoration(
                      color: CustomColors.grey25Color,
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black
                              .withOpacity(0.005), // Subtle shadow color
                          blurRadius: 2, // Softness of the shadow
                          spreadRadius: 1, // Slight expansion
                          offset:
                              Offset(0, 1), // Vertical movement of the shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                      ),
                      child: Column(
                        children: [
                          verticalSpacer(14.sp),
                          Row(
                            children: [
                              SvgPicture.asset(
                                widget.data.planSummaryType ==
                                            PlanSummaryType.changeCoverPeriod ||
                                        widget.data.planSummaryType ==
                                            PlanSummaryType.planAdjustment ||
                                        widget.data.planSummaryType ==
                                            PlanSummaryType.newPlanPurchase
                                    ? ConstantString.editCoverPeriodIcon
                                    : ConstantString.scanUserIcon,
                              ),
                            ],
                          ),
                          verticalSpacer(4.sp),
                          DependantDetailsContainer(
                            title: widget.data.planSummaryType ==
                                    PlanSummaryType.planAdjustment
                                ? 'Current Plan'
                                : 'Plan',
                            subtitle: 'FlexiCare',
                          ),
                          widget.data.planSummaryType ==
                                  PlanSummaryType.planAdjustment
                              ? DependantDetailsContainer(
                                  title: widget.data.planSummaryType ==
                                          PlanSummaryType.planAdjustment
                                      ? 'New Plan'
                                      : 'Plan',
                                  subtitle: 'FlexiCare Mini',
                                )
                              : SizedBox.shrink(),
                          DependantDetailsContainer(
                            title: 'Cover Period',
                            subtitle: 'Monthly',
                          ),
                          widget.data.planSummaryType ==
                                  PlanSummaryType.planAdjustment
                              ? DependantDetailsContainer(
                                  title: 'Purchase Date',
                                  subtitle: '12th May, 2025',
                                )
                              : SizedBox.shrink(),
                          widget.data.planSummaryType ==
                                  PlanSummaryType.planAdjustment
                              ? DependantDetailsContainer(
                                  title: 'Renewal Date',
                                  subtitle: '12th May, 2025',
                                )
                              : SizedBox.shrink(),
                          widget.data.planSummaryType ==
                                  PlanSummaryType.planAdjustment
                              ? SizedBox.shrink()
                              : DependantDetailsContainer(
                                  title: 'Type',
                                  subtitle: widget.data.planSummaryType ==
                                          PlanSummaryType.changeCoverPeriod
                                      ? 'Myself and Others'
                                      : widget.data.planSummaryType ==
                                              PlanSummaryType.newPlanPurchase
                                          ? 'Standard'
                                          : 'Others',
                                ),
                          if (widget.data.planSummaryType !=
                              PlanSummaryType.newPlanPurchase)
                            DependantDetailsContainer(
                              title: widget.data.planSummaryType ==
                                      PlanSummaryType.changeCoverPeriod
                                  ? widget.data.planSummaryType ==
                                          PlanSummaryType.planAdjustment
                                      ? 'Persons Covered'
                                      : 'Policies'
                                  : 'New dependant(s)',
                              subtitle: '5',
                            ),
                          widget.data.planSummaryType ==
                                      PlanSummaryType.changeCoverPeriod ||
                                  widget.data.planSummaryType ==
                                      PlanSummaryType.planAdjustment ||
                                  widget.data.planSummaryType ==
                                      PlanSummaryType.newPlanPurchase
                              ? SizedBox.shrink()
                              : DependantDetailsContainer(
                                  title: 'Updated dependant(s)',
                                  subtitle: '9',
                                ),
                          if (widget.data.planSummaryType ==
                              PlanSummaryType.newPlanPurchase)
                            DependantDetailsContainer(
                              title: 'Coverage',
                              subtitle: 'For Myself',
                            ),
                          DependantDetailsContainer(
                            title: 'Expiry date',
                            subtitle: '8th March, 2025',
                          ),
                          if (widget.data.planSummaryType !=
                              PlanSummaryType.newPlanPurchase)
                            verticalSpacer(30),
                        ],
                      ),
                    ),
                  ),
                  verticalSpacer(24.h),
                  widget.data.planSummaryType ==
                          PlanSummaryType.changeCoverPeriod
                      ? SizedBox.shrink()
                      : Padding(
                          padding: EdgeInsets.only(bottom: 24.h),
                          child: customTextFieldWithText(
                            'promoCode',
                            'Enter promo code (if available)',
                            title: '',
                            showTitle: false,
                          ),
                        ),
                  Container(
                    height: 61.h,
                    decoration: BoxDecoration(
                        color: CustomColors.lightOrangeColor,
                        border: Border.all(color: CustomColors.orange200Color),
                        borderRadius: BorderRadius.circular(8.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "₦",
                                  style: TextStyle(
                                    fontFamily: '',
                                    fontWeight: FontWeight.w600,
                                    color: CustomColors.orange950Color,
                                    fontSize: 16.sp,
                                  )),
                              TextSpan(
                                text: '3,500',
                                style: CustomTextStyles.semiBold(
                                  color: CustomColors.orange950Color,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  (widget.data.planSummaryType ==
                          PlanSummaryType.newPlanPurchase)
                      ? verticalSpacer(32.h)
                      : verticalSpacer(48.h),
                  CustomButton(
                      title: widget.data.planSummaryType ==
                              PlanSummaryType.changeCoverPeriod
                          ? 'Confirm'
                          : 'Proceed to Payment',
                      onTap: widget.data.planSummaryType ==
                              PlanSummaryType.planAdjustment
                          ? () {
                              showCoverPeriodChangedBottomSheet(context,
                                  isAdjustPlan: true);
                            }
                          : widget.data.planSummaryType ==
                                  PlanSummaryType.newPlanPurchase
                              ? () {
                                  showMakePaymentBottomSheet(context,isNewPurchase: true);
                                }
                              : () {
                                  showCoverPeriodChangedBottomSheet(context);
                                }),
                  Spacer(),
                  verticalSpacer(MediaQuery.of(context).padding.bottom + 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
