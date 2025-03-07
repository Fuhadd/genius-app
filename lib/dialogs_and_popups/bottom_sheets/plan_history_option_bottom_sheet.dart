import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/dependant_removed_bottom_sheet.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:genius_app/widgets/grid_options_container.dart';
import 'package:genius_app/widgets/grid_radio_chip_container.dart';
import 'package:go_router/go_router.dart';

void showPlanHistoryOptionBottomSheet(
  BuildContext context,
  String title,
) {
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
                            boldText(
                              title,
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
                              height: 24.h,
                              width: 24.w,
                              decoration: BoxDecoration(
                                color: CustomColors.grey100Color,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  ConstantString.roundProfileIcon,
                                  height: 12.h,
                                  color: CustomColors.grey500Color,
                                ),
                              ),
                            ),
                            horizontalSpacer(10.w),
                            Expanded(
                              child: semiBoldText(
                                'Clarisse Ukaegbu',
                                fontSize: 14.sp,
                                color: CustomColors.blackTextColor,
                              ),
                            ),
                            horizontalSpacer(10.w),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: mediumText(
                                  'Policy I.D: 160003/0',
                                  fontSize: 12.sp,
                                  color: CustomColors.blackTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalSpacer(20.h),
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
                        verticalSpacer(20.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 24.h,
                              width: 24.w,
                              decoration: BoxDecoration(
                                color: CustomColors.grey100Color,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  ConstantString.roundProfileIcon,
                                  height: 12.h,
                                  color: CustomColors.grey500Color,
                                ),
                              ),
                            ),
                            horizontalSpacer(10.w),
                            Expanded(
                              child: semiBoldText(
                                'Clarisse Ukaegbu',
                                fontSize: 14.sp,
                                color: CustomColors.blackTextColor,
                              ),
                            ),
                            horizontalSpacer(10.w),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: mediumText(
                                  'Policy I.D: 160003/0',
                                  fontSize: 12.sp,
                                  color: CustomColors.blackTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalSpacer(20.h),
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
                        verticalSpacer(20.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 24.h,
                              width: 24.w,
                              decoration: BoxDecoration(
                                color: CustomColors.grey100Color,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  ConstantString.roundProfileIcon,
                                  height: 12.h,
                                  color: CustomColors.grey500Color,
                                ),
                              ),
                            ),
                            horizontalSpacer(10.w),
                            Expanded(
                              child: semiBoldText(
                                'Clarisse Ukaegbu',
                                fontSize: 14.sp,
                                color: CustomColors.blackTextColor,
                              ),
                            ),
                            horizontalSpacer(10.w),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: mediumText(
                                  'Policy I.D: 160003/0',
                                  fontSize: 12.sp,
                                  color: CustomColors.blackTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalSpacer(20.h),
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
                        verticalSpacer(70.h),
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
