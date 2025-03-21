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
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum CoverageTypeOptions { justMe, myselfAndOthers, others, myselfAndFamily }

class CoverageOptionsModel {
  CoverageOptionsModel({
    this.coverageTypeOptions,
    this.coverPeriod,
    this.totalfamilySize,
    this.includeMe,
    this.numberOfdependants = 0,
  });
  CoverageTypeOptions? coverageTypeOptions;
  String? coverPeriod;
  String? totalfamilySize;
  bool? includeMe;
  int numberOfdependants;
}

final coverageOptionsModelProvider = StateProvider<CoverageOptionsModel>(
  (ref) => CoverageOptionsModel(),
);

class SelectCoverageTypeScreen extends ConsumerStatefulWidget {
  const SelectCoverageTypeScreen({super.key});

  @override
  ConsumerState<SelectCoverageTypeScreen> createState() =>
      _SelectCoverageTypeScreenState();
}

int selectedIndex = 0;

class _SelectCoverageTypeScreenState
    extends ConsumerState<SelectCoverageTypeScreen> {
  @override
  void initState() {
    super.initState();
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
                    ref
                            .read(coverageOptionsModelProvider.notifier)
                            .state
                            .coverageTypeOptions =
                        CoverageTypeOptions.myselfAndFamily;
                  }),
                  child: ref
                              .watch(coverageOptionsModelProvider)
                              .coverageTypeOptions ==
                          CoverageTypeOptions.myselfAndFamily
                      ? HelperText(text: 'covers you and your loved ones')
                      : CoverageTypeITemWidget(
                          icon: ConstantString.profileIcon,
                          text: 'Standard Plan',
                          color: CustomColors.orange500Color),
                ),
                horizontalSpacer(22.w),
                GestureDetector(
                  onTap: () => setState(() {
                    ref
                            .read(coverageOptionsModelProvider.notifier)
                            .state
                            .coverageTypeOptions =
                        CoverageTypeOptions.myselfAndOthers;
                  }),
                  child: ref
                              .watch(coverageOptionsModelProvider)
                              .coverageTypeOptions ==
                          CoverageTypeOptions.myselfAndOthers
                      ? HelperText(
                          text: 'Covers your immediate family members.')
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
              onTap:
                  ref.watch(coverageOptionsModelProvider).coverageTypeOptions ==
                          null
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: mediumText(
              text,
              textAlign: TextAlign.center,
              fontSize: 14.sp,
              color: CustomColors.green500Color,
            ),
          )
        ],
      ),
    );
  }
}
