import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/deactivate_health_plan_bottom_sheet.dart';
import 'package:genius_app/dialogs_and_popups/bottom_sheets/dependant_removed_bottom_sheet.dart';
import 'package:genius_app/models/screen_prop_models/plan_summary_model.dart';
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

void showPlanAdjustmentBottomSheet(BuildContext context,
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
                              isReActivate
                                  ? ConstantString.powerIcon
                                  : ConstantString.planAdjustIcon,
                              height: 24.h,
                            ),
                            horizontalSpacer(10.w),
                            boldText(
                              isReActivate
                                  ? 'Reactivate Plan'
                                  : 'Plan Adjustment',
                              fontSize: 20.sp,
                              color: CustomColors.green400Color,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        verticalSpacer(32.h),

                        isReActivate
                            ? Padding(
                                padding: EdgeInsets.only(bottom: 20.h),
                                child: semiBoldText(
                                    'Here are a few things to consider before reactivating this plan:',
                                    fontSize: 14.sp,
                                    color: CustomColors.blackTextColor),
                              )
                            : SizedBox.shrink(),

                        isReActivate
                            ? DetailsRow(
                                title: "",
                                titleBody: RichText(
                                  // textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            "Reactivating this plan gives you ",
                                        style: CustomTextStyles.medium(
                                          fontSize: 14.sp,
                                          color: CustomColors.blackTextColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "full ownership, ",
                                        style: CustomTextStyles.semiBold(
                                          fontSize: 14.sp,
                                          color: CustomColors.blackTextColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "meaning you'll be responsible for subsequent renewals.",
                                        style: CustomTextStyles.medium(
                                          fontSize: 14.sp,
                                          color: CustomColors.blackTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : DetailsRow(
                                title: "",
                                titleBody: RichText(
                                  // textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Moving from FlexiCare to ",
                                        style: CustomTextStyles.medium(
                                          fontSize: 14.sp,
                                          color: CustomColors.blackTextColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "FlexiCare Mini ",
                                        style: CustomTextStyles.medium(
                                          fontSize: 14.sp,
                                          color: CustomColors.green500Color,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "adjusts your premium and benefits",
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

                        isReActivate
                            ? DetailsRow(
                                title: "",
                                titleBody: RichText(
                                  // textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            "You'll have full control over your plan, as it will no longer be covered by ",
                                        style: CustomTextStyles.medium(
                                          fontSize: 14.sp,
                                          color: CustomColors.blackTextColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Olumide & Daughters.",
                                        style: CustomTextStyles.semiBold(
                                          fontSize: 14.sp,
                                          color: CustomColors.blackTextColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : DetailsRow(
                                title:
                                    "Your new plan replaces all existing FlexiCare benefits and takes effect immediately after payment.",
                              ),
                        verticalSpacer(20.h),
                        // DetailsRow(
                        //   title: "You’ll need to wait ",
                        // ),
                        DetailsRow(
                          title: "",
                          titleBody: RichText(
                            // textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Moving from FlexiCare to ",
                                  style: CustomTextStyles.medium(
                                    fontSize: 14.sp,
                                    color: CustomColors.blackTextColor,
                                  ),
                                ),
                                TextSpan(
                                  text: "90 days",
                                  style: CustomTextStyles.medium(
                                    fontSize: 14.sp,
                                    color: CustomColors.orange500Color,
                                  ),
                                ),
                                TextSpan(
                                  text: " before making another change.",
                                  style: CustomTextStyles.medium(
                                    fontSize: 14.sp,
                                    color: CustomColors.blackTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        verticalSpacer(48.h),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                title:
                                    isReActivate ? 'Reactivate' : 'Yes, Change',
                                onTap: () {
                                  context.pop();
                                  context.pushNamed(
                                    RouteConstants.planSummaryScreen,
                                    extra: PlanSummaryScreenModel(
                                      planSummaryType:
                                          PlanSummaryType.planAdjustment,
                                    ),
                                  );
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
