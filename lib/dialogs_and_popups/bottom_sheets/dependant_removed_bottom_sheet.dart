import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

void showDependantRemovedBottomSheet(BuildContext context) {
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
                            'Dependant Removed',
                            fontSize: 20.sp,
                            color: CustomColors.green400Color,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      verticalSpacer(32.h),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "This dependant - ",
                              style: CustomTextStyles.medium(
                                color: CustomColors.greenTextColor,
                                fontSize: 16.sp,
                              ),
                            ),
                            TextSpan(
                              text: "Clarisse Ukaegbu ",
                              style: CustomTextStyles.medium(
                                color: CustomColors.green500Color,
                                fontSize: 16.sp,
                              ),
                            ),
                            TextSpan(
                              text: "has been removed successfully.",
                              style: CustomTextStyles.medium(
                                color: CustomColors.greenTextColor,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpacer(40.h),
                      SvgPicture.asset(
                        ConstantString.trashIcon,
                      ),
                      verticalSpacer(60.h),
                      CustomButton(
                        title: 'Noted',
                        onTap: () {
                          context.pop();
                          context.pop();
                        },
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
}
