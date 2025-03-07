import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
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

void showDeactivateHealthPlanBottomSheet(BuildContext context) {
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
                              'Deactivate FlexiCare Plan',
                              fontSize: 20.sp,
                              color: CustomColors.green400Color,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        verticalSpacer(32.h),
                        semiBoldText(
                          'Before you proceed, here’s what you should know:',
                          fontSize: 16.sp,
                          color: CustomColors.blackTextColor,
                        ),
                        verticalSpacer(20.h),
                        DetailsRow(
                          title:
                              "All benefits under this plan will be terminated.",
                        ),
                        verticalSpacer(20.h),
                        DetailsRow(
                          title:
                              "Any pending claims or ongoing activities will no longer be supported.",
                        ),
                        verticalSpacer(20.h),
                        DetailsRow(
                          title:
                              "No refunds will be issued for partially used months.",
                        ),
                        verticalSpacer(20.h),
                        DetailsRow(
                          title:
                              "All policies linked to this plan will also be deactivated.",
                        ),
                        verticalSpacer(32.h),
                        Divider(
                          color: CustomColors.grey100Color,
                        ),
                        verticalSpacer(32.h),
                        customTextFieldWithText(
                          'email',
                          'Password',
                          title: 'Password',
                          // obscureText: true,
                          onChanged: (value) {
                            // if (value == null || value.isEmpty) {
                            //   is8Characters = false;
                            //   hasOneUppercase = false;
                            //   hasOneLowercase = false;
                            //   hasOneNumber = false;
                            // } else {
                            //   is8Characters = value.length >= 8;
                            //   hasOneUppercase = value.contains(RegExp(r'[A-Z]'));
                            //   hasOneLowercase = value.contains(RegExp(r'[a-z]'));
                            //   hasOneNumber = value.contains(RegExp(r'[0-9]'));
                            // }
                            password = value!;
                            print(password);
                            setState(() {});
                          },
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(
                                  errorText: 'Email field cannot be empty '),
                            ],
                          ),

                          suffix: obscurePassword
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      ConstantString.eyeClosedIcon,
                                    ),
                                  ],
                                )
                              : const Icon(
                                  Icons.remove_red_eye_outlined,
                                  color: CustomColors.grey500Color,
                                ),
                          obscureText: obscurePassword,

                          onSuffixTap: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                        ),
                        verticalSpacer(40.h),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                title: 'Deactivate plan',
                                textColor: CustomColors.whiteColor,
                                buttonColor: CustomColors.red500Color,
                                onTap: StringUtils.isNullOrEmpty(password)
                                    ? null
                                    : () {
                                        context.pop();
                                        context.pop();
                                        context.pop();
                                        context.pop();
                                        // showDependantRemovedBottomSheet(context);
                                      },
                              ),
                            ),
                            horizontalSpacer(15.w),
                            Expanded(
                              child: CustomButton(
                                title: 'Keep my plan',
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

class DetailsRow extends StatelessWidget {
  final String title;
  final Widget? titleBody;
  final Color? cicleColor;
  const DetailsRow({
    super.key,
    required this.title,
    this.titleBody,
    this.cicleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 8.h,
          width: 8.w,
          decoration: BoxDecoration(
            color: cicleColor ?? CustomColors.orange500Color,
            shape: BoxShape.circle,
          ),
        ),
        horizontalSpacer(10.w),
        Expanded(
          child: titleBody ??
              mediumText(
                title,
                fontSize: 14.sp,
                color: CustomColors.blackTextColor,
                // textAlign: TextAlign.center,
              ),
        ),
      ],
    );
  }
}
