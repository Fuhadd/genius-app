import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/models/screen_prop_models/plan_summary_model.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_list_dropdown_field.dart';
import 'package:genius_app/widgets/custom_text_field.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final coverPeriodProvider = StateProvider.autoDispose<String?>((ref) => null);
final policyOwnerProvider = StateProvider.autoDispose<String?>((ref) => null);

class CoverageTypeOptionsScreen extends ConsumerStatefulWidget {
  const CoverageTypeOptionsScreen({super.key});

  @override
  ConsumerState<CoverageTypeOptionsScreen> createState() =>
      _CoverageTypeOptionsScreenState();
}

int selectedIndex = 0;
int numberOfdependants = 0;
double policyAmount = 0;

class _CoverageTypeOptionsScreenState
    extends ConsumerState<CoverageTypeOptionsScreen> {
  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

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
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    semiBoldText(
                      'Standard Plan',
                      fontSize: 20.sp,
                      color: CustomColors.primaryGreenColor,
                    ),
                    verticalSpacer(8.h),
                    mediumText(
                      'Provide details to calculate premium',
                      fontSize: 14.sp,
                      color: CustomColors.primaryGreenColor,
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  height: 70.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: CustomColors.whiteColor,
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      color: CustomColors.grey50Color,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          ConstantString.moneyIcon,
                        ),
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
                                text: '3,500/',
                                style: CustomTextStyles.semiBold(
                                  color: CustomColors.greenText100Color,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        mediumText('person monthly', fontSize: 10.sp)
                      ],
                    ),
                  ),
                )
              ],
            ),
            verticalSpacer(43.h),
            Column(
              children: [
                CustomListDropdownField(
                  fieldName: "Select duration of your coverage",
                  label: "Cover period",
                  description: "Select duration of your coverage",
                  items: const [
                    "Monthly",
                    "Annually",
                  ],
                  selectedItem: coverPeriodProvider,
                ),
                CustomListDropdownField(
                  fieldName: "Who are you buying for?",
                  label: "Who are you buying for?",
                  description: "Select policy owner",
                  items: const [
                    "for Myself",
                    "For Others",
                  ],
                  selectedItem: policyOwnerProvider,
                ),
              ],
            ),
            customTextFieldWithText(
              '',
              numberOfdependants.toString(),
              title: 'Number of dependants',
              enabledBorderColor: CustomColors.grey100Color,
              onChanged: (v) {
                setState(() {});
              },
            ),
            verticalSpacer(24.h),
            if (ref.watch(policyOwnerProvider) == "For Others")
              GestureDetector(
                onTap: () {
                  setState(() {
                    numberOfdependants++;
                    policyAmount = numberOfdependants * 3500;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(ConstantString.addCircleIcon),
                    horizontalSpacer(5.w),
                    semiBoldText('Add Dependants?',
                        fontSize: 14.sp, color: CustomColors.green500Color)
                  ],
                ),
              ),
            Container(
              height: 48.h,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: CustomColors.orange50Color,
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Center(
                child: RichText(
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
                        text: '${policyAmount.toStringAsFixed(0)}',
                        style: CustomTextStyles.semiBold(
                          color: CustomColors.greenText100Color,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            CustomButton(
              title: 'Continue',
              onTap: (ref.watch(coverPeriodProvider) == null ||
                      ref.watch(policyOwnerProvider) == null)
                  ? null
                  : () {
                      context.pushNamed(
                        extra: PlanSummaryScreenModel(
                            planSummaryType: PlanSummaryType.newPlanPurchase),
                        RouteConstants.planSummaryScreen,
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

class CoverageTypeITemWidget extends StatelessWidget {
  const CoverageTypeITemWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });

  final String icon, text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 156.h,
      width: 156.w,
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: CustomColors.grey50Color,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            ConstantString.familyAvatarsIcon,
            color: color,
          ),
          verticalSpacer(10.h),
          semiBoldText(
            text,
            fontSize: 14.sp,
            color: CustomColors.grey500Color,
          )
        ],
      ),
    );
  }
}

class HelperText extends StatelessWidget {
  const HelperText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 156.h,
      width: 156.w,
      decoration: BoxDecoration(
        color: CustomColors.green50Color,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: CustomColors.green500Color,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          mediumText(
            text,
            textAlign: TextAlign.center,
            fontSize: 14.sp,
            color: CustomColors.green500Color,
          )
        ],
      ),
    );
  }
}
