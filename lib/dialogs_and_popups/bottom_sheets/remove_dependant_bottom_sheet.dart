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

void showRemoveDependantBottomSheet(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
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
                              ConstantString.editDependantIcon,
                            ),
                            horizontalSpacer(10.w),
                            boldText(
                              'Remove Dependant',
                              fontSize: 20.sp,
                              color: CustomColors.green400Color,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        verticalSpacer(32.h),
                        mediumText(
                          'You’re about to remove Alex Igwe as a dependant. Once removed, they will lose access to this plan and its benefits.',
                          fontSize: 14.sp,
                          color: CustomColors.blackTextColor,
                          textAlign: TextAlign.center,
                        ),
                        verticalSpacer(32.h),
                        Row(
                          children: [
                            GridRadioChipContainer(
                              title: "Instant removal",
                              subtitle:
                                  'Removes the dependant, losing access to all benefits immediately.',
                              icon: ConstantString.maleIcon,
                              isSelected:
                                  removalType == RemoveDependantType.instant,
                              onTap: () => setState(() {
                                removalType = RemoveDependantType.instant;
                              }),
                            ),
                            horizontalSpacer(8.w),
                            GridRadioChipContainer(
                              title: "Awaiting removal",
                              subtitle:
                                  'Removes the dependant, losing access to all benefits at the end of the monthly renewal cycle.',
                              icon: ConstantString.femaleIcon,
                              isSelected:
                                  removalType == RemoveDependantType.awaiting,
                              onTap: () => setState(() {
                                removalType = RemoveDependantType.awaiting;
                              }),
                            ),
                          ],
                        ),
                        verticalSpacer(60.h),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                title: 'Yes, remove',
                                textColor: CustomColors.whiteColor,
                                buttonColor: CustomColors.red500Color,
                                onTap: removalType == null
                                    ? null
                                    : () {
                                        context.pop();
                                        showDependantRemovedBottomSheet(
                                            context);
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
                        verticalSpacer(
                            MediaQuery.of(context).padding.bottom + 50),
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
