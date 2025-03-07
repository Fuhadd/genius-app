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

void showTurnOffRenewalBottomSheet(BuildContext context) {
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
                              ConstantString.autoRenewalCloudIcon,
                              height: 32.h,
                            ),
                            horizontalSpacer(10.w),
                            boldText(
                              'Turn Off Auto Renewal',
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
                              child: mediumText(
                                "Without auto-renewal, you'll need to renew manually to stay covered.",
                                fontSize: 14.sp,
                                color: CustomColors.blackTextColor,
                                // textAlign: TextAlign.center,
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
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Need help? Contact our ",
                                      style: CustomTextStyles.medium(
                                        color: CustomColors.blackTextColor,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "support team",
                                      style: CustomTextStyles.medium(
                                        color: CustomColors.orange500Color,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ".",
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
                        verticalSpacer(48.h),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                title: 'Call support',
                                onTap: () {
                                  context.pop();
                                  // showDependantRemovedBottomSheet(context);
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
