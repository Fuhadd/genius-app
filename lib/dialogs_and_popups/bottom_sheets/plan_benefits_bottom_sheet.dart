import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/custom_text_styles.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:genius_app/widgets/dotted_separator.dart';

// Main widget for the screen
class PlanBenefitsBottomSheet extends StatelessWidget {
  const PlanBenefitsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Section 1: Benefits after 24hrs of purchase
            verticalSpacer(32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ConstantString.planBenefitIcon,
                ),
                horizontalSpacer(12.w),
                Column(
                  children: [
                    Text(
                      'Plan benefits',
                      style: CustomTextStyles.bold(fontSize: 20.sp),
                    ),
                  ],
                ),
              ],
            ),
            verticalSpacer(32.h),

            Container(
              height: 48.h,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: CustomColors.orange50Color,
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.only(left: 10.w, right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  boldText('Benefits after 24hrs of purchase', fontSize: 14.sp),
                  SvgPicture.asset(ConstantString.chevronUp),
                ],
              ),
            ),
            verticalSpacer(10.h),
            // Section 2: General consultation
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlanBenefitSectionSingleItemWidget(
                    titleWidget:
                        semiBoldText('General consultation', fontSize: 14.sp),
                    bulletPoints: [
                      'Treatment of basic medical outpatient and in-patient cases',
                    ]),
                verticalSpacer(12.h),
                DottedSeparator(
                  color: CustomColors.grey100Color,
                ),
                verticalSpacer(12.h),
                PlanBenefitSectionSingleItemWidget(
                  titleWidget: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Specialist Consultations - ',
                          style: CustomTextStyles.semiBold(
                            color: CustomColors.primaryGreenColor,
                            fontSize: 14.sp,
                          )),
                      TextSpan(
                          text: '(Once/Month)',
                          style: CustomTextStyles.semiBold(
                            color: CustomColors.green500Color,
                            fontSize: 14.sp,
                          ))
                    ]),
                  ),
                  bulletPoints: [
                    'Limited to O and G specialist ,Pediatrician, General Surgeon, Cardiothoracic Surgeon, Neurosurgeon, ENT Surgeon, Urologist, Orthopedic Surgeon, Gastroenterologist, Cardiologist, Neurologist, Nephrologist, Psychiatrist, Neonatologist'
                  ],
                ),
                verticalSpacer(12.h),
                DottedSeparator(
                  color: CustomColors.grey100Color,
                ),
                verticalSpacer(12.h),
                PlanBenefitSectionSingleItemWidget(
                  titleWidget: semiBoldText(
                      '24 Hours free chat access to healthcare professionals',
                      fontSize: 14.sp),
                  bulletPoints: [
                    'Free chats with Doctors and Nurses when in need of care during any medical emergency',
                    'Free chats with Doctors and Nurses when in need of any routine medical information',
                    'Free Telemedicine app',
                  ],
                ),
                verticalSpacer(12.h),
                DottedSeparator(
                  color: CustomColors.grey100Color,
                ),
                verticalSpacer(12.h),
                PlanBenefitSectionSingleItemWidget(
                  titleWidget: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Diagnostics and imaging - ',
                          style: CustomTextStyles.semiBold(
                            color: CustomColors.primaryGreenColor,
                            fontSize: 14.sp,
                          )),
                      TextSpan(
                          text: 'CT/M.R.I Scan Only',
                          style: CustomTextStyles.semiBold(
                            color: CustomColors.green500Color,
                            fontSize: 14.sp,
                          ))
                    ]),
                  ),
                  bulletPoints: [
                    'Limited to Chest X-Rays, Plain Abdominal X-Rays, Limb X-rays, Neck X-rays,Skull X-rays, Lumbosacral X-Rays, X-rays of Body Joints, Ultrasound Scan',
                    'CT/M.R.I Scan Only (Emergency/Up to A&E Limit)',
                  ],
                ),
                verticalSpacer(12.h),
                DottedSeparator(
                  color: CustomColors.grey100Color,
                ),
                verticalSpacer(12.h),
                PlanBenefitSectionSingleItemWidget(
                    titleWidget:
                        semiBoldText('Laboratory Tests', fontSize: 14.sp),
                    bulletPoints: [
                      'Haematological tests',
                      'Chemistry',
                      'Microbiology',
                    ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PlanBenefitSectionSingleItemWidget extends StatelessWidget {
  const PlanBenefitSectionSingleItemWidget({
    super.key,
    required this.titleWidget,
    required this.bulletPoints,
    this.bulletPointPadding,
    this.bulletPointfontSize,
  });

  final Widget titleWidget;
  final List<String> bulletPoints;
  final EdgeInsets? bulletPointPadding;
  final double? bulletPointfontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 62.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          titleWidget,
          verticalSpacer(10.h),
          ListView.builder(
            itemCount: bulletPoints.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: bulletPointPadding ?? EdgeInsets.zero,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          ConstantString.ellipseIcon,
                          colorFilter: ColorFilter.mode(
                              CustomColors.orange500Color, BlendMode.srcIn),
                        ),
                        horizontalSpacer(10.w),
                        Expanded(
                          child: mediumText(bulletPoints[index],
                              color: CustomColors.grey800Color,
                              fontSize: bulletPointfontSize ?? 12.sp),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
