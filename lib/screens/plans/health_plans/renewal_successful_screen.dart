import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/deactivate_health_plan_bottom_sheet.dart';
import 'package:genius_app/screens/onboarding/account_verified_screen.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

class RenewalSuccessfulScreen extends StatefulWidget {
  const RenewalSuccessfulScreen({super.key});

  @override
  State<RenewalSuccessfulScreen> createState() =>
      _RenewalSuccessfulScreenState();
}

class _RenewalSuccessfulScreenState extends State<RenewalSuccessfulScreen> {
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
              'Renewal Successful',
              fontSize: 24.sp,
              color: CustomColors.green400Color,
              textAlign: TextAlign.center,
            ),
            verticalSpacer(12.h),
            mediumText(
              'Your FlexiCare plan has been successfully renewed.',
              fontSize: 16.sp,
              color: CustomColors.greenTextColor,
              textAlign: TextAlign.center,
            ),
            verticalSpacer(32.h),
            Container(
              decoration: BoxDecoration(
                color: CustomColors.green25Color,
                border: Border.all(
                  color: CustomColors.green50Color,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                  vertical: 20.h,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          ConstantString.editCoverPeriodIcon,
                        ),
                        semiBoldText(
                          'A few things to note about renewals',
                          fontSize: 16.sp,
                          color: CustomColors.orange900Color,
                        ),
                      ],
                    ),
                    verticalSpacer(21.h),
                    DetailsRow(
                      title:
                          "You can fund your wallet or add a debit card for seamless auto-renewal.",
                    ),
                    verticalSpacer(20.h),
                    DetailsRow(
                      title:
                          "The best time to renew is before your plan expires-like you just did. Well done!",
                    ),
                    verticalSpacer(20.h),
                    DetailsRow(
                      title:
                          "Renewing within 7 days after expiration comes with a 24-hour waiting period.",
                    ),
                    verticalSpacer(20.h),
                    DetailsRow(
                      title:
                          "Renewing more than 7 days after expiration comes with a 7-day waiting period.",
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            CustomButton(
                title: 'Go to my plan',
                onTap: () {
                  context.pop();
                  // context.goNamed(RouteConstants.secondOnboardingScreen);
                }),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
