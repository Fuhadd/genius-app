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

class AutoPurchaseSuccessfulScreen extends StatefulWidget {
  const AutoPurchaseSuccessfulScreen({super.key});

  @override
  State<AutoPurchaseSuccessfulScreen> createState() =>
      _AutoPurchaseSuccessfulScreenState();
}

class _AutoPurchaseSuccessfulScreenState
    extends State<AutoPurchaseSuccessfulScreen> {
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
              'Proceed to complete activation now to ensure 100% damage protection for your vehicle(s).',
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
                          'What you need for activation',
                          fontSize: 16.sp,
                          color: CustomColors.orange900Color,
                        ),
                      ],
                    ),
                    verticalSpacer(21.h),
                    DetailsRow(
                      title:
                          "Upload your vehicle license, proof of ownership, and a valid ID.",
                    ),
                    verticalSpacer(20.h),
                    DetailsRow(
                      title:
                          "Complete a quick pre-inspection (takes 2-5 minutes).",
                    ),
                    verticalSpacer(20.h),
                    DetailsRow(
                      title:
                          "Your certificate will be generated after inspection.",
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            CustomButton(
                title: 'Proceed to activate',
                onTap: () {
                  context.pop();
                  context.pop();
                  context.pop();
                  context.pop();
                  context.pop();
                  context.pushNamed(RouteConstants.manageVehiclesScreen);
                }),
            verticalSpacer(16.h),
            GestureDetector(
              onTap: () {
                context.pop();
                context.pop();
                context.pop();
                context.pop();
                context.pop();
                // if (widget.data.dependantType ==
                //     NewDependantType.noUniqueEmail) {
                //   context.pop();
                // }
              },
              child: boldText(
                'Do this another time',
                fontSize: 16.sp,
                color: CustomColors.green500Color,
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
