import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/deactivate_health_plan_bottom_sheet.dart';
import 'package:genius_app/models/screen_prop_models/plan_summary_model.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

void showHowItWorksBottomSheet(BuildContext context,
    {bool isReActivate = false}) {
  final List<ClaimStep> steps = [
    ClaimStep(
      number: 1,
      title: 'Pick your plan',
      description:
          "Choose a plan for yourself or someone else. Then proceed to make payment.",
      isHighlighted: true,
    ),
    ClaimStep(
      number: 2,
      title: 'Activate your policy',
      description:
          'Input the required information and upload documents such as your vehicle license so your certificate can be generated.',
    ),
    ClaimStep(
      number: 3,
      title: 'Pre-loss inspection',
      description:
          'Complete a quick vehicle inspection to ensure full coverage.',
    ),
  ];
  showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      barrierColor: Colors.black.withOpacity(0.6),
      context: context,
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return LayoutBuilder(builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height *
                    0.8, // max height constraint
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      verticalSpacer(28.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            ConstantString.howItWorksIcon,
                            height: 32.h,
                          ),
                          horizontalSpacer(10.w),
                          boldText(
                            'How it works',
                            fontSize: 20.sp,
                            color: CustomColors.green400Color,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      verticalSpacer(28.h),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              verticalSpacer(16.h),
                              StepItem(step: steps[0]),
                              StepItem(step: steps[1]),
                              StepItem(
                                step: steps[2],
                                isLast: true,
                              ),
                              verticalSpacer(72.h),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        });
      });
}

class NeedToKnowContainer extends StatelessWidget {
  final String title, subtitle;
  const NeedToKnowContainer({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 12.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          semiBoldText(
            title,
            fontSize: 14.sp,
            color: CustomColors.blackTextColor,
            height: 2.4,
            // textAlign: TextAlign.center,
          ),
          verticalSpacer(2.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: mediumText(
                  subtitle,
                  fontSize: 12.sp,
                  color: CustomColors.grey800Color,
                  // textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          verticalSpacer(12.h),
          DottedLine(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            lineLength: double.infinity,
            lineThickness: 1.0,
            dashLength: 7.0,
            dashColor: CustomColors.gray200Color,
            dashRadius: 0.0,
            dashGapLength: 8.0,
            // dashGapColor: CustomColors.grey100Color,
            dashGapRadius: 0.0,
          ),
        ],
      ),
    );
  }
}

class ClaimStep {
  final int number;
  final String title;
  final String description;
  final bool isHighlighted;

  ClaimStep({
    required this.number,
    required this.title,
    required this.description,
    this.isHighlighted = false,
  });
}

class StepItem extends StatelessWidget {
  final ClaimStep step;
  final bool isLast;

  const StepItem({
    super.key,
    required this.step,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              Container(
                height: 20.h,
                width: 20.w,
                decoration: BoxDecoration(
                  color: CustomColors.orange50Color,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: CustomColors.orange200Color,
                  ),
                ),
                child: Center(
                  child: boldText(
                    step.number.toString(),
                    fontSize: 12.sp,
                    color: CustomColors.orange500Color,
                  ),
                ),
              ),
              // CircleAvatar(
              //   radius: 20,
              //   backgroundColor: Colors.orange.withOpacity(0.2),
              //   child: Text(
              //     step.number.toString(),
              //     style: TextStyle(
              //       color: Colors.orange[700],
              //       fontWeight: FontWeight.bold,
              //       fontSize: 18,
              //     ),
              //   ),
              // ),
              if (!isLast)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Dash(
                    direction: Axis.vertical,
                    length: 40,
                    dashLength: 6,
                    dashColor: CustomColors.orange200Color,
                  ),
                )
              // Container(
              //   width: 2,
              //   height: 80,
              //   color: Colors.orange.withOpacity(0.2),
              // ),
            ],
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    semiBoldText(
                      step.title,
                      fontSize: 14.sp,
                      color: CustomColors.blackTextColor,
                    ),
                    verticalSpacer(5),
                    mediumText(
                      step.description,
                      fontSize: 12.sp,
                      color: CustomColors.grey800Color,
                    ),
                  ],
                ),
              ),
              if (!isLast) const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}
