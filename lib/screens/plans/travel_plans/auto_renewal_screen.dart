import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/make_payment_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/turn_off_renewal_bottom_sheet.dart';
import 'package:genius_app/screens/plans/health_plans/dependant_screen.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_field.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AutoRenewalScreen extends StatefulHookConsumerWidget {
  const AutoRenewalScreen({
    super.key,
  });

  @override
  ConsumerState<AutoRenewalScreen> createState() => _AutoRenewalScreenState();
}

class _AutoRenewalScreenState extends ConsumerState<AutoRenewalScreen> {
  bool value = true;
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
                    'Auto Renewal',
                    fontSize: 20.sp,
                    color: CustomColors.primaryGreenColor,
                  ),
                  verticalSpacer(8.h),
                  mediumText(
                    'Manage your auto renewal',
                    fontSize: 14.sp,
                    color: CustomColors.primaryGreenColor,
                  ),
                  verticalSpacer(32.h),
                  Container(
                    decoration: BoxDecoration(
                      color: CustomColors.lightOrangeColor,
                      border: Border.all(
                        color: CustomColors.orange100Color,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 17.h, horizontal: 16.w),
                      child: Column(
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                ConstantString.autoRenewalCloudIcon,
                                height: 24,
                              ),
                              horizontalSpacer(10.w),
                              Expanded(
                                child: semiBoldText(
                                  'Auto Renewal',
                                  fontSize: 16.sp,
                                  color: CustomColors.orange900Color,
                                ),
                              ),
                              ShadSwitch(
                                value: value,
                                onChanged: (v) => setState(() {
                                  if (v == false) {
                                    showTurnOffRenewalBottomSheet(context);
                                  } else {
                                    value = v;
                                  }
                                }),
                                // label: const Text('Airplane Mode'),
                                checkedTrackColor: CustomColors.green500Color,
                                uncheckedTrackColor: CustomColors.grey300Color,
                              )
                            ],
                          ),
                          verticalSpacer(17.h),
                          mediumText(
                            'Keep funds in your wallet or card for uninterrupted asset protection with auto-renewal.',
                            fontSize: 14.sp,
                            color: CustomColors.grey700Color,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                  verticalSpacer(32.h),
                  Container(
                    decoration: BoxDecoration(
                      color: CustomColors.whiteColor,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: CustomColors.grey100Color,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: SvgPicture.asset(
                              ConstantString.autoRenewalIllust,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: CustomColors.grey50Color,
                                // borderRadius: BorderRadius.circular(8.r),
                                // border: Border.all(
                                //   color: CustomColors.grey50Color,
                                // ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 16.h,
                                  horizontal: 12.w,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    mediumText(
                                      'Premium',
                                      fontSize: 14.sp,
                                      color: CustomColors.blackTextColor,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text: "₦",
                                              style: TextStyle(
                                                fontFamily: '',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 14.sp,
                                                color:
                                                    CustomColors.green500Color,
                                              )),
                                          TextSpan(
                                            text: '800,000',
                                            style: CustomTextStyles.bold(
                                              fontSize: 14.sp,
                                              color: CustomColors.green500Color,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Column(
                                children: [
                                  verticalSpacer(16.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      mediumText(
                                        'Payment Method',
                                        fontSize: 14.sp,
                                        color: CustomColors.grey600Color,
                                      ),
                                      Image.asset(
                                        ConstantString.paystackLogo,
                                        width: 80,
                                      )
                                    ],
                                  ),
                                  verticalSpacer(16.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      mediumText(
                                        'Date purchased',
                                        fontSize: 14.sp,
                                        color: CustomColors.grey600Color,
                                      ),
                                      semiBoldText(
                                        '23rd March, 2023',
                                        fontSize: 14.sp,
                                        color: CustomColors.blackTextColor,
                                      ),
                                    ],
                                  ),
                                  verticalSpacer(20.h),
                                  Divider(
                                    color: CustomColors.gray200Color,
                                  ),
                                  verticalSpacer(20.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      mediumText(
                                        'Next renewal date',
                                        fontSize: 14.sp,
                                        color: CustomColors.grey600Color,
                                      ),
                                      semiBoldText(
                                        '24th April, 2023',
                                        fontSize: 14.sp,
                                        color: CustomColors.blackTextColor,
                                      ),
                                    ],
                                  ),
                                  verticalSpacer(16.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      mediumText(
                                        'Renewal Premium',
                                        fontSize: 14.sp,
                                        color: CustomColors.grey600Color,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                                text: "₦",
                                                style: TextStyle(
                                                  fontFamily: '',
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14.sp,
                                                  color: CustomColors
                                                      .green500Color,
                                                )),
                                            TextSpan(
                                              text: '800,000',
                                              style: CustomTextStyles.bold(
                                                fontSize: 14.sp,
                                                color:
                                                    CustomColors.green500Color,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  verticalSpacer(34.h),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
