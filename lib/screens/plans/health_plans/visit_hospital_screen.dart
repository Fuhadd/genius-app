import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius_app/constants/custom_colors.dart';
import 'package:genius_app/constants/custom_string.dart';
import 'package:genius_app/utils/enum.dart';
import 'package:genius_app/utils/spacers.dart';
import 'package:genius_app/widgets/custom_text_widget.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class VisitHospitalScreen extends StatefulHookConsumerWidget {
  const VisitHospitalScreen({
    super.key,
  });

  @override
  ConsumerState<VisitHospitalScreen> createState() =>
      _VisitHospitalScreenState();
}

class _VisitHospitalScreenState extends ConsumerState<VisitHospitalScreen> {
  HospitalCategory selectedCategory = HospitalCategory.all;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgWhiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
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
                    'Visit Hospital',
                    fontSize: 20.sp,
                    color: CustomColors.primaryGreenColor,
                  ),
                  verticalSpacer(8.h),
                  mediumText(
                    'Choose your best medical provider to access care',
                    fontSize: 14.sp,
                    color: CustomColors.primaryGreenColor,
                  ),
                  verticalSpacer(43.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        HospitalTypeContainer(
                          title: 'All',
                          icon: ConstantString.allHospitalIcon,
                          isSelected: selectedCategory == HospitalCategory.all,
                          onTap: () {
                            setState(() {
                              selectedCategory = HospitalCategory.all;
                            });
                          },
                        ),
                        HospitalTypeContainer(
                          title: 'Hospital',
                          icon: ConstantString.blueHospitalIcon,
                          isSelected:
                              selectedCategory == HospitalCategory.hospital,
                          onTap: () {
                            setState(() {
                              selectedCategory = HospitalCategory.hospital;
                            });
                          },
                        ),
                        HospitalTypeContainer(
                          title: 'Eyecare',
                          icon: ConstantString.eyecareIcon,
                          isSelected:
                              selectedCategory == HospitalCategory.eyecare,
                          onTap: () {
                            setState(() {
                              selectedCategory = HospitalCategory.eyecare;
                            });
                          },
                        ),
                        HospitalTypeContainer(
                          title: 'Dental care',
                          icon: ConstantString.dentalIcon,
                          isSelected:
                              selectedCategory == HospitalCategory.dental,
                          onTap: () {
                            setState(() {
                              selectedCategory = HospitalCategory.dental;
                            });
                          },
                        ),
                        HospitalTypeContainer(
                          title: 'Pharmacy',
                          icon: ConstantString.pharmacyIcon,
                          isSelected:
                              selectedCategory == HospitalCategory.pharmacy,
                          onTap: () {
                            setState(() {
                              selectedCategory = HospitalCategory.pharmacy;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  verticalSpacer(32.h),
                  semiBoldText(
                    'Hospitals around me',
                    fontSize: 16.sp,
                    color: CustomColors.primaryGreenColor,
                  ),
                  verticalSpacer(24.h),
                  Row(
                    children: [
                      Container(
                        height: 48.h,
                        width: 48.w,
                        decoration: BoxDecoration(
                          color: CustomColors.whiteColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.005), // Subtle shadow color
                              blurRadius: 2, // Softness of the shadow
                              spreadRadius: 1, // Slight expansion
                              offset: Offset(
                                  0, 1), // Vertical movement of the shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            ConstantString.greyHospitalIcon,
                          ),
                        ),
                      ),
                      horizontalSpacer(12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            mediumText(
                              'Turn on your device location to see hospitals around you',
                              fontSize: 14.sp,
                              color: CustomColors.grey600Color,
                            ),
                            verticalSpacer(5.h),
                            boldText(
                              'Turn on location',
                              fontSize: 14.sp,
                              color: CustomColors.green500Color,
                            ),
                          ],
                        ),
                      ),
                      horizontalSpacer(10.w),
                    ],
                  ),
                  verticalSpacer(40.h),
                  semiBoldText(
                    'Explore more options',
                    fontSize: 16.sp,
                    color: CustomColors.primaryGreenColor,
                  ),
                  verticalSpacer(16.h),
                  HospitalOptions(
                    title: 'St Alex Hospital',
                    subtitle: 'Plot 12 Safe Street',
                    icon: ConstantString.blueHospitalIcon,
                  ),
                  HospitalOptions(
                    title: 'St Alex Dental',
                    subtitle: 'Plot 12 Safe Street',
                    icon: ConstantString.dentalIcon,
                  ),
                  HospitalOptions(
                    title: 'St Alex Eye care',
                    subtitle: 'Plot 12 Safe Street',
                    icon: ConstantString.eyecareIcon,
                  ),
                  HospitalOptions(
                    title: 'St Joe Pharmacy',
                    subtitle: 'Plot 12 Safe Street',
                    icon: ConstantString.pharmacyIcon,
                  ),
                  HospitalOptions(
                    title: 'St Alex Hospital',
                    subtitle: 'Plot 12 Safe Street',
                    icon: ConstantString.blueHospitalIcon,
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

class HospitalOptions extends StatelessWidget {
  final String title, subtitle, icon;
  const HospitalOptions({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpacer(10.h),
        Row(
          children: [
            Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                color: CustomColors.lightBlueColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color:
                        Colors.black.withOpacity(0.005), // Subtle shadow color
                    blurRadius: 2, // Softness of the shadow
                    spreadRadius: 1, // Slight expansion
                    offset: Offset(0, 1), // Vertical movement of the shadow
                  ),
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  icon,
                ),
              ),
            ),
            horizontalSpacer(12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  semiBoldText(
                    title,
                    fontSize: 14.sp,
                    color: CustomColors.blackTextColor,
                  ),
                  verticalSpacer(5.h),
                  Row(
                    children: [
                      mediumText(
                        subtitle,
                        fontSize: 12.sp,
                        color: CustomColors.grey600Color,
                      ),
                      horizontalSpacer(2.w),
                      Container(
                        decoration: BoxDecoration(
                          color: CustomColors.green50Color,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 2.h),
                          child: semiBoldText(
                            'Lagos',
                            fontSize: 8.sp,
                            color: CustomColors.greenTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            horizontalSpacer(10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      ConstantString.starFilledIcon,
                    ),
                    SvgPicture.asset(
                      ConstantString.starFilledIcon,
                    ),
                    SvgPicture.asset(
                      ConstantString.starFilledIcon,
                    ),
                    SvgPicture.asset(
                      ConstantString.starIcon,
                    ),
                    SvgPicture.asset(
                      ConstantString.starIcon,
                    ),
                  ],
                ),
                verticalSpacer(8.h),
                Row(
                  children: [
                    semiBoldText(
                      'View',
                      fontSize: 14.sp,
                      color: CustomColors.green500Color,
                    ),
                    horizontalSpacer(11.w),
                    SvgPicture.asset(
                      ConstantString.chevronRight,
                      height: 12.h,
                      color: CustomColors.green500Color,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        verticalSpacer(10.h),
        Divider()
      ],
    );
  }
}

class HospitalTypeContainer extends StatelessWidget {
  final String title, icon;
  final bool isSelected;
  final void Function()? onTap;
  const HospitalTypeContainer({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 72.h,
              width: 72.w,
              decoration: BoxDecoration(
                color: CustomColors.whiteColor,
                shape: BoxShape.circle,
                border: isSelected
                    ? Border.all(
                        color: CustomColors.green500Color,
                      )
                    : null,
                boxShadow: [
                  BoxShadow(
                    color:
                        Colors.black.withOpacity(0.005), // Subtle shadow color
                    blurRadius: 2, // Softness of the shadow
                    spreadRadius: 1, // Slight expansion
                    offset: Offset(0, 1), // Vertical movement of the shadow
                  ),
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  icon,
                ),
              ),
            ),
            verticalSpacer(8.h),
            isSelected
                ? boldText(
                    title,
                    fontSize: 12.sp,
                    color: CustomColors.green500Color,
                  )
                : semiBoldText(
                    title,
                    fontSize: 12.sp,
                    color: CustomColors.grey800Color,
                  ),
          ],
        ),
      ),
    );
  }
}
