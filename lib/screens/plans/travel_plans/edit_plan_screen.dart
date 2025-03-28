import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

class EditPlanScreen extends StatefulWidget {
  const EditPlanScreen({
    super.key,
  });

  @override
  State<EditPlanScreen> createState() => _EditPlanScreenState();
}

class _EditPlanScreenState extends State<EditPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacer(MediaQuery.of(context).padding.top + 20.h),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: SvgPicture.asset(
                    ConstantString.backButtonIcon,
                  ),
                ),
              ],
            ),
            verticalSpacer(23.h),
            semiBoldText(
              'Edit Plan',
              fontSize: 20.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(8.h),
            mediumText(
              'Adjust your plan details to suit your needs.',
              fontSize: 14.sp,
              color: CustomColors.primaryGreenColor,
            ),
            verticalSpacer(43.h),
            EditPlanOptions(
              title: 'Cover Period',
              subtitle: 'Manage the duration of your plan',
              icon: ConstantString.coverPeriodIcon,
              onTap: () {
                // context.pop();
                context.pushNamed(
                  RouteConstants.planDurationScreen,
                );
              },
            ),
            verticalSpacer(24.h),
            EditPlanOptions(
              title: 'Auto renewal',
              subtitle: 'Be secured, keep auto-renewal on.',
              icon: ConstantString.autoRenewalCloudIcon,
              onTap: () {
                // context.pop();
                context.pushNamed(
                  RouteConstants.autoRenewalScreen,
                );
              },
            ),
            verticalSpacer(24.h),
            EditPlanOptions(
              title: 'Deactivate Plan',
              subtitle: 'Be in charge of your plan',
              icon: ConstantString.deactivatePlanIcon,
              onTap: () {
                // context.pop();
                context.pushNamed(
                  RouteConstants.deactivatePlanScreen,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class EditPlanOptions extends StatelessWidget {
  final String title, subtitle, icon;
  final void Function()? onTap;

  const EditPlanOptions({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.whiteColor,
          border: Border.all(
            color: CustomColors.grey50Color,
          ),
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.005), // Subtle shadow color
              blurRadius: 2, // Softness of the shadow
              spreadRadius: 1, // Slight expansion
              offset: Offset(0, 1), // Vertical movement of the shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 12.w,
            vertical: 37.h,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
              ),
              horizontalSpacer(8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    semiBoldText(
                      title,
                      fontSize: 16.sp,
                      color: CustomColors.blackTextColor,
                    ),
                    verticalSpacer(3.h),
                    mediumText(
                      subtitle,
                      fontSize: 14.sp,
                      color: CustomColors.grey600Color,
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(
                ConstantString.chevronRight,
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
