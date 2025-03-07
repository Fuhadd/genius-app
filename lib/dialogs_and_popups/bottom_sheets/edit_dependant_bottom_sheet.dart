import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';

void showEditDependantBottomSheet(BuildContext context) {
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
                            'Edit Dependant',
                            fontSize: 20.sp,
                            color: CustomColors.green400Color,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      verticalSpacer(32.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "To edit this policy’s detail, reach out to our ",
                                style: CustomTextStyles.medium(
                                  color: CustomColors.blackTextColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                              TextSpan(
                                text: "support team.",
                                style: CustomTextStyles.medium(
                                  color: CustomColors.orange500Color,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      verticalSpacer(50.h),
                      CustomButton(
                        title: 'Contact Support',
                        onTap: () {},
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
