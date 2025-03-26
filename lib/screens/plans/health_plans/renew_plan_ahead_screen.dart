import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/make_payment_bottom_sheet.dart';
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

class RenewPlanAheadScreen extends StatefulHookConsumerWidget {
  const RenewPlanAheadScreen({
    super.key,
  });

  @override
  ConsumerState<RenewPlanAheadScreen> createState() =>
      _RenewPlanAheadScreenState();
}

class _RenewPlanAheadScreenState extends ConsumerState<RenewPlanAheadScreen> {
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
              'Renew Plan Ahead',
              fontSize: 20.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(8.h),
            mediumText(
              'Stay covered without any interruptions.',
              fontSize: 14.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(32.h),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // verticalSpacer(MediaQuery.of(context).padding.top + 20.h),
                        // Row(
                        //   children: [
                        //     GestureDetector(
                        //       onTap: () {
                        //         context.pop();
                        //       },
                        //       child: SvgPicture.asset(
                        //         ConstantString.backButtonIcon,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // verticalSpacer(23.h),
                        // semiBoldText(
                        //   'Renew Plan Ahead',
                        //   fontSize: 20.sp,
                        //   color: CustomColors.primaryGreenColor,
                        // ),
                        // verticalSpacer(8.h),
                        // mediumText(
                        //   'Stay covered without any interruptions.',
                        //   fontSize: 14.sp,
                        //   color: CustomColors.primaryGreenColor,
                        // ),
                        // verticalSpacer(32.h),
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
                                offset: Offset(
                                    0, 1), // Vertical movement of the shadow
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
                                      ConstantString.summaryMoneyIcon,
                                    ),
                                    horizontalSpacer(8.w),
                                    semiBoldText(
                                      'Summary',
                                      fontSize: 16.sp,
                                      color: CustomColors.orange900Color,
                                    ),
                                    Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: CustomColors.green50Color,
                                        border: Border.all(
                                          color: CustomColors.green200Color,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(4.r),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.w,
                                          vertical: 4.h,
                                        ),
                                        child: Row(
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
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: CustomColors
                                                            .greenText100Color,
                                                        fontSize: 14.sp,
                                                      )),
                                                  TextSpan(
                                                    text: '50,000',
                                                    style: CustomTextStyles
                                                        .semiBold(
                                                      color: CustomColors
                                                          .greenText100Color,
                                                      fontSize: 14.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                verticalSpacer(8.sp),
                                DependantDetailsContainer(
                                  title: 'Plan',
                                  subtitle: 'FlexiCare',
                                ),
                                DependantDetailsContainer(
                                  title: 'Purchased by',
                                  subtitle: 'Clarisse Ukaegbu',
                                ),
                                DependantDetailsContainer(
                                  title: 'Dependants',
                                  subtitle: '4',
                                  subtitleBody: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      semiBoldText(
                                        '4',
                                        fontSize: 14.sp,
                                        color: CustomColors.orange900Color,
                                      ),
                                      horizontalSpacer(3.w),
                                      SvgPicture.asset(
                                        ConstantString.orangeEditIcon,
                                      )
                                    ],
                                  ),
                                ),
                                DependantDetailsContainer(
                                  title: 'Cover period',
                                  subtitle: 'Monthly',
                                ),
                                DependantDetailsContainer(
                                  title: 'Purchase Date',
                                  subtitle: '25/05/2025',
                                ),
                                verticalSpacer(30),
                              ],
                            ),
                          ),
                        ),
                        verticalSpacer(24.h),
                        customTextFieldWithText(
                          'promoCode',
                          'Enter promo code (if available)',
                          title: '',
                          showTitle: false,
                        ),
                        verticalSpacer(24.h),
                        Container(
                          height: 61.h,
                          decoration: BoxDecoration(
                              color: CustomColors.lightOrangeColor,
                              border: Border.all(
                                  color: CustomColors.orange200Color),
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
                                      text: '50,000',
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
                            title: 'Proceed to Payment',
                            onTap: () {
                              showMakePaymentBottomSheet(context,
                                  option: MakePaymentOptions.renewal);
                            }),
                        Spacer(),
                        verticalSpacer(
                            MediaQuery.of(context).padding.bottom + 20),
                      ],
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
