import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/constants/route_constants.dart';
import 'package:genius_app/models/screen_prop_models/auto_plans_model.dart';
import 'package:genius_app/models/screen_prop_models/health_plans_model.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';

class MyPlansContainerColor extends StatelessWidget {
  final String title, expiryDate, premium, name, icon;
  final Color bgColor, dividerColor;
  final InsuranceType insuranceType;
  final bool isExpired;
  const MyPlansContainerColor({
    super.key,
    required this.title,
    required this.expiryDate,
    required this.premium,
    // required this.icon,
    // required this.iconColor,
    required this.bgColor,
    required this.dividerColor,
    required this.insuranceType,
    required this.name,
    required this.icon,
    this.isExpired = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (insuranceType == InsuranceType.vehicle) {
          context.pushNamed(
            RouteConstants.autoPlansScreen,
            extra: AutoPlansModel(
              isExpired: isExpired,
            ),
          );
        } else {
          context.pushNamed(
            RouteConstants.healthPlansScreen,
            extra: HealthPlansModel(
              isExpired: isExpired,
            ),
          );
        }
      },
      child: Container(
        // height: 64.h,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(
            color: CustomColors.whiteColor,
            width: 2.w,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight:
                      Radius.circular(8), // Match the parent border radius
                ),
                child: SvgPicture.asset(
                  icon,
                  // color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 18.h),
              child: Column(
                children: [
                  verticalSpacer(3.h),
                  Row(
                    children: [
                      semiBoldText(
                        title,
                        fontSize: 20.sp,
                        color: CustomColors.blueTextColor,
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: isExpired
                              ? CustomColors.red50Color
                              : CustomColors.green50Color,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 14.w, vertical: 6.h),
                          child: boldText(
                            isExpired ? 'Expired' : 'Active',
                            fontSize: 12.sp,
                            color: isExpired
                                ? CustomColors.red500Color
                                : CustomColors.green500Color,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpacer(12.h),
                  Divider(
                    color: dividerColor,
                  ),
                  verticalSpacer(12.h),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          regularText(
                            'Premium',
                            fontSize: 12.sp,
                            color: CustomColors.greenText100Color,
                          ),
                          verticalSpacer(5.h),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "₦",
                                    style: TextStyle(
                                      fontFamily: '',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                      color: CustomColors.greenText100Color,
                                    )),
                                TextSpan(
                                  text: premium,
                                  style: CustomTextStyles.semiBold(
                                    fontSize: 14.sp,
                                    color: CustomColors.greenText100Color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                      Spacer(),
                      Expanded(
                          child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          regularText(
                            'Expiry Date',
                            fontSize: 12.sp,
                            color: CustomColors.greenText100Color,
                          ),
                          verticalSpacer(5.h),
                          semiBoldText(
                            expiryDate,
                            fontSize: 14.sp,
                            color: isExpired
                                ? CustomColors.red500Color
                                : CustomColors.greenText100Color,
                          ),
                        ],
                      ))
                    ],
                  ),
                  verticalSpacer(20.h),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          regularText(
                            insuranceType == InsuranceType.health
                                ? 'Dependants'
                                : insuranceType == InsuranceType.vehicle
                                    ? 'Vehicles'
                                    : insuranceType == InsuranceType.gadget
                                        ? 'Gadgets'
                                        : 'Destination',
                            fontSize: 12.sp,
                            color: CustomColors.greenText100Color,
                          ),
                          verticalSpacer(5.h),
                          isExpired
                              ? SvgPicture.asset(
                                  ConstantString.nullIcon,
                                )
                              : Row(
                                  children: [
                                    Container(
                                      height: 20.h,
                                      width: 20.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: CustomColors.pink500Color,
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          ConstantString.femaleMemoji,
                                          height: 18.h,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 20.h,
                                      width: 20.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: CustomColors.deepYellowColor,
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          ConstantString.maleMemoji,
                                          height: 18.h,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 20.h,
                                      width: 20.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: CustomColors.black100Color,
                                      ),
                                      child: Center(
                                        child: boldText(
                                          '+3',
                                          fontSize: 8.sp,
                                          color: CustomColors.whiteColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                        ],
                      )),
                      Spacer(),
                      Expanded(
                          child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          regularText(
                            'Bought by',
                            fontSize: 12.sp,
                            color: CustomColors.greenText100Color,
                          ),
                          verticalSpacer(5.h),
                          semiBoldText(
                            name,
                            fontSize: 14.sp,
                            color: CustomColors.greenText100Color,
                          ),
                        ],
                      ))
                    ],
                  ),
                  verticalSpacer(30.h),
                  Row(
                    children: [
                      Container(
                        height: 28.h,
                        width: 28.w,
                        decoration: BoxDecoration(
                          color: CustomColors.whiteColor,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            ConstantString.chevronRight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
