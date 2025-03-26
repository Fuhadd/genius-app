import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
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

void showAutoPlanBenefitsBottomSheet(BuildContext context,
    {bool isReActivate = false}) {
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        verticalSpacer(28.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              ConstantString.planBenefitIcon,
                              height: 32.h,
                            ),
                            horizontalSpacer(10.w),
                            boldText(
                              'Plan Benefits',
                              fontSize: 20.sp,
                              color: CustomColors.green400Color,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        verticalSpacer(28.h),
                        PlanBenefitContainer(
                          title: 'Cover period',
                          subtitle: 'Monthly, Quarterly, Bi-annual & Annual',
                        ),
                        PlanBenefitContainer(
                          title: 'Third party bodily injuries',
                          subtitle: 'Covered',
                        ),
                        PlanBenefitContainer(
                          title: 'Accidental damage on third party',
                          subtitle: 'Covered',
                        ),
                        PlanBenefitContainer(
                          title: 'Accidental damage on your vehicle',
                          subtitle: 'Based on the vehicle value insured',
                        ),
                        PlanBenefitContainer(
                          title: 'Theft',
                          subtitle: 'Covered',
                        ),
                        PlanBenefitContainer(
                          title: 'Fire',
                          subtitle: 'Covered',
                        ),
                        PlanBenefitContainer(
                          title: 'Free tracker',
                          subtitle: 'For vehicles above N6,000,000',
                        ),
                        verticalSpacer(72.h),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
      });
}

class PlanBenefitContainer extends StatelessWidget {
  final String title, subtitle;
  const PlanBenefitContainer({
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
              Container(
                height: 5.h,
                width: 5.w,
                decoration: BoxDecoration(
                  color: CustomColors.orange500Color,
                  shape: BoxShape.circle,
                ),
              ),
              horizontalSpacer(10.w),
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
