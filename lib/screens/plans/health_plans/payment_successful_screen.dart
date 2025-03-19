import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/hospital_list_bottom_sheet.dart';
import 'package:genius_app/models/screen_prop_models/plan_summary_model.dart';
import 'package:genius_app/screens/onboarding/account_verified_screen.dart';
import 'package:genius_app/screens/plans/health_plans/dependant_screen.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

class PaymentSuccessfulScreen extends StatefulWidget {
  const PaymentSuccessfulScreen({super.key, this.data});

  final PlanSummaryScreenModel? data;

  @override
  State<PaymentSuccessfulScreen> createState() =>
      _PaymentSuccessfulScreenState();
}

class _PaymentSuccessfulScreenState extends State<PaymentSuccessfulScreen> {
  AccountType? accountType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            verticalSpacer(MediaQuery.of(context).padding.top + 20),
            Center(
              child: Image.asset(
                ConstantString.geniusLogoGreen,
                height: 43,
              ),
            ),
            verticalSpacer(40.h),
            boldText(
              'Payment Successful',
              fontSize: 24.sp,
              color: CustomColors.green400Color,
              textAlign: TextAlign.center,
            ),
            verticalSpacer(12.h),
            mediumText(
              widget.data?.planSummaryType == PlanSummaryType.newPlanPurchase
                  ? 'Time to activate your plan to access premium care.'
                  : 'Up next, activate your plan to access premium care.',
              color: CustomColors.greenTextColor,
              fontSize: 16.sp,
              textAlign: TextAlign.center,
            ),
            verticalSpacer(20.h),
            widget.data?.planSummaryType == PlanSummaryType.newPlanPurchase
                ? Container(
                    constraints: BoxConstraints(
                      maxHeight: 384.h,
                    ),
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: CustomColors.green50Color,
                      borderRadius: BorderRadius.circular(2.r),
                      border: Border.all(
                        color: CustomColors.green100Color,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        children: [
                          verticalSpacer(16.h),
                          Padding(
                            padding: EdgeInsets.only(left: 8.w, bottom: 10.h),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    ConstantString.editCoverPeriodIcon),
                                horizontalSpacer(10.w),
                                semiBoldText(
                                  'Things to know before activation',
                                  fontSize: 16.sp,
                                  color: CustomColors.greenTextColor,
                                ),
                              ],
                            ),
                          ),
                          verticalSpacer(10.h),
                          ThingsToKnowBulletPointWidget(
                              text:
                                  'Care access starts 24hrs after activation.'),
                          verticalSpacer(20.h),
                          ThingsToKnowBulletPointWidget(
                              text: 'NIN is required for activation.'),
                          verticalSpacer(20.h),
                          ThingsToKnowBulletPointWidget(
                              text:
                                  'You can manage your dependants or add their email & phone no for them to manage themselves.'),
                          verticalSpacer(20.h),
                          ThingsToKnowBulletPointWidget(
                              text: "Age band is between 0 and 65 years old."),
                          verticalSpacer(20.h),
                          ThingsToKnowBulletPointWidget(
                              text:
                                  "If you renew within 7 days of expiry, your hospital access will be available after a 24-hour wait. However, if you renew after 7 days of expiry, the waiting period extends to 7 days.")
                        ],
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: CustomColors.green50Color,
                          borderRadius: BorderRadius.circular(2.r),
                          border: Border.all(
                            color: CustomColors.green100Color,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 4.h),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(ConstantString.receiptIcon),
                              horizontalSpacer(10.w),
                              mediumText(
                                'Download receipt',
                                fontSize: 12.sp,
                                color: CustomColors.greenTextColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                      verticalSpacer(20.h),
                      // SvgPicture.asset(ConstantString.rotatingGraphics),
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: AlignmentDirectional.center,
                        children: [
                          Positioned(
                            bottom: -50,
                            child: SvgPicture.asset(ConstantString.treeRoot),
                          ),
                          RotatingSvg(),
                          SvgPicture.asset(ConstantString.checkmark),
                        ],
                      ),
                    ],
                  ),
            Spacer(),
            CustomButton(
                title: 'Proceed to activate',
                onTap: () {
                  context
                      .pushReplacementNamed(RouteConstants.activatePlanScreen);
                }),
            verticalSpacer(16.h),
            boldText(
              'Do this another time',
              fontSize: 16.sp,
              color: CustomColors.green500Color,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

class ThingsToKnowBulletPointWidget extends StatelessWidget {
  const ThingsToKnowBulletPointWidget({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        horizontalSpacer(8.w),
        SvgPicture.asset(
          ConstantString.ellipseIcon,
          colorFilter:
              ColorFilter.mode(CustomColors.orange500Color, BlendMode.srcIn),
        ),
        horizontalSpacer(8.w),
        Expanded(
          child: mediumText(text,
              color: CustomColors.primaryGreenColor, fontSize: 14.sp),
        )
      ],
    );
  }
}
