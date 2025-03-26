import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/screens/onboarding/account_verified_screen.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_button.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

void showVehicleDetailsSubmittedBottomSheet(
  BuildContext context,
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
                            'Vehicle details submitted',
                            fontSize: 20.sp,
                            color: CustomColors.green400Color,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      verticalSpacer(32.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2),
                        child: mediumText(
                          'Proceed to complete activation by inspecting your vehicle. It takes 2-5 minutes to complete.',
                          color: CustomColors.greenTextColor,
                          fontSize: 16.sp,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      verticalSpacer(40.h),
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: AlignmentDirectional.center,
                        children: [
                          RotatingSvg(),
                          SvgPicture.asset(ConstantString.checkmark),
                        ],
                      ),
                      // SvgPicture.asset(
                      //   ConstantString.trashIcon,
                      // ),
                      verticalSpacer(60.h),
                      CustomButton(
                        title: 'Proceed to inspect',
                        onTap: () {
                          context.pop();
                          context.pop();
                          context.pop();
                          context.pop();
                        },
                      ),

                      verticalSpacer(16.h),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            context.pop();
                            context.pop();
                            context.pop();
                            context.pop();
                            // if (widget.data.dependantType ==
                            //     NewDependantType.noUniqueEmail) {
                            //   context.pop();
                            // }
                          },
                          child: boldText(
                            'Inspect another time',
                            fontSize: 16.sp,
                            color: CustomColors.green500Color,
                          ),
                        ),
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
