import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

class SelectCoverageTypeScreen extends StatefulWidget {
  const SelectCoverageTypeScreen({super.key});

  @override
  State<SelectCoverageTypeScreen> createState() =>
      _SelectCoverageTypeScreenState();
}

int selectedIndex = 0;

class _SelectCoverageTypeScreenState extends State<SelectCoverageTypeScreen> {
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
            semiBoldText(
              'Who needs this coverage?',
              fontSize: 20.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(8.h),
            mediumText(
              'Select who you are buying this plan for',
              fontSize: 14.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(43.h),
            Row(
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    selectedIndex = 1;
                  }),
                  child: selectedIndex == 1
                      ? HelperText(text: 'Covers just You')
                      : CoverageTypeITemWidget(
                          icon: ConstantString.profileIcon,
                          text: 'Standard Plan',
                          color: CustomColors.orange500Color),
                ),
                horizontalSpacer(22.w),
                GestureDetector(
                  onTap: () => setState(() {
                    selectedIndex = 2;
                  }),
                  child: selectedIndex == 2
                      ? HelperText(text: 'covers you and your loved ones')
                      : CoverageTypeITemWidget(
                          icon: ConstantString.familyAvatars,
                          text: 'Family plan',
                          color: CustomColors.blueColor,
                        ),
                ),
              ],
            ),
            Spacer(),
            CustomButton(
              title: 'Continue',
              onTap: selectedIndex == 0
                  ? null
                  : () {
                      context.pushNamed(
                        RouteConstants.coverageTypeOptionsScreen,
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
            ConstantString.familyAvatars,
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
