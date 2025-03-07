import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/deactivate_health_plan_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/make_payment_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/switch_health_plan_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/turn_off_renewal_bottom_sheet.dart';
import 'package:genius_app/screens/plans/health_plans/dependant_screen.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_field.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:genius_app/widgets/single_list_options_container.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DeactivatePlanScreen extends StatefulHookConsumerWidget {
  const DeactivatePlanScreen({
    super.key,
  });

  @override
  ConsumerState<DeactivatePlanScreen> createState() =>
      _DeactivatePlanScreenState();
}

class _DeactivatePlanScreenState extends ConsumerState<DeactivatePlanScreen> {
  DeactivatePlanReason? deactivatePlanReason;
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
                    'Deactivate FlexiCare Plan',
                    fontSize: 20.sp,
                    color: CustomColors.primaryGreenColor,
                  ),
                  verticalSpacer(8.h),
                  mediumText(
                    'Why do you want to deactivate your plan?',
                    fontSize: 14.sp,
                    color: CustomColors.primaryGreenColor,
                  ),
                  verticalSpacer(43.h),
                  SingleListOptionsContainer(
                    title: "I’m switching to a different plan.",
                    icon: ConstantString.uncheckedRadioIcon,
                    bgColor: CustomColors.whiteColor,
                    selectedIcon: ConstantString.checkedRadioIcon,
                    textColor: CustomColors.blackTextColor,
                    padding: 16.h,
                    boldenText: false,
                    isSelected:
                        deactivatePlanReason == DeactivatePlanReason.switching,
                    onTap: () {
                      setState(() {
                        deactivatePlanReason = DeactivatePlanReason.switching;
                      });
                    },
                  ),
                  verticalSpacer(20.h),
                  SingleListOptionsContainer(
                    title: "This plan does not meet my needs.",
                    icon: ConstantString.uncheckedRadioIcon,
                    bgColor: CustomColors.whiteColor,
                    selectedIcon: ConstantString.checkedRadioIcon,
                    textColor: CustomColors.blackTextColor,
                    padding: 16.h,
                    boldenText: false,
                    isSelected:
                        deactivatePlanReason == DeactivatePlanReason.dontWant,
                    onTap: () {
                      setState(() {
                        deactivatePlanReason = DeactivatePlanReason.dontWant;
                      });
                    },
                  ),
                  verticalSpacer(20.h),
                  SingleListOptionsContainer(
                    title: "I faced challenges making a claim.",
                    bgColor: CustomColors.whiteColor,
                    icon: ConstantString.uncheckedRadioIcon,
                    selectedIcon: ConstantString.checkedRadioIcon,
                    textColor: CustomColors.blackTextColor,
                    padding: 16.h,
                    boldenText: false,
                    isSelected:
                        deactivatePlanReason == DeactivatePlanReason.cantClaim,
                    onTap: () {
                      setState(() {
                        deactivatePlanReason = DeactivatePlanReason.cantClaim;
                      });
                    },
                  ),
                  verticalSpacer(20.h),
                  customTextFieldWithText(
                    'other',
                    'Other (please specify)\n\n',
                    title: '',
                    showTitle: false,
                    maxLines: 2,
                  ),
                  verticalSpacer(60.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          title: 'Continue',
                          textColor: CustomColors.whiteColor,
                          buttonColor: CustomColors.red500Color,
                          onTap: deactivatePlanReason == null
                              ? null
                              : deactivatePlanReason ==
                                      DeactivatePlanReason.switching
                                  ? () {
                                      // context.pop();
                                      showSwitchHealthPlanBottomSheet(context);
                                      // showDeactivateHealthPlanBottomSheet(context);
                                    }
                                  : () {
                                      // context.pop();
                                      // showSwitchHealthPlanBottomSheet(context);
                                      showDeactivateHealthPlanBottomSheet(
                                          context);
                                    },
                        ),
                      ),
                      horizontalSpacer(15.w),
                      Expanded(
                        child: CustomButton(
                          title: 'Cancel',
                          textColor: CustomColors.green400Color,
                          borderColor: CustomColors.green400Color,
                          buttonColor: Colors.transparent,
                          onTap: () {
                            context.pop();
                          },
                        ),
                      ),
                    ],
                  ),
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
