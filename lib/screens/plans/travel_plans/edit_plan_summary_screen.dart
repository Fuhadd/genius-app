import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/cover_period_changed_bottom_sheet%20copy.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/make_payment_bottom_sheet.dart';
import 'package:genius_app/screens/plans/health_plans/dependant_screen.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_field.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class EditPlanSummaryScreen extends StatefulHookConsumerWidget {
  const EditPlanSummaryScreen({
    super.key,
  });

  @override
  ConsumerState<EditPlanSummaryScreen> createState() =>
      _EditPlanSummaryScreenState();
}

class _EditPlanSummaryScreenState extends ConsumerState<EditPlanSummaryScreen> {
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
                    'Confirm the update made on the cover period',
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
                                ConstantString.editCoverPeriodIcon,
                              ),
                            ],
                          ),
                          verticalSpacer(4.sp),
                          DependantDetailsContainer(
                            title: 'Plan',
                            subtitle: 'FlexiCare',
                          ),
                          DependantDetailsContainer(
                            title: 'Cover Period',
                            subtitle: 'Monthly',
                          ),
                          DependantDetailsContainer(
                            title: 'Type',
                            subtitle: 'Myself and Others',
                          ),
                          DependantDetailsContainer(
                            title: 'Policies',
                            subtitle: '5',
                          ),
                          verticalSpacer(30),
                        ],
                      ),
                    ),
                  ),
                  verticalSpacer(24.h),
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
                  verticalSpacer(48.h),
                  CustomButton(
                      title: 'Confirm',
                      onTap: () {
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
