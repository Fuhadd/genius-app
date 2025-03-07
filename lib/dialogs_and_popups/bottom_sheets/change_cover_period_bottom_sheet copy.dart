import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/dependant_removed_bottom_sheet.dart';
import 'package:genius_app/models/screen_prop_models/plan_summary_model.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:genius_app/widgets/grid_options_container.dart';
import 'package:genius_app/widgets/grid_radio_chip_container.dart';
import 'package:go_router/go_router.dart';

void showChangeCoverPeriodBottomSheet(BuildContext context) {
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
        RemoveDependantType? removalType;
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
                        verticalSpacer(30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              ConstantString.coverPeriodIcon,
                            ),
                            horizontalSpacer(10.w),
                            boldText(
                              'Change Cover Period',
                              fontSize: 20.sp,
                              color: CustomColors.green400Color,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        verticalSpacer(32.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 8.h,
                              width: 8.w,
                              decoration: BoxDecoration(
                                color: CustomColors.orange500Color,
                                shape: BoxShape.circle,
                              ),
                            ),
                            horizontalSpacer(10.w),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          "Updating your cover period will adjust your total premium from ",
                                      style: CustomTextStyles.medium(
                                        color: CustomColors.blackTextColor,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    TextSpan(
                                        text: "₦",
                                        style: TextStyle(
                                          fontFamily: '',
                                          fontWeight: FontWeight.w500,
                                          color: CustomColors.blackTextColor,
                                          fontSize: 14.sp,
                                        )),
                                    TextSpan(
                                      text: "17,500 (",
                                      style: CustomTextStyles.medium(
                                        color: CustomColors.blackTextColor,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    TextSpan(
                                        text: "₦",
                                        style: TextStyle(
                                          fontFamily: '',
                                          fontWeight: FontWeight.w500,
                                          color: CustomColors.blackTextColor,
                                          fontSize: 14.sp,
                                        )),
                                    TextSpan(
                                      text: "3,500 per person monthly) to ",
                                      style: CustomTextStyles.medium(
                                        color: CustomColors.blackTextColor,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    TextSpan(
                                        text: "₦",
                                        style: TextStyle(
                                          fontFamily: '',
                                          fontWeight: FontWeight.w500,
                                          color: CustomColors.green500Color,
                                          fontSize: 14.sp,
                                        )),
                                    TextSpan(
                                      text: "105,000 ",
                                      style: CustomTextStyles.medium(
                                        color: CustomColors.green500Color,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    TextSpan(
                                        text: "₦",
                                        style: TextStyle(
                                          fontFamily: '',
                                          fontWeight: FontWeight.w500,
                                          color: CustomColors.blackTextColor,
                                          fontSize: 14.sp,
                                        )),
                                    TextSpan(
                                      text: "21,000 per person bi-annually).",
                                      style: CustomTextStyles.medium(
                                        color: CustomColors.blackTextColor,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalSpacer(20.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 8.h,
                              width: 8.w,
                              decoration: BoxDecoration(
                                color: CustomColors.orange500Color,
                                shape: BoxShape.circle,
                              ),
                            ),
                            horizontalSpacer(10.w),
                            Expanded(
                              child: mediumText(
                                'The new premium will take effect at your next renewal.',
                                fontSize: 14.sp,
                                color: CustomColors.blackTextColor,
                                // textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        verticalSpacer(48.h),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                title: 'Yes Continue',
                                onTap: () {
                                  context.pop();
                                  context.pushNamed(
                                    RouteConstants.planSummaryScreen,
                                    extra: PlanSummaryScreenModel(
                                      planSummaryType:
                                          PlanSummaryType.changeCoverPeriod,
                                    ),
                                  );
                                },
                              ),
                            ),
                            horizontalSpacer(15.w),
                            Expanded(
                              child: CustomButton(
                                title: 'Cancel',
                                textColor: CustomColors.green400Color,
                                borderColor: CustomColors.green400Color,
                                buttonColor: Colors.transparent,
                                onTap: () {
                                  context.pop();
                                },
                              ),
                            ),
                          ],
                        ),
                        verticalSpacer(100.h),
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
