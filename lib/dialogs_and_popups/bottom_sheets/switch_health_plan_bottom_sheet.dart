import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/deactivate_health_plan_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/dependant_removed_bottom_sheet.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/utils/string_utils.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_field.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:genius_app/widgets/grid_options_container.dart';
import 'package:genius_app/widgets/grid_radio_chip_container.dart';
import 'package:go_router/go_router.dart';

void showSwitchHealthPlanBottomSheet(BuildContext context) {
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
        bool obscurePassword = true;
        String password = "";
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
                              ConstantString.trashIcon,
                              height: 24.h,
                            ),
                            horizontalSpacer(10.w),
                            boldText(
                              'Switch Plan Instead',
                              fontSize: 20.sp,
                              color: CustomColors.green400Color,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        verticalSpacer(32.h),
                        DetailsRow(
                          title:
                              "We see you want to deactivate your plan because you're considering a switch.",
                        ),
                        verticalSpacer(20.h),
                        DetailsRow(
                          title: "",
                          titleBody: RichText(
                            // textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Instead of canceling, you can ",
                                  style: CustomTextStyles.medium(
                                    fontSize: 14.sp,
                                    color: CustomColors.blackTextColor,
                                  ),
                                ),
                                TextSpan(
                                  text: "upgrade or adjust to a smaller plan ",
                                  style: CustomTextStyles.semiBold(
                                    fontSize: 14.sp,
                                    color: CustomColors.blackTextColor,
                                  ),
                                ),
                                TextSpan(
                                  text: "without losing coverage.",
                                  style: CustomTextStyles.medium(
                                    fontSize: 14.sp,
                                    color: CustomColors.blackTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        verticalSpacer(20.h),
                        DetailsRow(
                          title: "Would you like to switch plans instead?",
                        ),
                        verticalSpacer(48.h),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                title: 'Yes, Switch Plan',
                                onTap: () {
                                  context.pop();
                                  // showDependantRemovedBottomSheet(context);
                                },
                              ),
                            ),
                            horizontalSpacer(15.w),
                            Expanded(
                              child: CustomButton(
                                title: 'No, Deactivate',
                                textColor: CustomColors.red500Color,
                                borderColor: CustomColors.red500Color,
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
